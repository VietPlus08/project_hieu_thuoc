<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
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
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 1280px;
            margin: 0 auto;
            background-color: var(--primary-color-2);
        }

        .nav-light {
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid var(--line-color-3);
            margin: 0 auto;
            /*margin-bottom: 5px;*/
            padding: 0 16px;
        }

        .nav-light-2 {
            display: flex;
            /*justify-content: ;*/
            border-bottom: 1px solid var(--line-color-3);
            margin: 0 auto;
            padding: 0 16px;
        }

        .nav-light a, .nav-light-2 a {
            color: #000;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .nav-light a:hover, .nav-light-2 a:hover, .column1 a:hover, .sub-main-1 a:hover, .sub-main-2 a:hover {
            background-color: var(--line-color-1);
            /* color: black; */
            box-shadow: 0 2px 0 var(--line-color-1);
        }

        .a-img {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .content {
            padding: 0;
            max-width: 1280px;
            margin: 0 auto;
            height: 100%;
        }

        .content-flex {
            display: flex;
            /*flex-direction: column;*/
            /*height: 100vh;*/
        }

        .container1 {
            display: flex;
            justify-content: flex-start;
        }

        .container2 {
            display: flex;
            justify-content: flex-end;
        }

        .nav-light .icon {
            display: flex;
            width: 36px;
            height: 100%;
            align-self: center;
        }

        .nav-light .icon:hover {
            box-shadow: 0 2px 0 var(--line-color-1);
        }

        .search_center {
            text-align: center;
            height: 150px;
        }

        .main_title {
            display: flex;
            justify-content: center;
            padding: 16px 0 0 0;
            margin-bottom: 25px;
            position: relative;
            color: #000;
        }

        .main_title::after {
            content: "";
            position: absolute;
            bottom: -8px;
            width: 56px;
            height: 2px;
            background-color: var(--line-color-5);
        }

        .column1 {
            width: 20%;
            display: flex;
            flex-direction: column;
            border-left: var(--line-color-3);
        }

        .column2 {
            width: 80%;
            display: flex;
            flex-direction: column;
            /*padding: 5px 0;*/
        }

        .column1 a, .sub-main a, .sub-main-1 a, .sub-main-2 a {
            color: #000;
            padding: 5px 20px;
            text-decoration: none;
        }

        .sub-main, .sub-main-1, .sub-main-2 {
            display: flex;
            flex-wrap: wrap;
            /*padding: 5px;*/
        }

        /*.sub-main a {*/
        /*    color: #000;*/
        /*    padding: 5px 20px;*/
        /*    text-decoration: none;*/
        /*}*/

        .sub-main div {
            display: flex;
            padding: 3px 0 5px 0;
        }

        .sub-main span {
            width: 120px;
            padding-left: 10px;
        }

        .sub-main input {
            width: 180px;
            margin-right: 20px;
        }

        .main {
            display: flex;
            flex-direction: column;
        }

        .main-all-button {
            display: flex;
            justify-content: flex-end;
        }

        .main-all-button button, .sub-main button {
            margin: 0 5px;
            width: 110px;
        }

        .productRow input.form-control, .selectRow select, .inputRow input {
            background-color: transparent;
            border: none;
        }

        .productRow input.form-control:focus, .selectRow select:focus, .inputRow input:focus {
            border-color: inherit;
            -webkit-box-shadow: none;
            box-shadow: none;
            outline: none;
        }

        .table-hover tbody tr:hover {
            background-color: var(--line-color-1);
            cursor: pointer;
        }

        .productRow.selected, .container1 a.selected, .sub-main-1 a.selected, .sub-main-2 a.selected {
            background-color: var(--line-color-1);
        }

        /*.container1 a.selected {*/
        /*    color: #fff; !* Màu chữ khi liên kết được chọn *!*/
        /*    background-color: #40a9ff; !* Màu nền khi liên kết được chọn *!*/
        /*}*/
        .horizontal-bar {
            width: 100%;
            height: 1px;
            background: linear-gradient(to right, rgba(64, 169, 255, 0) 0%, rgba(64, 169, 255, 1) 50%, rgba(64, 169, 255, 0) 100%);
        }

        .horizontal-bar-right {
            width: 100%; /* Chiều rộng của thanh ngang sẽ chiếm toàn bộ chiều rộng của màn hình */
            height: 1px; /* Chiều cao của thanh ngang, bạn có thể thay đổi theo ý muốn */
            background: linear-gradient(to right, rgba(64, 169, 255, 1) 50%, rgba(64, 169, 255, 0) 100%);
        }

        .vertical-bar {
            height: 100%;
            width: 1px;
            background-color: var(--primary-color-3);
        }

        .alert {
            position: fixed;
            top: 50px;
            right: 50px;
            padding: 10px;
            border-radius: 5px;
            z-index: 9999;
            display: none;
            min-width: 500px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>
<div id="box">
    <div class="nav-light">
        <div class="container1">
            <a href="#home">Hệ thống</a>
            <a href="#about">Chức năng</a>
            <a href="#services">Quản lý thông tin</a>
            <a href="#contact">Tra cứu</a>
            <a href="#report">Báo cáo</a>
            <a href="#help">Trợ giúp</a>
        </div>
        <div class="container2">
            <svg
                    class="icon"
                    viewBox="0 0 24 24"
                    fill="none"
                    xmlns="http://www.w3.org/2000/svg"
            >
                <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                <g
                        id="SVGRepo_tracerCarrier"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                ></g>
                <g id="SVGRepo_iconCarrier">
                    <path
                            fill-rule="evenodd"
                            clip-rule="evenodd"
                            d="M11.0175 19C10.6601 19 10.3552 18.7347 10.297 18.373C10.2434 18.0804 10.038 17.8413 9.76171 17.75C9.53658 17.6707 9.31645 17.5772 9.10261 17.47C8.84815 17.3365 8.54289 17.3565 8.30701 17.522C8.02156 17.7325 7.62943 17.6999 7.38076 17.445L6.41356 16.453C6.15326 16.186 6.11944 15.7651 6.33361 15.458C6.49878 15.2105 6.52257 14.8914 6.39601 14.621C6.31262 14.4332 6.23906 14.2409 6.17566 14.045C6.08485 13.7363 5.8342 13.5051 5.52533 13.445C5.15287 13.384 4.8779 13.0559 4.87501 12.669V11.428C4.87303 10.9821 5.18705 10.6007 5.61601 10.528C5.94143 10.4645 6.21316 10.2359 6.33751 9.921C6.37456 9.83233 6.41356 9.74433 6.45451 9.657C6.61989 9.33044 6.59705 8.93711 6.39503 8.633C6.1424 8.27288 6.18119 7.77809 6.48668 7.464L7.19746 6.735C7.54802 6.37532 8.1009 6.32877 8.50396 6.625L8.52638 6.641C8.82735 6.84876 9.21033 6.88639 9.54428 6.741C9.90155 6.60911 10.1649 6.29424 10.2375 5.912L10.2473 5.878C10.3275 5.37197 10.7536 5.00021 11.2535 5H12.1115C12.6248 4.99976 13.0629 5.38057 13.1469 5.9L13.1625 5.97C13.2314 6.33617 13.4811 6.63922 13.8216 6.77C14.1498 6.91447 14.5272 6.87674 14.822 6.67L14.8707 6.634C15.2842 6.32834 15.8528 6.37535 16.2133 6.745L16.8675 7.417C17.1954 7.75516 17.2366 8.28693 16.965 8.674C16.7522 8.99752 16.7251 9.41325 16.8938 9.763L16.9358 9.863C17.0724 10.2045 17.3681 10.452 17.7216 10.521C18.1837 10.5983 18.5235 11.0069 18.525 11.487V12.6C18.5249 13.0234 18.2263 13.3846 17.8191 13.454C17.4842 13.5199 17.2114 13.7686 17.1083 14.102C17.0628 14.2353 17.0121 14.3687 16.9562 14.502C16.8261 14.795 16.855 15.1364 17.0323 15.402C17.2662 15.7358 17.2299 16.1943 16.9465 16.485L16.0388 17.417C15.7792 17.6832 15.3698 17.7175 15.0716 17.498C14.8226 17.3235 14.5001 17.3043 14.2331 17.448C14.0428 17.5447 13.8475 17.6305 13.6481 17.705C13.3692 17.8037 13.1636 18.0485 13.1099 18.346C13.053 18.7203 12.7401 18.9972 12.3708 19H11.0175Z"
                            stroke="#000000"
                            stroke-width="1.5"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                    ></path>
                    <path
                            fill-rule="evenodd"
                            clip-rule="evenodd"
                            d="M13.9747 12C13.9747 13.2885 12.9563 14.333 11.7 14.333C10.4437 14.333 9.42533 13.2885 9.42533 12C9.42533 10.7115 10.4437 9.66699 11.7 9.66699C12.9563 9.66699 13.9747 10.7115 13.9747 12Z"
                            stroke="#000000"
                            stroke-width="1.5"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                    ></path>
                </g>
            </svg>
        </div>
    </div>
    <div class="nav-light-2">
        <div class="" style="display: flex">
            <a href="/order/new" class="a-img">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" width="50" height="50">
                    <!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path d="M0 24C0 10.7 10.7 0 24 0L69.5 0c22 0 41.5 12.8 50.6 32l411 0c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3l-288.5 0 5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5L488 336c13.3 0 24 10.7 24 24s-10.7 24-24 24l-288.3 0c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5L24 48C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"/>
                </svg>
                QL Bán hàng
            </a>
            <a href="#nk" class="a-img">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" width="50" height="50">
                    <!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path d="M368.6 96l76.8 96L288 192l0-96 80.6 0zM224 80l0 112L64 192c-17.7 0-32 14.3-32 32l0 64c-17.7 0-32 14.3-32 32s14.3 32 32 32l33.1 0c-.7 5.2-1.1 10.6-1.1 16c0 61.9 50.1 112 112 112s112-50.1 112-112c0-5.4-.4-10.8-1.1-16l66.3 0c-.7 5.2-1.1 10.6-1.1 16c0 61.9 50.1 112 112 112s112-50.1 112-112c0-5.4-.4-10.8-1.1-16l33.1 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l0-64c0-17.7-14.3-32-32-32l-48.6 0L418.6 56c-12.1-15.2-30.5-24-50-24L272 32c-26.5 0-48 21.5-48 48zm0 288a48 48 0 1 1 -96 0 48 48 0 1 1 96 0zm288 0a48 48 0 1 1 -96 0 48 48 0 1 1 96 0z"/>
                </svg>
                QL Nhập kho
            </a>
            <a href="#xk" class="a-img">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="50" height="50">
                    <!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                    <path d="M320 0c-17.7 0-32 14.3-32 32s14.3 32 32 32l82.7 0L201.4 265.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L448 109.3l0 82.7c0 17.7 14.3 32 32 32s32-14.3 32-32l0-160c0-17.7-14.3-32-32-32L320 0zM80 32C35.8 32 0 67.8 0 112L0 432c0 44.2 35.8 80 80 80l320 0c44.2 0 80-35.8 80-80l0-112c0-17.7-14.3-32-32-32s-32 14.3-32 32l0 112c0 8.8-7.2 16-16 16L80 448c-8.8 0-16-7.2-16-16l0-320c0-8.8 7.2-16 16-16l112 0c17.7 0 32-14.3 32-32s-14.3-32-32-32L80 32z"/>
                </svg>
                QL Xuất kho
            </a>
        </div>
    </div>
    <c:if test="${not empty successMessage}">
        <div id="alert1" class="alert alert-success">
                ${successMessage}
        </div>
    </c:if>
    <c:if test="${not empty failMessage}">
        <div id="alert2" class="alert alert-danger">
                ${failMessage}
        </div>
    </c:if>
    <div class="content content-flex">
        <div class="column1">
            <a href="">Chọn nhanh</a>
            <div class="horizontal-bar"></div>
            <a href="/order/new">F2 - Bán hàng</a>
            <a href="">F3 - Nhập kho</a>
            <a href="">F4 - Xuất hoàn trả</a>
            <a href="">F5 - Xuất hủy</a>
            <div class="horizontal-bar"></div>
            <a href="">F6 - Tra cứu nhanh</a>
            <div class="horizontal-bar"></div>
            <a href="">F7 - Hệ thống báo cáo</a>
            <a href="">F8 - Nhật kí bán hàng</a>
            <div class="horizontal-bar"></div>
            <a href="">F9 - Đăng xuất</a>
        </div>
        <div class="vertical-bar"></div>
        <div class="column2">
            <div class="sub-main-1">
                <a href="">Trang chủ</a>
                <a href="${pageContext.request.contextPath}/order">QL bán hàng</a>
                <a href="${pageContext.request.contextPath}/order/new">Bán hàng</a>
            </div>
            <div class="horizontal-bar-right"></div>
            <div class="sub-main-2">
                <a href="">1. Bán lẻ</a>
                <a href="">2. Bán theo đơn</a>
                <a href="">3. Bán sỉ</a>
                <a href="">4. Khách hoàn trả</a>
            </div>
            <div class="horizontal-bar-right"></div>
            <form:form modelAttribute="orderDto" method="post" action="/order/save">
            <div class="sub-main p-2">
                <div>
                    <span>Số phiếu</span>
                    <form:input type="text" path="orderCode" disabled="true"/>
                </div>
                <div>
                    <span>Khách hàng</span>
                    <form:input type="text" path="customerName" disabled="true"/>
                </div>
                <div>
                    <span>Nhân viên</span>
                    <form:input type="text" path="employeeName" disabled="true"/>
                </div>
                <div>
                    <span>Ghi chú</span>
                    <input type="text"/>
                </div>
                <div>
                    <span>Ngày lập</span>
                    <form:input type="date" path="orderDate" disabled="true"/>
                </div>
            </div>

            <div class="main p-1">
                    <%--    <form:hidden path="customerId" value=""/>--%>
                <div>
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th style="width: 30%">Tên thuốc</th>
                            <th style="width: 15%">ĐVT</th>
                            <th style="width: 15%">Số lượng</th>
                            <th style="width: 20%">Giá</th>
                            <th style="width: 20%">Thành tiền</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="selectRow">
                            <td><select class="form-select productSelect p-0">
                                <option value="">
                                    <span>Chọn sản phẩm </span>
                                </option>
                                <c:forEach items="${products}" var="product">
                                    <option value="${product.id}">${product.name}</option>
                                </c:forEach>
                            </select></td>
                            <td colspan="4"></td>
                        </tr>
                        <c:forEach varStatus="status" begin="0" end="6">
                            <tr class="productRow" data-index="${status.index}">
                                <td class="product"></td>
                                <td class="unit"></td>
                                <td class="p-0">
                                    <form:input type="number" class="form-control quantity" name="quantity"
                                                path="orderItems[${status.index}].quantity"/>
                                    <form:hidden path="orderItems[${status.index}].productId" value=""/>
                                    <form:hidden path="orderItems[${status.index}].price" value=""/>
                                </td>
                                <td class="price"></td>
                                <td class="total"></td>
                            </tr>
                        </c:forEach>
                        <tr class="inputRow">
                            <td colspan="2"></td>
                            <td class="text-right">Tổng tiền:</td>
                            <td><input type="text" class="form-control grandTotal p-0" readonly></td>
                            <td></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                    <%--    <button type="button" class="btn btn-primary btn-sm" id="addRow">Thêm sản phẩm</button>--%>
                <div class="main-all-button">
                        <%--                    <input type="submit" value="Submit Order"/>--%>
                    <button type="submit" class="btn btn-outline-success btn-sm">Thanh toán</button>
                    <button type="button" class="btn btn-outline-danger btn-sm" id="deleteRow">Xóa thuốc</button>
                        <%--                        <a type="button" class="btn btn-outline-danger" id="deleteRow" href="#">Xóa</a>--%>
                    <button type="button" class="btn btn-outline-secondary btn-sm" style="margin-right: 33px">Trở về</button>
                </div>
            </div>
        </div>
        </form:form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function () {
        var selectedRowIndex;
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
                    console.log(selectedProduct)
                    row.find('.product').text(selectedProduct.name);
                    row.find('.unit').text(selectedProduct.unit);
                    row.find('.price').text(selectedProduct.price.toFixed(2));
                    row.find('.quantity').prop('disabled', false);
                    row.find('.quantity').val(1);
                    var totalPrice = selectedProduct.price * row.find('.quantity').val();
                    row.find('.total').text(totalPrice.toFixed(2));
                    row.find('input[type="hidden"][name^="orderItems"]').val(selectedProduct.id);
                    updateGrandTotal();
                    // set select về mặc định
                    $(this).val('');
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

        // Bắt sự kiện click để chọn hàng và lấy ID của hàng
        $('.productRow').click(function () {
            selectedRowIndex = $(this).data('index');
            console.log('Selected Row Index:', selectedRowIndex);
            $(this).siblings().removeClass('selected');
            $(this).addClass('selected');
        });
        $(document).ready(function () {
            $('.container1 a').click(function (event) {
                event.preventDefault();
                $('.container1 a').removeClass('selected');
                $(this).addClass('selected');
            });
        });
        $(document).ready(function () {
            $('.sub-main-1 a').click(function (event) {
                // event.preventDefault();
                $('.sub-main-1 a').removeClass('selected');
                $(this).addClass('selected');
            });
        });
        $(document).ready(function () {
            $('.sub-main-2 a').click(function (event) {
                // event.preventDefault();
                $('.sub-main-2 a').removeClass('selected');
                $(this).addClass('selected');
            });
        });

        // $(document).ready(function () {
        //     $('.productRow').click(function () {
        //         var selectedRowIndex = $(this).data('index');
        //         console.log('Selected Row Index:', selectedRowIndex);
        //
        //         $(this).siblings().removeClass('selected');
        //         $(this).addClass('selected');
        //     });
        // });

        $('#deleteRow').click(function () {
            if (selectedRowIndex !== undefined) {
                var selectedRow = $('.productRow').eq(selectedRowIndex);
                // console.log(selectedRow);
                // console.log(selectedRow.length);
                if (selectedRow.length) {
                    selectedRow.find('.product').html('');
                    selectedRow.find('.unit').html('');
                    selectedRow.find('.price').html('');
                    selectedRow.find('.quantity').val('').prop('disabled', true);
                    selectedRow.find('.total').html('');
                    selectedRow.removeClass('selected');
                    selectedRowIndex = undefined;
                    console.log("Đã xóa dữ liệu của hàng được chọn.");
                }
            }
        });

        // $(document).ready(function() {
        //     $('.productSelect').change(function() {
        //         var selectedValue = $(this).val();
        //         $(this).val('');
        //     });
        // });

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
    document.addEventListener('DOMContentLoaded', function() {
        var alert = document.getElementById('alert1');
        if (alert) {
            alert.style.display = 'block';
            setTimeout(function() {
                alert.style.opacity = '0';
                setTimeout(function() {
                    alert.style.display = 'none';
                }, 1000);
            }, 5000);
        }
    });
    document.addEventListener('DOMContentLoaded', function() {
        // alert('trang da tai xong');
        var alert = document.getElementById('alert2');
        if (alert) {
            alert.style.display = 'block';
            setTimeout(function() {
                alert.style.opacity = '0';
                setTimeout(function() {
                    alert.style.display = 'none';
                }, 1000);
            }, 5000);
        }
    });
</script>
</body>
</html>