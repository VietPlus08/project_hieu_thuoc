package com.java.dto;

import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
import java.time.LocalTime;

@Getter @Setter
public class FilterModel {
    Date startDate;
    Date endDate;
    LocalTime startTime;
    LocalTime endTime;
    String orderType1;
    String orderType2;
}
