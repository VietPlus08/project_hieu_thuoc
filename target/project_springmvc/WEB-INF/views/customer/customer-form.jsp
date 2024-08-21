<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Form</title>
</head>
<style>
    .error{
        color: red;
    }
</style>
<body>
<h2>Customer Form</h2>
<form:form method="post" action="/customer/save" modelAttribute="customer">
    Name: <form:input type="text" path="name"/><br/>
    <form:errors path="name" cssClass="error"/> <br>
    Address: <form:input type="text" path="address"/><br/>
    <form:errors path="address" cssClass="error"/> <br>
    Phone: <form:input type="text" path="phone"/><br/>
    <form:errors path="phone" cssClass="error"/> <br>
    Email: <form:input type="text" path="email"/><br/>
    <form:errors path="email" cssClass="error"/> <br>
    Age: <form:input path="age"/><br/>
    <form:errors path="age" cssClass="error"/> <br>
    <input type="submit" value="Save"/>
</form:form>
<br/>
<a href="/customer">Back to Customer List</a>
</body>
</html>
