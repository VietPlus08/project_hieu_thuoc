package com.java.dto;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;

@Getter @Setter
public class FilterModel {
    Date startDate;
    Date endDate;
    String orderType;
    int orderCode;
}
