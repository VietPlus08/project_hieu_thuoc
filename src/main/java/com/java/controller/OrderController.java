package com.java.controller;

import com.java.dto.FilterModel;
import com.java.dto.OrderDto;
import com.java.dto.OrderItemDto;
import com.java.model.Customer;
import com.java.model.OrderList;
import com.java.service.impl.CustomerService;
import com.java.service.impl.OrderItemService;
import com.java.service.impl.OrderService;
import com.java.service.impl.ProductService;
import com.java.utils.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private OrderItemService orderItemService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private ProductService productService;

    @GetMapping
    public String list(Model model) {
        List<OrderList> orderLists = orderService.getList();
        model.addAttribute("list1", Const.LIST_FILTER_1);
        model.addAttribute("list2", Const.LIST_FILTER_2);
        model.addAttribute("orderLists", orderLists);
        model.addAttribute("filterModel", new FilterModel());
        return "order/order-list";
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        Customer customer = new Customer();
        OrderDto orderDto = orderService.createForm();
        model.addAttribute("customer", customer);
        model.addAttribute("products", productService.getList());
        model.addAttribute("orderItems", orderItemService.getList());
        orderDto.setOrderItems(new ArrayList<>());
        model.addAttribute("orderDto", orderDto);
        return "order/order-form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute("orderDto") OrderDto order, RedirectAttributes redirectAttributes) {
        boolean result = orderService.createOrder(order);
        if (result) {
            redirectAttributes.addFlashAttribute("successMessage", "Đặt hàng thành công!");
        } else {
            redirectAttributes.addFlashAttribute("failMessage", "Đặt hàng không thành công. Vui lòng thử lại.");
        }
        return "redirect:/order/new";
    }

    //    @GetMapping("/edit/{id}")
//    public String showUpdateForm(@PathVariable("id") Integer id, Model model) {
//        Order order = orderService.getById(id);
//        model.addAttribute("order", order);
//        return "order/order-form";
//    }
//
    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        orderService.delete(id);
        return "redirect:/order";
    }

}
