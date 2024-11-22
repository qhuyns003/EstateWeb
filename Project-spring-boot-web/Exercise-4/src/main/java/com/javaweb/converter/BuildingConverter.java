package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.utils.StringUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private BuildingRepository buildingRepository;

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

//    public BuildingEntity dtoToEntity(BuildingDTO buildingDTOList) {
//        BuildingEntity buildingEntity = new BuildingEntity();
//        if(buildingDTOList.getId()==null){
//            buildingEntity = modelMapper.map(buildingDTOList, BuildingEntity.class);
//        }
//        else{
//            buildingEntity = buildingRepository.findById(buildingDTOList.getId()).get();
//            modelMapper.map(buildingDTOList, buildingEntity);
//
//            for(RentAreaEntity rent : buildingEntity.getRentAreaItems()){
//                rent.setBuilding(null);
//            }
//            buildingEntity.getRentAreaItems().clear();
//        }
//
//        if(buildingDTOList.getTypeCode()!=null) {
//            buildingEntity.setType(buildingDTOList.getTypeCode().stream().collect(Collectors.joining(",")));
//        }
//
//        String[] rentAreaStringList = buildingDTOList.getRentArea().split(",");
//        List<RentAreaEntity> rentAreaList = new ArrayList<>();
//        for(String rentAreaString : rentAreaStringList) {
//            RentAreaEntity rentArea = new RentAreaEntity();
//            rentArea.setValue(Integer.parseInt(rentAreaString));
//            rentArea.setBuilding(buildingEntity);
//            rentAreaList.add(rentArea);
//        }
//        buildingEntity.setRentAreaItems(rentAreaList);
//
//
//        return buildingEntity;
//    };
public BuildingEntity dtoToEntity(BuildingDTO buildingDTOList) {
    BuildingEntity buildingEntity;

    if (buildingDTOList.getId() == null) {
        // Nếu không có ID, tạo mới
        buildingEntity = modelMapper.map(buildingDTOList, BuildingEntity.class);
    } else {
        // Nếu có ID, tìm kiếm và cập nhật
        buildingEntity = buildingRepository.findById(buildingDTOList.getId())
                .orElseThrow(() -> new RuntimeException("Building not found")); // Ném ngoại lệ nếu không tìm thấy
        modelMapper.map(buildingDTOList, buildingEntity);

        // Xóa các mối quan hệ cũ

        buildingEntity.getRentAreaItems().clear();// Xóa tất cả các phần tử hiện có
    }

    // Cập nhật loại
    if (buildingDTOList.getTypeCode() != null) {
        buildingEntity.setType(buildingDTOList.getTypeCode().stream().collect(Collectors.joining(",")));
    }

    // Xử lý các phần tử rentArea
    String[] rentAreaStringList = buildingDTOList.getRentArea().split(",");
    List<RentAreaEntity> rentAreaList = new ArrayList<>();
    for (String rentAreaString : rentAreaStringList) {
        RentAreaEntity rentArea = new RentAreaEntity();
        rentArea.setValue(Integer.parseInt(rentAreaString));
        rentArea.setBuilding(buildingEntity); // Thiết lập mối quan hệ mới
        buildingEntity.getRentAreaItems().add(rentArea);
    }

    // Cập nhật danh sách rentAreaItems
//    buildingEntity.setRentAreaItems(rentAreaList); // Thêm các phần tử mới vào danh sách



    return buildingEntity;
}

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
