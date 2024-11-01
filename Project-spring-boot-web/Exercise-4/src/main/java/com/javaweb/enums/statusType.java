package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;

public enum statusType {
    DANG_XU_LY ("đang xử lý "),
    CHUA_XU_LY ("chưa xử lý "),
    DA_XU_LY ("đã xử lý ");
    private final String name;

    statusType(String name) {
        this.name = name;
    }

    public String getCode() {
        return name;
    }
    public static Map<String,String> type(){
        Map<String,String> listType = new HashMap<>();
        for(statusType item : statusType.values()){
            listType.put(item.toString() , item.name);
        }
        return listType;
    }
}
