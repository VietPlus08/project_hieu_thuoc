<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
    <style>
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <h2>Add New Employee</h2>
    <form:form method="post" action="/employee/save" modelAttribute="employee">
        Name: <form:input path="name"/> <form:errors path="name" cssClass="error"/><br/>
        Address: <form:input path="address"/> <form:errors path="address" cssClass="error"/><br/>
        Email: <form:input path="email"/> <form:errors path="email" cssClass="error"/><br/>
        Age: <form:input path="age"/> <form:errors path="age" cssClass="error"/><br/>
        Account: <form:input path="account"/> <form:errors path="account" cssClass="error"/><br/>
        Password: <form:password path="password"/> <form:errors path="password" cssClass="error"/><br/>
        Re-enter Password: <form:password path="rePassword"/> <form:errors path="rePassword" cssClass="error"/><br/>
        Role: <form:input path="role"/> <form:errors path="role" cssClass="error"/><br/>

        <input type="submit" value="Save"/>
    </form:form>
</body>
</html>
