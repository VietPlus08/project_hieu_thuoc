package com.java.utils;

import com.java.model.Customer;
import com.java.model.Employee;

public class Const {
    public static final Customer KHACH_LE = new Customer(1, "Khách lẻ");
    public static final Customer KHACH_SI = new Customer(2, "Khách sỉ");
    public static final Customer KHACH_THEO_TOA = new Customer(3, "Khách theo toa");

    public static final String BAN_LE = "Bán lẻ";
    public static final String BAN_SI = "Bán sỉ";
    public static final String BAN_THEO_DON = "Bán theo đơn";

    public static String[] DANH_SACH_KHACH = {"Khách lẻ", "Khách sỉ", "Khách theo toa"};
    public static final String[] LIST_FILTER_1 = {"Bán lẻ", "Bán sỉ", "Bán theo đơn", "Khách hoàn trả"};

    public static final String TEN_KHACH = "Tên khách";
    public static final String NGAY_LAP = "Ngày lập";
    public static final String TONG_TIEN = "Tổng tiền";
    public static final String[] LIST_FILTER_2 = {"Tên khách", "Ngày lập", "Tổng tiền"};

    public static Employee CURRENT_EMPLOYEE = new Employee(1, "Nguyễn Hoàng Nhật");
}
