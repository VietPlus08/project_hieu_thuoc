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
        <th>ID</th>
        <th>Name</th>
        <th>Address</th>
        <th>Email</th>
        <th>Age</th>
        <th>Action</th>
    </tr>
    <c:forEach var="customer" items="${customers}">
        <tr>
            <td>${customer.id}</td>
            <td>${customer.name}</td>
            <td>${customer.address}</td>
            <td>${customer.email}</td>
            <td>${customer.age}</td>
            <td>
                <a href="${pageContext.request.contextPath}/customer/edit/${customer.id}">Edit</a>
                &nbsp;|&nbsp;
                <a href="${pageContext.request.contextPath}/customer/delete/${customer.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
<br/>
<a href="${pageContext.request.contextPath}/customer/new">Add New Customer</a>
</body>
</html>
