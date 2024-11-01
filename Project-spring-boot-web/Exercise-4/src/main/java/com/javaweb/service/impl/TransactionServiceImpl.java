package com.javaweb.service.impl;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.MyUserDetail;
import com.javaweb.model.request.AddOrUpdateTransaction;
import com.javaweb.model.response.DetailTransactionResponse;
import com.javaweb.model.response.TransactionNoteResponse;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.service.TransactionService;
import com.javaweb.utils.DateTimeUtil;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@Transactional
@Service
public class TransactionServiceImpl implements TransactionService {
    @Autowired
    ModelMapper modelMapper;
    @Autowired
    private TransactionRepository transactionRepository;
    @Autowired
    private CustomerRepository customerRepository;
    @Override
    public List<DetailTransactionResponse> findByCustomerIdAndCode(Long id,String code) {
        List<TransactionEntity> transactionEntities = transactionRepository.findByCustomerIdAndCode(id,code);
        List<DetailTransactionResponse> detailTransactionResponses = new ArrayList<>();
        for(TransactionEntity transactionEntity : transactionEntities) {
            DetailTransactionResponse detailTransactionResponse = modelMapper.map(transactionEntity, DetailTransactionResponse.class);
            detailTransactionResponses.add(detailTransactionResponse);
        }
        return detailTransactionResponses;
    }

    @Override
    public TransactionNoteResponse findById(Long id) {
        TransactionEntity transactionEntity = transactionRepository.findById(id).get();
        TransactionNoteResponse transactionNoteResponse = modelMapper.map(transactionEntity, TransactionNoteResponse.class);
        return transactionNoteResponse;
    }

    @Override
    public void addOrUpdate(AddOrUpdateTransaction transaction) {
        if(transaction.getTransactionId() != null){
            DateTimeUtil dateTimeUtil = new DateTimeUtil();
            TransactionEntity transactionEntity = transactionRepository.findById(transaction.getTransactionId()).get();
            transactionEntity.setNote(transaction.getNote());
//            transactionEntity.setModifiedBy(((MyUserDetail)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getFullName());
//            transactionEntity.setModifiedDate(dateTimeUtil.getCurrentDate());
            transactionRepository.save(transactionEntity);
        }
        else{
            DateTimeUtil dateTimeUtil = new DateTimeUtil();
            TransactionEntity transactionEntity = new TransactionEntity();
            transactionEntity.setCode(transaction.getCode());
            transactionEntity.setNote(transaction.getNote());
//            transactionEntity.setCreatedBy(((MyUserDetail)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getFullName());
//            transactionEntity.setCreatedDate(dateTimeUtil.getCurrentDate());
            transactionEntity.setCustomer(customerRepository.findByIsActiveAndId(1,transaction.getCustomerId()));
            transactionRepository.save(transactionEntity);

        }
    }

    @Override
    public void deleteById(Long id) {
        transactionRepository.deleteById(id);
    }
}
