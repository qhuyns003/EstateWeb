package com.javaweb.service.impl;

import com.javaweb.converter.CustomerConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.statusType;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.CustomerService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
@Transactional
@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    ModelMapper modelMapper;
    @Autowired
    CustomerRepository CustomerRepository;
    @Autowired
    CustomerRepository customerRepository;
    @Autowired
    CustomerConverter customerConverter;
    @Autowired
    UserRepository userRepository;
    @Override
    public List<CustomerSearchResponse> findCustomer(CustomerSearchRequest request, Pageable pageable) {
        Page<CustomerEntity> listPage = customerRepository.findCustomer(request,pageable);
        List<CustomerEntity> list = listPage.getContent();
        List<CustomerSearchResponse> responseList = customerConverter.toResponseList(list,(int)listPage.getTotalElements());
        return responseList;
    }

     @Override
     public void assignCustomer(AssignmentCustomerDTO assignmentCustomerDTO) {
         CustomerEntity customerEntity = customerRepository.findById(assignmentCustomerDTO.getCustomerId()).get();
         List<UserEntity> userEntityList = new ArrayList<>();
         for(Long id : assignmentCustomerDTO.getStaffs()){
             UserEntity userEntity = userRepository.findById(id).get();
             userEntityList.add(userEntity);
         };
         customerEntity.setUsers(userEntityList);
         customerRepository.save(customerEntity);
     }
    @Override
    public CustomerDTO getCustomerDTO(Long id) {
        CustomerEntity customerEntity= customerRepository.findByIsActiveAndId(1,id);
        CustomerDTO customerDTO = modelMapper.map(customerEntity, CustomerDTO.class);

        return customerDTO;
    }

    @Override
    public void addOrUpdate(CustomerDTO customerDTO) {

        CustomerEntity customerEntity = modelMapper.map(customerDTO, CustomerEntity.class);
//        modelMapper.map(customerDTO,customerEntity);
        customerEntity.setStatus(statusType.type().get(customerEntity.getStatus()));
        customerEntity.setIsActive(1);
        customerRepository.save(customerEntity);

    }

    @Override
    public void deleteCustomers(List<Long> ids) {
        for(Long id : ids){
            CustomerEntity customerEntity = customerRepository.findById(id).get();
            customerEntity.setIsActive(0);
            customerRepository.save(customerEntity);
        }
    }

    @Override
    public int countTotalItems() {
        return customerRepository.countTotalItems();
    }


}
