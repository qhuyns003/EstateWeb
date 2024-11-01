package com.javaweb.repository;

import com.javaweb.entity.TransactionEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

public interface TransactionRepository extends JpaRepository<TransactionEntity, Long>  {

    List<TransactionEntity> findByCustomerIdAndCode(Long customerId,String code );
    TransactionEntity findById(long id);
}
