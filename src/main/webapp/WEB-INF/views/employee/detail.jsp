<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Detail</title>
</head>
<body>
    <h2>Employee Detail</h2>
    <p>ID: ${Employee.id}</p>
    <p>Name: ${Employee.name}</p>
    <p>Address: ${Employee.address}</p>
    <p>Email: ${Employee.email}</p>
    <p>Age: ${Employee.age}</p>
    <p>Account: ${Employee.account}</p>
    <p>Role: ${Employee.role}</p>
    <p>Deleted: ${Employee.isDelete}</p>

    <br/>
    <a href="/employee">Quay về</a>
</body>
</html>
