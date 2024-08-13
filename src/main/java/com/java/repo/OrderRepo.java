package com.java.repo;

import com.java.model.OrderList;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.sql.Date;
import java.time.LocalTime;
import java.util.List;

public interface OrderRepo extends JpaRepository<OrderList, Integer> {
    OrderList findTopByOrderByIdDesc();

    @Query("SELECT o FROM OrderList o WHERE o.orderDate > :startDate AND o.orderDate < :endDate")
    List<OrderList> findOrders(@Param("startDate") Date startDate,
                                              @Param("endDate") Date endDate);

    @Query("SELECT o FROM OrderList o WHERE (o.orderDate > :startDate OR (o.orderDate = :startDate AND o.orderTime >= :startTime)) AND (o.orderDate < :endDate OR (o.orderDate = :endDate AND o.orderTime <= :endTime))")
    List<OrderList> findOrdersWithinDateRange(@Param("startDate") Date startDate,
                                          @Param("startTime") LocalTime startTime,
                                          @Param("endDate") Date endDate,
                                          @Param("endTime") LocalTime endTime);
    @Query("SELECT o FROM OrderList o WHERE o.employee.id = :empid")
    List<OrderList> findByEmp(@Param("empid") int id);
}
