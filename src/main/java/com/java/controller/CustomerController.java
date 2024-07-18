package com.java.controller;

import com.java.model.Customer;
import com.java.service.impl.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    private CustomerService customerService;

    @GetMapping
    public String listCustomers(Model model) {
        List<Customer> customers = customerService.getList();
        model.addAttribute("customers", customers);
        return "customer/customer-list";
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        Customer customer = new Customer();
        model.addAttribute("customer", customer);
        return "customer/customer-form";
    }

    // redirect sang order screen kèm customerId
    @PostMapping("/save")
    public String saveCustomer(@ModelAttribute("customer") Customer customer, RedirectAttributes redirectAttributes) {
        Customer result = customerService.create(customer);
        redirectAttributes.addFlashAttribute("customer", result);
        return "redirect:/order/new";
    }

    @GetMapping("/edit/{id}")
    public String showUpdateForm(@PathVariable("id") Integer id, Model model) {
        Customer customer = customerService.getById(id);
        model.addAttribute("customer", customer);
        return "customer/customer-form";
    }

    @GetMapping("/delete/{id}")
    public String deleteCustomer(@PathVariable("id") Integer id) {
        customerService.delete(id);
        return "redirect:/customer";
    }
}
