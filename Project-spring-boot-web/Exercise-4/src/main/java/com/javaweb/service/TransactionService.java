package com.javaweb.service;

import com.javaweb.model.request.AddOrUpdateTransaction;
import com.javaweb.model.response.DetailTransactionResponse;
import com.javaweb.model.response.TransactionNoteResponse;

import java.util.List;

public interface TransactionService {
   List<DetailTransactionResponse> findByCustomerIdAndCode(Long id,String code);
   TransactionNoteResponse findById(Long id);
   void addOrUpdate(AddOrUpdateTransaction transaction);
   void deleteById(Long id);
}
