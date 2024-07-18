<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Pharmacy Sales</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
    <style>
        body {
            background: #f2f2f2;
        }

        /*td {*/
        /*    padding: 0;*/
        /*}*/
        /*.productRow td input.form-control {*/
        /*    padding: 0;*/
        /*}*/
        .productRow input.form-control {
            background-color: transparent;
            border: none;
        }

        .productRow input.form-control:focus {
            border-color: inherit;
            -webkit-box-shadow: none;
            box-shadow: none;
            outline: none;
        }
    </style>
</head>
<body>
<h1>Pharmacy Sales</h1>

<!-- Danh sách sản phẩm -->
<h2>Product List</h2>
<form:form modelAttribute="orderDto" method="post" action="/order/save">
    <%--    <form:hidden path="customerId" value=""/>--%>
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>Tên thuốc</th>
            <th>ĐVT</th>
            <th>Số lượng</th>
            <th>Giá</th>
            <th>Thành tiền</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
            <%--        <c:forEach items="${products}" var="product" varStatus="status">--%>
            <%--            <tr>--%>
            <%--                <td>${product.name}</td>--%>
            <%--                <td>${product.unit}</td>--%>
            <%--                <td><form:input path="orderItems[${status.index}].quantity"/>--%>
            <%--                <form:hidden path="orderItems[${status.index}].productId" value="${product.id}"/>--%>
            <%--                </td>--%>
            <%--                <td>${product.price}</td>--%>
            <%--&lt;%&ndash;                <td>${product.quantity}</td>&ndash;%&gt;--%>
            <%--                <td>${product.price * product.quantity}</td>--%>
            <%--            </tr>--%>
            <%--        </c:forEach>--%>
        <tr>
            <td><select class="form-control productSelect p-0">
                <option value="">Chọn sản phẩm</option>
                <c:forEach items="${products}" var="product">
                    <option value="${product.id}">${product.name}</option>
                </c:forEach>
            </select></td>
            <td colspan="5"></td>
        </tr>
        <c:forEach varStatus="status" begin="0" end="6">
            <tr class="productRow">
                <td class="product"></td>
                <td class="unit"></td>
                <td class="p-0">
                    <form:input type="text" class="form-control quantity" name="quantity" disabled="true"
                                path="orderItems[${status.index}].quantity"/>
                    <form:hidden path="orderItems[${status.index}].productId" value=""/>
                </td>
                <td class="price"></td>
                <td class="total"></td>
                <td>
                    <button type="button" class="btn btn-danger btn-sm removeRow">Xóa</button>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="2"></td>
            <td colspan="2" class="text-right">Tổng tiền:</td>
            <td><input type="text" class="form-control grandTotal p-0" readonly></td>
            <td></td>
        </tr>
        </tbody>
    </table>
    <%--    <button type="button" class="btn btn-primary btn-sm" id="addRow">Thêm sản phẩm</button>--%>
    <input type="submit" value="Submit Order"/>
</form:form>

<!-- Chi tiết đơn hàng -->
<%--<h2>Order Details</h2>--%>
<%--<table>--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th>Product</th>--%>
<%--        <th>Quantity</th>--%>
<%--        <th>Price</th>--%>
<%--&lt;%&ndash;        <th>Total</th>&ndash;%&gt;--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <c:forEach items="${orderItems}" var="item">--%>
<%--        <tr>--%>
<%--            <td>${item.product.name}</td>--%>
<%--            <td>${item.quantity}</td>--%>
<%--            <td>${item.product.price}</td>--%>
<%--&lt;%&ndash;            <td>${item.totalPrice}</td>&ndash;%&gt;--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--    </tbody>--%>
<%--</table>--%>

