package com.javaweb.model.response;

import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AbstractDTO;

import java.util.List;

public class CustomerSearchResponse extends AbstractDTO {
    private String fullName;
    private String phone;
    private String email;
    private String demand;
    private String status;

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDemand() {
        return demand;
    }

    public void setDemand(String demand) {
        this.demand = demand;
    }



    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
