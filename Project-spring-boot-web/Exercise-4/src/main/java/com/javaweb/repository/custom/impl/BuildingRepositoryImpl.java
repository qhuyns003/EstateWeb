package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import com.javaweb.utils.StringUtils;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;



@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    public void joinTable(BuildingSearchRequest buildingSearchRequest,StringBuilder sql) {
        if(buildingSearchRequest.getStaffId()!= null && StringUtils.check(buildingSearchRequest.getStaffId().toString())){
            sql.append( " inner join assignmentbuilding on building.id = assignmentbuilding.buildingid ");
        }

        if((buildingSearchRequest.getAreaFrom()!= null && StringUtils.check(buildingSearchRequest.getAreaFrom().toString())) || ( buildingSearchRequest.getAreaTo()!= null && StringUtils.check(buildingSearchRequest.getAreaTo().toString()))){
            sql.append("inner join rentarea on building.id = rentarea.buildingid ");
        }


    }
    public void normalQuerry(BuildingSearchRequest buildingSearchRequest,StringBuilder sql){
        try {
            Field[] field = BuildingSearchRequest.class.getDeclaredFields();
            for(Field item : field) {
                item.setAccessible(true);
                String fieldName = item.getName();
                if( !fieldName.equals("staffId") &&!fieldName.startsWith("area")
                        &&!fieldName.startsWith("price") ) {
                    Object value = item.get(buildingSearchRequest);

                    if(value!=null&&StringUtils.check(value.toString())) {
                        if(item.getType().getName().equals("java.lang.Long") || item.getType().getName().equals("java.lang.Integer") || item.getType().getName().equals("java.lang.Double")) {
                            sql.append(" and building."+fieldName+" = "+value);
                        }
                        else if(item.getType().getName().equals("java.lang.String")) {
                            sql.append(" and building."+fieldName+" like '%"+value+"%' ");
                        };
                    };
                }
            }
        }
        catch(Exception ex) {
            ex.printStackTrace();
        };

    }
    public void specialQuerry(BuildingSearchRequest buildingSearchRequest,StringBuilder sql){
        if(buildingSearchRequest.getStaffId() != null && StringUtils.check(buildingSearchRequest.getStaffId().toString())){
            sql.append(" and assignmentbuilding.staffid = "+buildingSearchRequest.getStaffId());
        };

        if(buildingSearchRequest.getRentPriceFrom() != null && StringUtils.check(buildingSearchRequest.getRentPriceFrom().toString())) {
            sql.append(" and building.rentPrice >= "+buildingSearchRequest.getRentPriceFrom());
        };
        if(buildingSearchRequest.getRentPriceTo() != null && StringUtils.check(buildingSearchRequest.getRentPriceTo().toString())) {
            sql.append(" and building.rentPrice <= "+buildingSearchRequest.getRentPriceTo());
        };
        if((buildingSearchRequest.getAreaFrom() != null) && StringUtils.check(buildingSearchRequest.getAreaFrom().toString())) {
            sql.append(" and rentarea.value >= "+buildingSearchRequest.getAreaFrom());
        };
        if(buildingSearchRequest.getAreaTo() != null && StringUtils.check(buildingSearchRequest.getAreaTo().toString())) {
            sql.append(" and rentarea.value <= "+buildingSearchRequest.getAreaTo());
        };
        if(buildingSearchRequest.getTypeCode() != null && buildingSearchRequest.getTypeCode().size()!=0) {
            sql.append(" and ( ");
            sql.append(buildingSearchRequest.getTypeCode().stream().map(it -> " building.type like '%" + it + "%' ").collect(Collectors.joining(" or ")));
            sql.append(" ) ");
        };



    }
    @Override
    public List<BuildingEntity> findBuilding(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        StringBuilder sql= new StringBuilder();
        sql.append("SELECT building.* FROM building ");
        joinTable(buildingSearchRequest,sql);
        sql.append(" where 1=1 ");
        normalQuerry(buildingSearchRequest,sql);
        specialQuerry(buildingSearchRequest,sql);
        sql.append(" group by building.id ");
        sql.append(" limit ").append(pageable.getPageSize()).append(" offset ").append(pageable.getOffset());
        Query query = entityManager.createNativeQuery(sql.toString(),BuildingEntity.class);
        List<BuildingEntity> list = query.getResultList();


        return list;
    }

    @Override
    public int countTotalItems() {
        String sql = buildQueryFilter();
        Query query = entityManager.createNativeQuery(sql.toString());
        return query.getResultList().size();
    }
    private String buildQueryFilter() {
        String sql = "SELECT * FROM building b ";
        return sql;
    }
}
