package com.java.dto;

import com.java.utils.Const;
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

    public FilterModel() {
        orderType1 = Const.LIST_FILTER_1[0];
        orderType2 = Const.LIST_FILTER_2[0];
    }
}
