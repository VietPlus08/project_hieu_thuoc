package com.java.utils;

import com.java.model.Customer;
import com.java.model.Employee;

public class Const {
    public static Customer KHACH_LE = new Customer(1, "Khách lẻ");
    public static Customer KHACH_SI = new Customer(2, "Khách sỉ");
    public static Customer KHACH_THEO_TOA = new Customer(3, "Khách theo toa");
    public static String[] DANH_SACH_KHACH = {"Khách lẻ", "Khách sỉ", "Khách theo toa"};
    public static String[] LIST_FILTER_1 = {"Bán lẻ", "Bán sỉ", "Bán theo đơn", "Khách hoàn trả"};
    public static String[] LIST_FILTER_2 = {"Tên khách", "Ngày lập", "Tổng tiền"};

    public static Employee CURRENT_EMPLOYEE = new Employee(1, "Nguyễn Hoàng Nhật");
}
