<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Hóa Đơn</title>
    <meta charset="UTF-8">
    <title>Pharmacy Sales</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <style>
        :root {
            --primary-color-1: #ffffff;
            --primary-color-2: #fafafa;
            --primary-color-3: #f0f0f0;
            --primary-color-4: #bfbfbf;
            --primary-color-5: #595959;

            --line-color-1: #bae7ff;
            --line-color-2: #91d5ff;
            --line-color-3: #40a9ff;
            --line-color-4: #1890ff;
            --line-color-5: #096dd9;

            --background-color: #f0f0f0;
            --text-color: #333;
            --container-color: #ccc;
        }

        * {
            background-color: var(--primary-color-2);
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: var(--primary-color-2);
        }

        #order-details {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: var(--primary-color-1);
            border-radius: 8px;
        }

        h1, h3 {
            color: var(--line-color-4);
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }

        h3 {
            font-size: 18px;
            margin-top: 20px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div id="order-details">
    <h1>Chi Tiết Hóa Đơn</h1>
    <p><span>Mã Hóa Đơn:</span> ${order.orderCode}</p>
    <p><span>Tên Khách Hàng:</span> ${order.customer.name}</p>
    <p><span>Ngày Lập:</span> ${order.orderDate}</p>
    <p><span>Giờ Lập:</span> ${order.orderTime}</p>
    <p><span>Người Lập:</span> ${order.employee.name}</p>
    <p><span>Tổng Tiền:</span> ${order.total}</p>
    <h3>Chi Tiết Sản Phẩm</h3>
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <th style="width: 30%">Tên Sản Phẩm</th>
            <th style="width: 20%">Đơn Vị</th>
            <th style="width: 15%">S.Lượng</th>
            <th style="width: 15%">Giá</th>
            <th style="width: 20%">Tổng</th>
        </tr>
        <c:forEach var="item" items="${order.orderItems}">
            <tr>
                <td>${item.product.name}</td>
                <td>${item.product.unit}</td>
                <td>${item.quantity}</td>
                <td>${item.product.price}</td>
                <td>${item.quantity * item.product.price}</td>
            </tr>
        </c:forEach>
    </table>
    <button class="btn btn-outline-primary btn-sm" onclick="printOrder()">In Hóa Đơn</button>
</div>
<script>
    function printOrder() {
        var printContents = document.getElementById('order-details').innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
    }
</script>
</body>
</html>