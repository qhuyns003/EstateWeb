package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;

public enum transactionType {

    DDX("Dẫn đi xem"),
    CSKH("Chăm sóc khách hàng");

    private final String name;

    transactionType(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public static Map<String,String> type(){
        Map<String,String> listType = new HashMap<>();
        for(transactionType item : transactionType.values()){
            listType.put(item.toString() , item.name);
        }
        return listType;
    }
}
