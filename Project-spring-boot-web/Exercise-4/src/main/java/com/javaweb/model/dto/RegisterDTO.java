package com.javaweb.model.dto;

import javax.validation.constraints.NotBlank;

public class RegisterDTO {
    @NotBlank(message = "Tên khum được để trống")
    private String fullName;
    @NotBlank(message = "Username khum được để trống")
    private String userName;
    @NotBlank(message = "Mật khẩu khum được để trống")
    private String password;
    @NotBlank(message = "Mật khẩu nhắc lại khum được để trống")
    private String passwordRepeat;

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordRepeat() {
        return passwordRepeat;
    }

    public void setPasswordRepeat(String passwordRepeat) {
        this.passwordRepeat = passwordRepeat;
    }
}
