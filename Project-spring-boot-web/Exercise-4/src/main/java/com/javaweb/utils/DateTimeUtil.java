package com.javaweb.utils;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class DateTimeUtil {
    private LocalDateTime dateTime;

    public DateTimeUtil() {
        this.dateTime = LocalDateTime.now(); // Lấy ngày và giờ hiện tại
    }

    public Date getCurrentDate() {
        // Chuyển đổi LocalDateTime sang Date
        return Date.from(dateTime.atZone(ZoneId.systemDefault()).toInstant());
    }





}
