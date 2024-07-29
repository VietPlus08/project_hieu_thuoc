<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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

        /*.search_center {*/
        /*    text-align: center;*/
        /*    height: 150px;*/
        /*}*/

        /*.main_title {*/
        /*    display: flex;*/
        /*    justify-content: center;*/
        /*    padding: 16px 0 0 0;*/
        /*    margin-bottom: 25px;*/
        /*    position: relative;*/
        /*    color: #000;*/
        /*}*/

        /*.main_title::after {*/
        /*    content: "";*/
        /*    position: absolute;*/
        /*    bottom: -8px;*/
        /*    width: 56px;*/
        /*    height: 2px;*/
        /*    background-color: var(--line-color-5);*/
        /*}*/

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
            width: 110px;
            padding-left: 10px;
        }

        .sub-main input, .sub-main select {
            width: 130px;
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

        .orderRow input.form-control, .selectRow select, .inputRow input {
            background-color: transparent;
            border: none;
        }

        .orderRow input.form-control:focus, .selectRow select:focus, .inputRow input:focus {
            border-color: inherit;
            -webkit-box-shadow: none;
            box-shadow: none;
            outline: none;
        }

        .table-hover tbody tr:hover {
            background-color: var(--line-color-1);
            cursor: pointer;
        }

        .orderRow.selected, .container1 a.selected, .sub-main-1 a.selected, .sub-main-2 a.selected {
            background-color: var(--line-color-1);
        }

        .horizontal-bar {
            width: 100%;
            height: 1px;
            background: linear-gradient(to right, rgba(64, 169, 255, 0) 0%, rgba(64, 169, 255, 1) 50%, rgba(64, 169, 255, 0) 100%);
        }

        .horizontal-bar-right {
            width: 100%;
            height: 1px;
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

        .table-container {
            max-height: 550px; /* Chiều cao tối đa của bảng */
            overflow-y: auto; /* Kích hoạt cuộn dọc */
        }

        table {
            width: 100%;
        }

        .table thead th {
            position: sticky;
            top: 0;
            background: white;
            z-index: var(--primary-color-1);
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
            <a href="${pageContext.request.contextPath}/order/new" class="a-img">
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
            <a href="${pageContext.request.contextPath}/order/new">F2 - Bán hàng</a>
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
                <a href="${pageContext.request.contextPath}/order/main">Trang chủ</a>
                <a href="${pageContext.request.contextPath}/order">QL bán hàng</a>
                <a href="${pageContext.request.contextPath}/order/new">Bán hàng</a>
            </div>
            <div class="horizontal-bar-right"></div>
            <div class="sub-main-2">
                <a href="${pageContext.request.contextPath}/order/new">1. Bán lẻ</a>
                <a href="">2. Bán theo đơn</a>
                <a href="">3. Bán sỉ</a>
                <a href="">4. Khách hoàn trả</a>
            </div>
            <div class="horizontal-bar-right"></div>
            <form:form modelAttribute="filterModel" method="post" action="/order/filter">
            <div class="sub-main p-2">
                <div>
                    <span>Từ ngày</span>
                    <form:input type="date" path="startDate"/>
                </div>
                <div>
                    <span>Đến ngày</span>
                    <form:input type="date" path="endDate"/>
                </div>
                <div>
                    <span>Từ giờ</span>
                    <form:input type="time" path="startTime" cssStyle="width: 110px"/>
                    <span>Đến giờ</span>
                    <form:input type="time" path="endTime" cssStyle="width: 110px"/>
                </div>
                <div>
                    <span>Hiển thị</span>
                    <form:select path="orderType1" class="productSelect p-0">
                        <form:option value="" label="Chọn loại"/>
                        <c:forEach items="${list1}" var="item">
                            <form:option value="${item}" label="${item}"/>
                        </c:forEach>
                    </form:select>
                </div>
                <div>
                    <span>Sắp xếp theo</span>
                    <form:select path="orderType2" class="productSelect p-0">
                        <form:option value="1" label="Chọn loại"/>
                        <c:forEach items="${list2}" var="item">
                            <form:option value="${item}" label="${item}"/>
                        </c:forEach>
                    </form:select>
                </div>

                <div style="justify-content: flex-end; width: 465px">
                    <button type="submit" class="btn btn-outline-info btn-sm">Xem</button>

                </div>
            </div>

            <div class="main p-1">
                <div class="table-container">
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th>Mã hóa đơn</th>
                            <th>Tên Khách hàng</th>
                            <th>Ngày lập</th>
                            <th>Giờ lập</th>
                            <th>Người lập</th>
                            <th>Tổng tiền</th>
                            <th>Ghi chú</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="orderList" items="${orderLists}">
                            <tr class="orderRow" data-order-id="${orderList.id}">>
                                <td>${orderList.orderCode}</td>
                                <td>${orderList.customer.name}</td>
                                <td>${orderList.orderDate}</td>
                                <td>${orderList.orderTime}</td>
                                <td>${orderList.employee.name}</td>
                                <td>${orderList.total}</td>
                                <td></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="main-all-button">
                        <%--                    <button type="button" class="btn btn-outline-success btn-sm">Thêm</button>--%>
                    <a type="button" class="btn btn-outline-success btn-sm"
                       href="${pageContext.request.contextPath}/order/new" style="width: 110px">Thêm</a>
                    <button type="button" class="btn btn-outline-danger btn-sm" id="deleteRow">Xóa</button>
                    <button type="button" class="btn btn-outline-info btn-sm" id="viewRow">In hóa đơn</button>
                    <a type="button" class="btn btn-outline-secondary btn-sm"
                       href="${pageContext.request.contextPath}/order/main" style="width: 110px; margin-right: 33px">Trở về</a>
                    </button>
                </div>
            </div>
        </div>
        </form:form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%--<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function () {
        var selectedRowIndex;
        // Bắt sự kiện click để chọn hàng và lấy ID của hàng
        $(document).on('click', '.orderRow', function () {
            selectedRowIndex = $(this).data('order-id');
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
// Bắt sự kiện click trên nút xem
        $(document).on('click', '#viewRow', function (e) {
            if (selectedRowIndex !== undefined) {
                e.preventDefault();
                var viewUrl = '/order/' + selectedRowIndex;
                console.log(viewUrl);
                $(this).attr('href', viewUrl);
                window.location.href = viewUrl;
            } else {
                alert('Vui lòng chọn một hàng để xem.');
            }
        });
        $(document).on('click', '#deleteRow', function (e) {
            if (selectedRowIndex !== undefined) {
                e.preventDefault();
                var viewUrl = '/order/delete/' + selectedRowIndex;
                console.log(viewUrl);
                $(this).attr('href', viewUrl);
                window.location.href = viewUrl;
            } else {
                alert('Vui lòng chọn một hàng để xóa.');
            }
        });

    });
    document.addEventListener('DOMContentLoaded', function () {
        var alert = document.getElementById('alert1');
        if (alert) {
            alert.style.display = 'block';
            setTimeout(function () {
                alert.style.opacity = '0';
                setTimeout(function () {
                    alert.style.display = 'none';
                }, 1000);
            }, 5000);
        }
    });
    document.addEventListener('DOMContentLoaded', function () {
        var alert = document.getElementById('alert2');
        if (alert) {
            alert.style.display = 'block';
            setTimeout(function () {
                alert.style.opacity = '0';
                setTimeout(function () {
                    alert.style.display = 'none';
                }, 1000);
            }, 5000);
        }
    });
</script>
</body>
</html>