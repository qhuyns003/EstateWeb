package com.javaweb.api.admin;

import com.javaweb.model.request.AddOrUpdateTransaction;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.model.response.TransactionNoteResponse;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Transactional
@RestController(value ="transactionAPIOfAdmin")
@RequestMapping("/api/transaction")
public class TransactionAPI {
    @Autowired
    private TransactionService transactionService;
    @GetMapping("/{id}")
    public ResponseDTO loadNote(@PathVariable Long id) {
        TransactionNoteResponse note = transactionService.findById(id);
        ResponseDTO response = new ResponseDTO();
        List<TransactionNoteResponse> list = new ArrayList<>();
        list.add(note);
        response.setData(list);
        return response;
    };
    @PostMapping
    public void addOrUpdate(@RequestBody AddOrUpdateTransaction transaction) {
        transactionService.addOrUpdate(transaction);
    };

    @DeleteMapping("/{id}")
    public void delete(@PathVariable("id") Long id) {
        transactionService.deleteById(id);
    };

}
