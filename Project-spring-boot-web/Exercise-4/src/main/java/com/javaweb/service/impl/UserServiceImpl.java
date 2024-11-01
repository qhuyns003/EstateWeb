package com.javaweb.service.impl;

import com.javaweb.converter.UserConverter;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.UserServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;
@Transactional
@Service
public class UserServiceImpl  implements UserServiceInterface {
//    @Autowired
//    private UserConverter userConverter;
//    @Autowired
//    private UserRepository userRepository;
//    @Override
//    public Map<Long, String> getAllUsers() {
//        List<UserEntity> list= userRepository.findByStatusAndRoles_Code(1,"STAFF");
//        Map<Long, String> map = new HashMap<>();
//        for(UserEntity user:list){
//            map.put(user.getId(),user.getUserName());
//        }
//        return map;
//    }
//
//    @Override
//    public List<StaffResponseDTO> getAllStaff(Long id) {
//        List<UserEntity> userEntities = userRepository.findByStatusAndRoles_Code(1,"STAFF");
//        List<UserEntity> userStaffEntities = userRepository.findByBuildingId(id);
//        List<StaffResponseDTO> staffResponseDTOs = new ArrayList<>();
//        HashSet<Long> allStaffId = new HashSet<>();
//        for(UserEntity userEntity: userStaffEntities){
//            allStaffId.add(userEntity.getId());
//        }
//        for(UserEntity user:userEntities){
//            StaffResponseDTO staff = userConverter.convertToStaffResponse(user);
//            staffResponseDTOs.add(staff);
//        }
//        for(StaffResponseDTO staff:staffResponseDTOs ){
//            if(allStaffId.contains(staff.getStaffId())){
//                staff.setChecked("checked");
//            };
//        };
//
//        return staffResponseDTOs;
//    }
//
//    public List<StaffResponseDTO> getAllStaffOfCustomer(Long id) {
//        List<UserEntity> userEntities = userRepository.findByStatusAndRoles_Code(1,"STAFF");
//        List<UserEntity> userStaffEntities = userRepository.findByCustomerId(id);
//        List<StaffResponseDTO> staffResponseDTOs = new ArrayList<>();
//        HashSet<Long> allStaffId = new HashSet<>();
//        for(UserEntity userEntity: userStaffEntities){
//            allStaffId.add(userEntity.getId());
//        }
//        for(UserEntity user:userEntities){
//            StaffResponseDTO staff = userConverter.convertToStaffResponse(user);
//            staffResponseDTOs.add(staff);
//        }
//        for(StaffResponseDTO staff:staffResponseDTOs ){
//            if(allStaffId.contains(staff.getStaffId())){
//                staff.setChecked("checked");
//            };
//        };
//
//        return staffResponseDTOs;
//    }
}
