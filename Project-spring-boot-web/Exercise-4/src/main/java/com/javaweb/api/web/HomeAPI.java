package com.javaweb.api.web;

import com.javaweb.model.dto.RegisterDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.service.IUserService;
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
@RestController
@RequestMapping("/api")
public class HomeAPI {
    @Autowired
    private IUserService userService;
    @PostMapping(value = "/register")
    public ResponseEntity<?> createAccount(@Valid  @ModelAttribute RegisterDTO registerDTO,
                                           BindingResult result) {
        try{
            if(result.hasErrors()){
//            List<String> errorMessages = result.getFieldErrors()
//                    .stream()
//                    .map(FieldError::getDefaultMessage)
//                    .toList();
                // java 11
                List<String> errorMessages = result.getFieldErrors()
                        .stream()
                        .map(FieldError::getDefaultMessage)
                        .collect(Collectors.toList());
                String message = errorMessages.stream().collect(Collectors.joining("\n"));
                return ResponseEntity.badRequest().body(message);
            }
//            if(!registerDTO.getPassword().equals(registerDTO.getPasswordRepeat())){
//                return ResponseEntity.badRequest().body(" Mật khẩu không trùng khớp");
//            }
//            else{
                userService.createAccount(registerDTO);
                return ResponseEntity.ok("");
//            }
        }
        catch(Exception e){
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
