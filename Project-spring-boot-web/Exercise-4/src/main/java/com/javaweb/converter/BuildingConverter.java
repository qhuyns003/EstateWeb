package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.utils.StringUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;

    public BuildingSearchResponse buildingConvertor(BuildingEntity buildingEntity) {
        BuildingSearchResponse bd = modelMapper.map(buildingEntity , BuildingSearchResponse.class);
        List<String> list = new ArrayList<>();
        if(buildingEntity.getStreet()!=null && StringUtils.check(buildingEntity.getStreet())){
            list.add(buildingEntity.getStreet());
        }
        if(buildingEntity.getWard()!=null && StringUtils.check(buildingEntity.getWard())){
            list.add(buildingEntity.getWard());
        }
        if(buildingEntity.getDistrict()!=null && StringUtils.check(buildingEntity.getDistrict())){
            list.add(districtCode.valueOf(buildingEntity.getDistrict()).getDistrictName());
        }
        bd.setAddress(list.stream().collect(Collectors.joining(",")));
        bd.setRentArea(buildingEntity.getRentAreaItems().stream().map(it -> it.getValue().toString()).collect(Collectors.joining(",")));

        return bd;
    }

    public BuildingEntity dtoToEntity(BuildingDTO buildingDTOList) {
        BuildingEntity buildingEntity = modelMapper.map(buildingDTOList, BuildingEntity.class);
        if(buildingDTOList.getTypeCode()!=null) {
            buildingEntity.setType(buildingDTOList.getTypeCode().stream().collect(Collectors.joining(",")));
        }
        String[] rentAreaStringList = buildingDTOList.getRentArea().split(",");
        List<RentAreaEntity> rentAreaList = new ArrayList<>();
        for(String rentAreaString : rentAreaStringList) {
            RentAreaEntity rentArea = new RentAreaEntity();
            rentArea.setValue(Integer.parseInt(rentAreaString));
            rentArea.setBuilding(buildingEntity);
            rentAreaList.add(rentArea);
        }
        buildingEntity.setRentAreaItems(rentAreaList);

        return buildingEntity;
    };

    public BuildingDTO entityToDto(BuildingEntity buildingEntity) {
        BuildingDTO buildingDTO = modelMapper.map(buildingEntity, BuildingDTO.class);
        buildingDTO.setRentArea(buildingEntity.getRentAreaItems().stream().map(it -> it.getValue().toString()).collect(Collectors.joining(",")));
        String[] types = buildingEntity.getType().trim().split(",");
        List<String> buildingTypeList = new ArrayList<>();
        for(String type : types) {
            buildingTypeList.add(type.trim());
        };
        buildingDTO.setTypeCode(buildingTypeList);
        return buildingDTO;
    }
}
