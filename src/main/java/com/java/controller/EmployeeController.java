package com.java.controller;

import com.java.model.Employee;
import com.java.service.impl.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @GetMapping("")
    public String List(Model model){
        List<Employee> employees = employeeService.getList();
        model.addAttribute("employees", employees);
        return "/employee/employee-list";
    }
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Integer id, Model model){
        Employee employee = employeeService.getById(id);
        model.addAttribute("Employee", employee);
        return "/employee/edit-form";
    }
    @GetMapping("/save-edit/{id}")
    public String saveEditForm(@ModelAttribute("Employee") Employee employee){
        employeeService.update(employee);
        return "employee/employee-list";
    }
    @GetMapping("/delete/{id}")
    public String deleteEmployee(@PathVariable("id") Integer id, Model model){
        Employee employee = employeeService.getById(id);
        employeeService.delete(id);
        List<Employee> employees = employeeService.getList();
        model.addAttribute("employees", employees);
        return "employee/employee-list";

    }
}
