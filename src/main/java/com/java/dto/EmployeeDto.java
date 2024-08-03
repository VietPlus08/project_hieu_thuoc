package com.java.dto;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import javax.validation.constraints.Size;

@Getter @Setter
public class EmployeeDto {
//    @NotBlank(message = "Tên không được để trống")
    @Size(min = 2, max = 100, message = "Tên phải có độ dài từ 2 đến 100 ký tự")
    private String name;

    private String address;

//    @NotBlank(message = "Email không được để trống")
    @Email(message = "Email không hợp lệ")
    private String email;
    private int age;

//    @NotBlank(message = "Tài khoản không được để trống")
    @Size(min = 5, max = 50, message = "Tài khoản phải có độ dài từ 5 đến 50 ký tự")
    private String account;

//    @NotBlank(message = "Mật khẩu không được để trống")
    @Size(min = 8, message = "Mật khẩu phải có độ dài ít nhất 8 ký tự")
    private String password;

//    @NotBlank(message = "Nhập lại mật khẩu không được để trống")
    @Size(min = 8, message = "Nhập lại mật khẩu phải có độ dài ít nhất 8 ký tự")
    private String rePassword;

    private String role;
}
