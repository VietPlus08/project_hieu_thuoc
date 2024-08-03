package com.java.controller;

import com.java.dto.EmployeeDto;
import com.java.model.Employee;
import com.java.service.IEmployeeService;
import com.java.service.impl.EmployeeService;
import org.apache.commons.lang3.tuple.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    IEmployeeService employeeService;

    @GetMapping
    public String showLoginForm() {
        return "login/login-form";
    }

    @PostMapping("/authenticate")
    public String authenticate(@RequestParam String username, @RequestParam String password,
                               Model model,
                               HttpSession session,
                               RedirectAttributes redirectAttributes) {
        Pair<Boolean, Employee> result = employeeService.authenticate(username, password);
        boolean isAuthenticated = result.getLeft();
        Employee employee = result.getRight();
        if (isAuthenticated) {
            session.setAttribute("username", username);
            session.setAttribute("fullName", employee.getName());
            return "redirect:/order";
        } else {
//            redirectAttributes.addFlashAttribute("failMessage", "Tên đăng nhập hoặc mật khẩu không đúng");
            model.addAttribute("failMessage", "Tên đăng nhập hoặc mật khẩu không đúng");
            return "login/login-form";
        }
    }

    @GetMapping("/register-form")
    public String showRegisterForm(Model model) {
        model.addAttribute("employee", new EmployeeDto());
        return "login/register-form";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("employee") EmployeeDto employee, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()){
            model.addAttribute("employee", employee);
            return "login/register-form";
        }
        Employee result = employeeService.create(employee);
        return "redirect:/login";
    }

    @GetMapping("/staticData")
    public String staticData(){
        employeeService.updateStaticAccount();
        return "login/login-form";
    }
}
