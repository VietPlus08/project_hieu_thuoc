<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer List</title>
</head>
<body>
<h2>Customer List</h2>
<table border="1">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Age</th>
        <th>Email</th>
        <th>PHone</th>
        <th>Action</th>
    </tr>

    <c:forEach var="customer" items="${customers}">
        <tr>
            <td>${customer.id}</td>
            <td>${customer.name}</td>
            <td>${customer.age}</td>
            <td>${customer.email}</td>
            <td>${customer.phone}</td>
            <td>
                <a href="/customer/edit/${customer.id}">Edit</a> |
                <a href="/customer/delete/${customer.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>

</table>




<%--<table border="1">--%>
<%--    <tr>--%>
<%--        <th>ID</th>--%>
<%--        <th>Name</th>--%>
<%--        <th>Address</th>--%>
<%--        <th>Email</th>--%>
<%--        <th>Age</th>--%>
<%--        <th>Action</th>--%>
<%--    </tr>--%>
<%--    <c:forEach var="customer" items="${customers}">--%>
<%--        <tr>--%>
<%--            <td>${customer.id}</td>--%>
<%--            <td>${customer.name}</td>--%>
<%--            <td>${customer.address}</td>--%>
<%--            <td>${customer.email}</td>--%>
<%--            <td>${customer.age}</td>--%>
<%--            <td>--%>
<%--                <a href="/customer/edit/${customer.id}">Edit</a>--%>
<%--                &nbsp;|&nbsp;--%>
<%--                <a href="/customer/delete/${customer.id}">Delete</a>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--</table>--%>
<br/>
<a href="/customer/new">Add New Customer</a>
</body>
</html>
