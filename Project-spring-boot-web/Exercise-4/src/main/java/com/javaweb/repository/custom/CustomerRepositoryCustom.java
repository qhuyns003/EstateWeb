package com.javaweb.repository.custom;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.request.CustomerSearchRequest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerRepositoryCustom {
    Page<CustomerEntity> findCustomer(CustomerSearchRequest searchRequest, Pageable pageable);
    int countTotalItems();
}
