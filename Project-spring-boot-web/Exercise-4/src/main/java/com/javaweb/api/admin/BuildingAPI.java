package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.service.BuildingService;
import com.javaweb.service.IUserService;
import com.javaweb.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;

@Transactional
@RestController(value ="buildingAPIOfAdmin")
@RequestMapping("/api/building")
public class BuildingAPI {
    @Autowired
    private BuildingService buildingService;
    @Autowired
    private IUserService userServiceImpl;

    @PostMapping
    public ResponseEntity<?> addOrUpdateBuilding(@Valid @RequestBody BuildingDTO buildingDTO, BindingResult result) {
        if(result.hasErrors()){
            List<String> errorMessages = result.getFieldErrors()
                    .stream()
                    .map(FieldError::getDefaultMessage)
                    .collect(Collectors.toList());
            String message = errorMessages.stream().collect(Collectors.joining("\n"));
            return ResponseEntity.badRequest().body(message);
        }
        buildingService.addAndUpdateBuilding(buildingDTO);
        return ResponseEntity.ok("");

    }

    @DeleteMapping("/{ids}")
    public void deleteBuilding(@PathVariable List<Long> ids){
        buildingService.deleteBuilding(ids);
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id) {
        ResponseDTO result = new ResponseDTO();
        List<StaffResponseDTO> list = userServiceImpl.getAllStaff(id);
        result.setData(list);
        return result;
    };

    @PostMapping("/assignment")
    public void asignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
       buildingService.assignmentBuilding(assignmentBuildingDTO.getBuildingId(),assignmentBuildingDTO.getStaffs());
    }
}
