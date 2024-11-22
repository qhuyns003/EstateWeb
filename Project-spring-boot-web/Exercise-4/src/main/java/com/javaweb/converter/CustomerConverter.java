package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.enums.statusType;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class CustomerConverter {
    @Autowired
    ModelMapper modelMapper;
    public List<CustomerSearchResponse> toResponseList(List<CustomerEntity> customerEntity,int total) {
        List<CustomerSearchResponse> customerSearchResponseList = new ArrayList<>();
        for (CustomerEntity customerEntity1 : customerEntity) {
            CustomerSearchResponse customerSearchResponse = modelMapper.map(customerEntity1, CustomerSearchResponse.class);
            customerSearchResponse.setStatus(statusType.valueOf(customerEntity1.getStatus()+"").getCode());
            customerSearchResponse.setTotalItems(total);
            customerSearchResponseList.add(customerSearchResponse);
        }
        return customerSearchResponseList;
    };
}
