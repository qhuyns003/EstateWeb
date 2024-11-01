package com.javaweb.controller.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.enums.statusType;
import com.javaweb.enums.transactionType;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.DetailTransactionResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.*;
import com.javaweb.utils.DisplayTagUtils;
import com.javaweb.utils.MessageUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import sun.reflect.generics.tree.Tree;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

@Transactional
@Controller(value="customerControllerOfAdmin")
public class CustomerController {
    @Autowired
    private MessageUtils messageUtils;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private IUserService userService;
    @Autowired
    private TransactionService transactionService;
//    @GetMapping(value="/admin/customer-list")
//    public ModelAndView customerList(@ModelAttribute CustomerSearchRequest customerSearchRequest ,HttpServletRequest request){
//        ModelAndView mav = new ModelAndView("admin/customer/list");
//        Map<Long,String> map = userService.getAllUsers();
//        List<CustomerSearchResponse> customerSearchResponseList = new ArrayList<>();
//        if(!SecurityUtils.getAuthorities().contains(SystemConstant.MANAGER_ROLE)){
//            customerSearchRequest.setStaffId(SecurityUtils.getPrincipal().getId());
//        }
//        List<CustomerSearchResponse> customerSearchResponse = customerService.findCustomer(customerSearchRequest);
//        mav.addObject("customerList", customerSearchResponse);
//        mav.addObject("listStaff", map);
//        mav.addObject("modelSearch", customerSearchRequest);
//        return mav;
//    }
    @RequestMapping(value = "/admin/customer-list", method = RequestMethod.GET)
    public ModelAndView customerList(@ModelAttribute CustomerSearchRequest customer, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/list");
        mav.addObject("modelSearch", customer);
        Map<Long,String> map = userService.getAllUsers();
        DisplayTagUtils.of(request, customer);
        List<CustomerSearchResponse> customerSearchResponseList = new ArrayList<>();
        if(!SecurityUtils.getAuthorities().contains(SystemConstant.MANAGER_ROLE)){
            customer.setStaffId(SecurityUtils.getPrincipal().getId());
        }
        List<CustomerSearchResponse> customerSearchResponse = customerService.findCustomer(customer,PageRequest.of(customer.getPage() - 1, customer.getMaxPageItems()));
        customer.setListResult(customerSearchResponse);
        customer.setTotalItems(customerSearchResponse.get(0).getTotalItems());
        mav.addObject("customer", customer);
        mav.addObject("listStaff", map);
        initMessageResponse(mav, request);
        return mav;
    }
    @GetMapping(value="/admin/customer-edit")
    public ModelAndView customerEdit( HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        CustomerDTO customerDTO = new CustomerDTO();
        mav.addObject("customerEdit", customerDTO);
        mav.addObject("transactionType", transactionType.type());
        mav.addObject("status", statusType.type());
//        for(transactionType t : transactionType.values()){
//            List<DetailTransactionResponse> detailTransactionResponses = transactionService.findByCustomerIdAndCode();
//            mav.addObject(t.getName(), detailTransactionResponses);
//        };
        return mav;
    }

    @GetMapping(value="/admin/customer-edit-{id}")
    public ModelAndView customerEdit(@PathVariable("id") Long id, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        CustomerDTO customerDTO = customerService.getCustomerDTO(id);
        mav.addObject("customerEdit", customerDTO);
        mav.addObject("transactionType", transactionType.type());
        mav.addObject("status", statusType.type());
        for(transactionType t : transactionType.values()){
            List<DetailTransactionResponse> detailTransactionResponses = transactionService.findByCustomerIdAndCode(id,t.toString());
//
            mav.addObject(t.toString().toLowerCase(), detailTransactionResponses);
        };

        return mav;
    }
    private void initMessageResponse(ModelAndView mav, HttpServletRequest request) {
        String message = request.getParameter("message");
        if (message != null && StringUtils.isNotEmpty(message)) {
            Map<String, String> messageMap = messageUtils.getMessage(message);
            mav.addObject(SystemConstant.ALERT, messageMap.get(SystemConstant.ALERT));
            mav.addObject(SystemConstant.MESSAGE_RESPONSE, messageMap.get(SystemConstant.MESSAGE_RESPONSE));
        }
    }
}
