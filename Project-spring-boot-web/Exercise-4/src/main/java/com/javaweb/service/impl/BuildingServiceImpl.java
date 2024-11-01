package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private BuildingConverter buildingConverter;
    @Autowired
    private RentAreaRepository rentAreaRepository;
    @Autowired
    private UserRepository userRepository;

    @Override
    public List<BuildingSearchResponse> findBuilding(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        Page<BuildingEntity> buildingEntityListPage = buildingRepository.findBuilding(buildingSearchRequest,pageable);
        List<BuildingEntity> buildingEntityList = buildingEntityListPage.getContent();
        List<BuildingSearchResponse> buildingSearchResponseList = new ArrayList<>();
        for(BuildingEntity buildingEntity : buildingEntityList){
            BuildingSearchResponse buildingSearchResponse = buildingConverter.buildingConvertor(buildingEntity);
            buildingSearchResponse.setTotalItems((int)buildingEntityListPage.getTotalElements());
            buildingSearchResponseList.add(buildingSearchResponse);
        };
        return buildingSearchResponseList;
    }

    @Override
    public void addAndUpdateBuilding(BuildingDTO buildingDTO) {
//        if(buildingDTO.getId()!=null && !buildingDTO.getId().toString().equals("")){
//            BuildingEntity buildingEntity = buildingRepository.findById(buildingDTO.getId()).get();
//            for(RentAreaEntity rentAreaEntity : buildingEntity.getRentAreaItems()) {
//                rentAreaRepository.deleteById(rentAreaEntity.getId());
//            };
//        }
        BuildingEntity buildingEntity = buildingConverter.dtoToEntity(buildingDTO);
        buildingRepository.save(buildingEntity);
    }



    @Override
    public void deleteBuilding(List<Long> ids) {

        buildingRepository.deleteByIdIn(ids);
    }

    @Override
    public BuildingDTO getBuildingById(Long id) {
        BuildingEntity buildingEntity=buildingRepository.findById(id).get();
        BuildingDTO buildingDTO = buildingConverter.entityToDto(buildingEntity);
        return buildingDTO;
    }

    @Override
    public void assignmentBuilding(Long buildingId, List<Long> staffIds) {
        BuildingEntity buildingEntity=buildingRepository.findById(buildingId).get();
        List<UserEntity> userEntityList= userRepository.findAllById(staffIds);
        buildingEntity.setUsers(userEntityList);
        buildingRepository.save(buildingEntity);
    }

    @Override
    public int countTotalItems() {
        return buildingRepository.countTotalItems();
    }

}
