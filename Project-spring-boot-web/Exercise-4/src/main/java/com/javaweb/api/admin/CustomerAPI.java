package com.javaweb.api.admin;


import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.service.CustomerService;
import com.javaweb.service.IUserService;
import com.javaweb.service.impl.UserService;
import com.javaweb.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Transactional
@RestController(value ="customerAPIOfAdmin")
@RequestMapping("/api/customer")
public class CustomerAPI {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private IUserService userServiceImpl;
    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id) {
        ResponseDTO result = new ResponseDTO();
        List<StaffResponseDTO> list = userServiceImpl.getAllStaffOfCustomer(id);
        result.setData(list);
        return result;
    };

    @PostMapping("/assignment")
    public void assignCustomer(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO) {
        customerService.assignCustomer(assignmentCustomerDTO);
    };

    @PostMapping
    public ResponseEntity<?> addOrUpdate(@Valid @ModelAttribute CustomerDTO customerDTO, BindingResult result) {
        if(result.hasErrors()) {
            List<String> errorMessages = result.getFieldErrors()
                    .stream()
                    .map(FieldError::getDefaultMessage)
                    .collect(Collectors.toList());
            String message = errorMessages.stream().collect(Collectors.joining("\n"));
            return ResponseEntity.badRequest().body(message);
        }
        customerService.addOrUpdate(customerDTO);
        return ResponseEntity.ok("");
    };
    @DeleteMapping("/{ids}")
    public void deleteCustomer(@PathVariable("ids") List<Long> ids) {
        customerService.deleteCustomers(ids);
    }

}
