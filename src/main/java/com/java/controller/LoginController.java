package com.java.controller;

import com.java.service.impl.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    EmployeeService employeeService;

    @GetMapping
    public String showLoginForm() {
        return "login/login-form"; // Đây là tên của file JSP hoặc Thymeleaf template (ví dụ: login-form.jsp)
    }

    @PostMapping("/authenticate")
    public String authenticate(@RequestParam String username, @RequestParam String password, Model model) {
        boolean isAuthenticated = employeeService.authenticate(username, password);

        if (isAuthenticated) {
            return "redirect:/login/login-form";
        } else {
            model.addAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng");
            return "login/login-form";
        }
    }

    @GetMapping("/register")
    public String showRegisterForm() {
        return "login/register-form"; // Đây là tên của file JSP hoặc Thymeleaf template (ví dụ: login-form.jsp)
    }
}
