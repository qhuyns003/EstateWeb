package com.javaweb.controller.admin;



import com.javaweb.constant.SystemConstant;
import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.BuildingService;
import com.javaweb.service.IUserService;
import com.javaweb.service.UserServiceInterface;
import com.javaweb.service.impl.UserService;
import com.javaweb.utils.DisplayTagUtils;
import com.javaweb.utils.MessageUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.tomcat.util.bcel.classfile.Constant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Transactional
@Controller(value="buildingControllerOfAdmin")
public class BuildingController {
    @Autowired
    private BuildingService buildingService;
    @Autowired
    private IUserService userService;
    @Autowired
    private MessageUtils messageUtils;
//    @GetMapping(value="/admin/building-list")
//    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest building, HttpServletRequest request){
//        ModelAndView mav = new ModelAndView("admin/building/list");
//        mav.addObject("modelSearch", building);
//        if(!SecurityUtils.getAuthorities().contains(SystemConstant.MANAGER_ROLE)){
//            building.setStaffId(SecurityUtils.getPrincipal().getId());
//        }
//        List<BuildingSearchResponse> responseList = buildingService.findBuilding(building);
//        mav.addObject("buildingList", responseList);
//
//        Map<Long,String> map = userService.getAllUsers();
//        mav.addObject("listStaff", map);
//        mav.addObject("typeCodes", buildingType.type());
//        mav.addObject("districts",districtCode.type());
//        return mav;
//    }
    @RequestMapping(value = "/admin/building-list", method = RequestMethod.GET)
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest building, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("modelSearch", building);
        DisplayTagUtils.of(request, building);
        //List<UserDTO> news = userService.getUsers(model.getSearchValue(), PageRequest.of(model.getPage() - 1, model.getMaxPageItems()));
        if(!SecurityUtils.getAuthorities().contains(SystemConstant.MANAGER_ROLE)){
            building.setStaffId(SecurityUtils.getPrincipal().getId());
        }
        List<BuildingSearchResponse> responseList = buildingService.findBuilding(building, PageRequest.of(building.getPage() - 1, building.getMaxPageItems()));
        building.setListResult(responseList);
        building.setTotalItems(responseList.get(0).getTotalItems());
        mav.addObject("building", building);
        Map<Long,String> map = userService.getAllUsers();
        mav.addObject("listStaff", map);
        mav.addObject("typeCodes", buildingType.type());
        mav.addObject("districts",districtCode.type());
        initMessageResponse(mav, request);
        return mav;
    }

    @GetMapping(value="/admin/building-edit")
    public ModelAndView buildingEdit(@ModelAttribute("buildingEdit") BuildingDTO building,HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("buildingEdit", building);
        mav.addObject("typeCodes", buildingType.type());
        mav.addObject("districts",districtCode.type());
        return mav;
    }

    @GetMapping(value="/admin/building-edit-{id}")
    public ModelAndView buildingEdit(@PathVariable("id") Long id, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        BuildingDTO buildingDTO = buildingService.getBuildingById(id);
        mav.addObject("buildingEdit", buildingDTO);
        mav.addObject("typeCodes", buildingType.type());
        mav.addObject("districts",districtCode.type());
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
