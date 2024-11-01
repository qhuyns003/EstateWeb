package com.javaweb.model.dto;

import javax.validation.constraints.NotBlank;

public class CustomerDTO extends AbstractDTO{
    @NotBlank(message = "Tên khum được để trống")
    private String fullName;
    @NotBlank(message = "SĐT khum được để trống")
    private String phone;
    private String email;
    private String demand;
    @NotBlank(message = "Trạng thái khum được để trống")
    private String status;
    private String companyName;
    private Integer isActive;

    public Integer getIsActive() {
        return isActive;
    }

    public void setIsActive(Integer isActive) {
        this.isActive = isActive;
    }

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

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
}
