package com.javaweb.service;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerService {
    List<CustomerSearchResponse> findCustomer(CustomerSearchRequest searchRequest, Pageable pageable);
    void assignCustomer(AssignmentCustomerDTO assignmentCustomerDTO);
    CustomerDTO getCustomerDTO(Long id);
    void addOrUpdate(CustomerDTO customerDTO);
    void deleteCustomers(List<Long> ids);
    int countTotalItems();
}
