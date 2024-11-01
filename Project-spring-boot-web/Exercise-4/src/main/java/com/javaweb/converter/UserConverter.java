package com.javaweb.converter;

import com.javaweb.model.dto.UserDTO;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.response.StaffResponseDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserConverter {

    @Autowired
    private ModelMapper modelMapper;

    public UserDTO convertToDto (UserEntity entity){
        UserDTO result = modelMapper.map(entity, UserDTO.class);
        return result;
    }

    public UserEntity convertToEntity (UserDTO dto){
        UserEntity result = modelMapper.map(dto, UserEntity.class);
        return result;
    }

    public StaffResponseDTO convertToStaffResponse(UserEntity entity){
        StaffResponseDTO result = modelMapper.map(entity, StaffResponseDTO.class);
        result.setStaffId(entity.getId());
        result.setChecked("");
        return result;
    }
    
}
