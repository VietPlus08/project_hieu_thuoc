<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Form</title>
</head>
<body>
<h2>Customer Form</h2>
<form method="post" action="${pageContext.request.contextPath}/customer/save">
    <input type="hidden" name="id" value="${customer.id}"/>
    Name: <input type="text" name="name" value="${customer.name}"/><br/>
    Address: <input type="text" name="address" value="${customer.address}"/><br/>
    Email: <input type="text" name="email" value="${customer.email}"/><br/>
    Age: <input type="text" name="age" value="${customer.age}"/><br/>
    <input type="submit" value="Save"/>
</form>
<br/>
<a href="${pageContext.request.contextPath}/customer">Back to Customer List</a>
</body>
</html>
