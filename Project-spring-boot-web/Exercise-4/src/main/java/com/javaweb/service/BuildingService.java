package com.javaweb.service;

import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingService {
    List<BuildingSearchResponse> findBuilding(BuildingSearchRequest buildingSearchRequest, Pageable pageable);

    void addAndUpdateBuilding(BuildingDTO buildingDTO);
    void deleteBuilding(List<Long> ids);
    BuildingDTO getBuildingById(Long id);
    void assignmentBuilding(Long buildingId, List<Long> staffIds);
    int countTotalItems();
}
