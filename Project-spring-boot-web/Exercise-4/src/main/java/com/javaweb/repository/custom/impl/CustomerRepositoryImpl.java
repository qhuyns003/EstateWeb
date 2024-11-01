package com.javaweb.repository.custom.impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import com.javaweb.utils.StringUtils;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Transactional
@Repository
public class CustomerRepositoryImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    public void joinTable(CustomerSearchRequest customerSearchRequest, StringBuilder sql) {
        if(customerSearchRequest.getStaffId()!= null && StringUtils.check(customerSearchRequest.getStaffId().toString())){
            sql.append( " inner join assignmentcustomer on customer.id = assignmentcustomer.customerid ");
        }

    }
    public void specialQuerry(CustomerSearchRequest customerSearchRequest,StringBuilder sql){
        if(customerSearchRequest.getStaffId() != null && StringUtils.check(customerSearchRequest.getStaffId().toString())){
            sql.append(" and assignmentcustomer.staffid = "+customerSearchRequest.getStaffId());
        };
        if(customerSearchRequest.getName() != null && StringUtils.check(customerSearchRequest.getName())){
            sql.append(" and customer.fullname like "+"%"+customerSearchRequest.getName()+"% ");
        };
        if(customerSearchRequest.getEmail() != null && StringUtils.check(customerSearchRequest.getEmail())){
            sql.append(" and customer.email = "+customerSearchRequest.getEmail());
        };



    };
    @Override
    public List<CustomerEntity> findCustomer(CustomerSearchRequest searchRequest,Pageable pageable) {
        StringBuilder sql = new StringBuilder();
        sql.append("select customer.* from customer ");

        joinTable(searchRequest, sql);
        sql.append(" where 1=1 ");
        sql.append(" and customer.is_active = 1 ");
        specialQuerry(searchRequest, sql);
        sql.append(" group by customer.id ");
        sql.append(" limit ").append(pageable.getPageSize()).append(" offset ").append(pageable.getOffset());
        Query query=entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return query.getResultList();
    }

    @Override
    public int countTotalItems() {
        String sql = buildQueryFilter();
        Query query = entityManager.createNativeQuery(sql.toString());
        return query.getResultList().size();
    }
    private String buildQueryFilter() {
        String sql = "SELECT * FROM customer c ";
        return sql;
    }
}
