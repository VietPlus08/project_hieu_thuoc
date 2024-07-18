<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Order List</title>
</head>
<body>
<h2>Order List</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Total</th>
        <th>Customer</th>
        <th>Date</th>
    </tr>
    <c:forEach var="orderList" items="${orderLists}">
        <tr>
            <td>${orderList.id}</td>
            <td>${orderList.total}</td>
            <td>${orderList.customer.name}</td>
            <td>${orderList.orderDate}</td>
            <td>
                <a href="${pageContext.request.contextPath}/customers/edit/${orderList.id}">Edit</a>
                &nbsp;|&nbsp;
                <a href="${pageContext.request.contextPath}/customers/delete/${orderList.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
<br/>
<a href="${pageContext.request.contextPath}/order/new">Add New Order</a>
</body>
</html>