<%--<!-- Tổng cộng -->--%>
<%--<h3>Total: ${order.total}</h3>--%>
<%--<form:form method="post" action="placeOrder">--%>
<%--    <input type="submit" value="Place Order"/>--%>
<%--</form:form>--%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        $(document).on('change', '.productSelect', function () {
            var productId = $(this).val();
            var row = $('.productRow:has(td:empty)').first();
            console.log('product ' + productId);
            console.log(productId !== '');
            // Nếu chọn sản phẩm
            if (productId !== '') {
                var selectedProduct = getProductById(productId);
                console.log(selectedProduct);
                console.log(selectedProduct.name);
                if (selectedProduct) {
                    // console.log(selectedProduct)
                    row.find('.product').text(selectedProduct.name);
                    row.find('.unit').text(selectedProduct.unit);
                    row.find('.price').text(selectedProduct.price);
                    row.find('.quantity').prop('disabled', false);
                    row.find('.quantity').val(1);
                    var totalPrice = selectedProduct.price * row.find('.quantity').val();
                    row.find('.total').text(totalPrice.toFixed(2));
                    row.find('input[type="hidden"][name^="orderItems"]').val(selectedProduct.id);
                    updateGrandTotal();
                } else {
                    alert('Không tìm thấy sản phẩm.');
                }
            } else {
                row.find('.product').text('');
                row.find('.unit').text('');
                row.find('.price').text('');
                row.find('.quantity').val('').prop('disabled', true);
                row.find('.total').text('');
                updateGrandTotal();
            }
        });

        // bắt event input khi nhập quantity
        $(document).on('input', '.quantity', function () {
            var row = $(this).closest('tr');
            var price = parseFloat(row.find('.price').text());
            var quantity = parseFloat($(this).val());
            if (!isNaN(price) && !isNaN(quantity)) {
                var totalPrice = price * quantity;
                row.find('.total').text(totalPrice.toFixed(2));
            } else {
                row.find('.total').text('');
            }
            updateGrandTotal();
        });

        // Xử lý sự kiện khi xóa hàng sản phẩm
        $(document).on('click', '.removeRow', function () {
            $(this).closest('.productRow').find('.product').text('');
            $(this).closest('.productRow').find('.unit').text('');
            $(this).closest('.productRow').find('.price').text('');
            $(this).closest('.productRow').find('.quantity').val('').prop('disabled', true);
            $(this).closest('.productRow').find('.total').text('');
        });

        function updateGrandTotal() {
            var grandTotal = 0;
            $('.productRow').each(function () {
                var total = parseFloat($(this).find('.total').text());
                if (!isNaN(total)) {
                    grandTotal += total;
                }
            });
            $('.grandTotal').val(grandTotal.toFixed(2));
        }

        // Function để lấy thông tin sản phẩm dựa trên productId (cần thay đổi tương ứng)
        function getProductById(productId) {
            var products = [
                {
                    id: 1,
                    name: 'Paracetamol',
                    unit: 'Viên nén',
                    price: 5.00,
                    quantity: 200
                },
                {
                    id: 2,
                    name: 'Ibuprofen',
                    unit: 'Viên nén',
                    price: 8.00,
                    quantity: 150
                },
                {
                    id: 3,
                    name: 'Amoxicillin',
                    unit: 'Viên nang',
                    price: 12.50,
                    quantity: 100
                },
                {
                    id: 4,
                    name: 'Ciprofloxacin',
                    unit: 'Viên nén',
                    price: 15.00,
                    quantity: 80
                },
                {
                    id: 5,
                    name: 'Aspirin',
                    unit: 'Viên nén',
                    price: 3.50,
                    quantity: 250
                },
                {
                    id: 6,
                    name: 'Metformin',
                    unit: 'Viên nén',
                    price: 7.20,
                    quantity: 180
                },
                {
                    id: 7,
                    name: 'Omeprazole',
                    unit: 'Viên nang',
                    price: 9.00,
                    quantity: 120
                },
                {
                    id: 8,
                    name: 'Atorvastatin',
                    unit: 'Viên nén',
                    price: 10.00,
                    quantity: 130
                },
                {
                    id: 9,
                    name: 'Simvastatin',
                    unit: 'Viên nén',
                    price: 11.00,
                    quantity: 110
                },
                {
                    id: 10,
                    name: 'Levothyroxine',
                    unit: 'Viên nén',
                    price: 6.00,
                    quantity: 140
                }
            ];

            return products.find(product => product.id.toString() === productId);
        }
    });
</script>
</body>
</html>