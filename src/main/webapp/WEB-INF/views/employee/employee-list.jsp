<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table>
    <tr>
        <th>id</th>
        <th>name</th>
    </tr>
    <c:forEach var="employee" items="${employees}">
        <tr>
            <td>${employee.id}</td>
            <td>${employee.name}</td>
            <td><a href="/employee/edit/${employee.id}">edit</a></td>
            <td><a href="/employee/delete/${employee.id}">delete</a></td>
            <td><a href="/employee/detal/${employee.id}">detail</a></td>
        </tr>


    </c:forEach>

</table>
</body>
</html>
