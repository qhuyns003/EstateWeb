package com.javaweb.repository.custom;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingRepositoryCustom {
    Page<BuildingEntity> findBuilding(BuildingSearchRequest buildingSearchRequest, Pageable pageable);
    int countTotalItems();
}
