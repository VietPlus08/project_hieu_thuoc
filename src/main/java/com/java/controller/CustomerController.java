package com.java.controller;

import com.java.model.Customer;
import com.java.repo.CustomerRepo;
import com.java.service.impl.CustomerService;
import com.sun.org.apache.xpath.internal.operations.Mod;
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
    @Autowired
    private CustomerRepo customerRepo;
    // server --> client
    @GetMapping
    public String list(Model model){
        List<Customer> list = customerService.getList();
        model.addAttribute("customers",list);
        return "customer/customer-list";
    }

    @GetMapping("/new")
    public String createForm(Model model){
        model.addAttribute("customer", new Customer());
        return "customer/customer-form";
    }
    // client --> server
    @PostMapping("/save")
    public String save(@ModelAttribute("customer") Customer customer){
        customerService.create(customer);
        return "redirect:/customer";
//        return "/customer/customer-form"; // loi tao nhieu customer
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id){
        customerService.delete(id);
        return "redirect:/customer";
    }

    @GetMapping("/edit/{id}")
    public String createFormEdit(@PathVariable("id") Integer id, Model model){
        Customer customer = customerService.getById(id);
        model.addAttribute("customer", customer);
        return "customer/customer-form-update";
    }

    @PostMapping("/save-edit")
    public String Edit(@ModelAttribute("customer") Customer customer){
        customerService.update(customer);
        return "redirect:/customer";
    }

//    @GetMapping
//    public String listCustomers(Model model) {
//        List<Customer> customers = customerService.getList();
//        model.addAttribute("customers", customers);
//        return "customer/customer-list";
//    }
//
//    @GetMapping("/new")
//    public String showCreateForm(Model model) {
//        Customer customer = new Customer();
//        model.addAttribute("customer", customer);
//        return "customer/customer-form";
//    }
//
//    // redirect sang order screen kèm customerId
//    @PostMapping("/save")
//    public String saveCustomer(@ModelAttribute("customer") Customer customer, RedirectAttributes redirectAttributes) {
//        Customer result = customerService.create(customer);
//        redirectAttributes.addFlashAttribute("customer", result);
//        return "redirect:/order/new";
//    }
//
//    @GetMapping("/edit/{id}")
//    public String showUpdateForm(@PathVariable("id") Integer id, Model model) {
//        Customer customer = customerService.getById(id);
//        model.addAttribute("customer", customer);
//        return "customer/customer-form";
//    }
//
//    @GetMapping("/delete/{id}")
//    public String deleteCustomer(@PathVariable("id") Integer id) {
//        customerService.delete(id);
//        return "redirect:/customer";
//    }
}
