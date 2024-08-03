package com.java.controller;

import com.java.dto.FilterModel;
import com.java.dto.OrderDto;
import com.java.model.Employee;
import com.java.model.OrderList;
import com.java.service.impl.*;
import com.java.utils.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

    @Autowired
    private EmployeeService employeeService;

    @GetMapping("/main")
    public String main() {
        return "order/order-main";
    }

    // quản lý bán hàng
    @GetMapping
    public String list(Model model) {
        List<OrderList> orderLists = orderService.getList();
        model.addAttribute("list1", Const.LIST_FILTER_1);
        model.addAttribute("list2", Const.LIST_FILTER_2);
        model.addAttribute("orderLists", orderLists);
        model.addAttribute("filterModel", new FilterModel());
        return "order/order-list";
    }

    // bán hàng
    @GetMapping("/new")
    public String showCreateForm(Model model, HttpSession session) {
//        if(session.getAttribute("username") == null){
//            return "login/login-form";
//        }
//        Customer customer = new Customer();
        String employeeName = (String) session.getAttribute("fullName");
//        if (employeeName == null || employeeName.isEmpty()) employeeName = Const.CURRENT_EMPLOYEE.getName();
        OrderDto orderDto = orderService.createForm(employeeName);
//        model.addAttribute("customer", customer);
        model.addAttribute("products", productService.getList());
        model.addAttribute("orderItems", orderItemService.getList());
        // tạo list rỗng orderitem
        orderDto.setOrderItems(new ArrayList<>());
        model.addAttribute("orderDto", orderDto);
        return "order/order-form";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute("orderDto") OrderDto order, RedirectAttributes redirectAttributes, HttpSession session) {
//        if(session.getAttribute("username") == null){
//            return "login/login-form";
//        }
        String employeeName = (String) session.getAttribute("fullName");
//        Employee employee = employeeService.getByName(employeeName);
        order.setEmployeeName(employeeName);
        Map<String, String> error = orderService.createOrder(order);
        if (error.isEmpty()) {
            redirectAttributes.addFlashAttribute("successMessage", "Đặt hàng thành công!");
        } else {
            String message = null;
            for (Map.Entry<String, String> entry : error.entrySet()) {
                message = entry.getValue();
            }
            redirectAttributes.addFlashAttribute("failMessage", "Đặt hàng không thành công. " + message);
        }
        return "redirect:/order/new";
    }

    @GetMapping("/{id}")
    public String showDetailOrder(@PathVariable("id") Integer id, Model model) {
        OrderList order = orderService.showDetailOrder(id);
        model.addAttribute("order", order);
        return "order/order-detail";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        orderService.delete(id);
        return "redirect:/order";
    }

    @PostMapping("/filter")
    public String filter(@ModelAttribute("filterModel") FilterModel filterModel,
                         Model model){
        List<OrderList> orderLists = orderService.filter(filterModel);
        model.addAttribute("list1", Const.LIST_FILTER_1);
        model.addAttribute("list2", Const.LIST_FILTER_2);
        model.addAttribute("orderLists", orderLists);
        model.addAttribute("filterModel", filterModel);
//        System.out.println(filterModel.getStartDate());
//        System.out.println(filterModel.getEndDate());
        return "order/order-list";
    }

}
