package com.java.controller;

import com.java.service.IEmployeeService;
import com.java.service.impl.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    IEmployeeService employeeService;

    @GetMapping
    public String showLoginForm() {
        return "login/login-form"; // Đây là tên của file JSP hoặc Thymeleaf template (ví dụ: login-form.jsp)
    }

    @PostMapping("/authenticate")
    public String authenticate(@RequestParam String username, @RequestParam String password,
                               Model model,
                               HttpSession session,
                               RedirectAttributes redirectAttributes) {
        boolean isAuthenticated = employeeService.authenticate(username, password);
        if (isAuthenticated) {
            session.setAttribute("username", username);
            return "redirect:/order";
        } else {
//            redirectAttributes.addFlashAttribute("failMessage", "Tên đăng nhập hoặc mật khẩu không đúng");
            model.addAttribute("failMessage", "Tên đăng nhập hoặc mật khẩu không đúng");
            return "login/login-form";
        }
    }

    @GetMapping("/register")
    public String showRegisterForm() {
        return "login/register-form";
    }

    @GetMapping("/staticData")
    public String staticData(){
        employeeService.updateStaticAccount();
        return "login/login-form";
    }
}
