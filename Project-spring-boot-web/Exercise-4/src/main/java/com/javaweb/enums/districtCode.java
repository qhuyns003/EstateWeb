package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

public enum  districtCode {
    BA_DINH ("Ba Đình"),
    CAU_GIAY ("Cầu Giấy"),
    HOAN_KIEM ("Hoàn Kiếm"),
    HAI_BA_TRUNG ("Hai Bà Trưng"),
    HOANG_MAI ("Hoàng Mai"),
    DONG_DA ("Đống Đa"),
    TAY_HO ("Tây Hồ"),
    THANH_XUAN ("Thanh Xuân"),
    BAC_TU_LIEM ("Bắc Từ Liêm"),
    HA_DONG ("Hà Đông"),
    LONG_BIEN ("Long Biên"),
    NAM_TU_LIEM ("Nam Từ Liêm"),
    ;

    private final String districtName;
    districtCode(String districtName) {
        this.districtName = districtName;
    }

    public String getDistrictName() {
        return districtName;
    }

    public static Map<String,String> type(){
        Map<String,String> listType = new TreeMap<>();
        for(districtCode item : districtCode.values()){
            listType.put(item.toString() , item.districtName);
        }
        return listType;
    }
}
