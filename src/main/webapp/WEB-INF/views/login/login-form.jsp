<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%--    <link rel="stylesheet" href="<c:url value='/css/reset.css' />">--%>
    <%--    <link rel="stylesheet" href="<c:url value='/css/app.css' />">--%>
    <style>
        /* CSS trực tiếp */
        body {
            background: #f2f2f2;
        }

        #wrapper {
            width: 100%;
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-heading {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            position: relative;
            margin-bottom: 20px;
        }

        .form-input {
            width: calc(100% - 30px);
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            outline: none;
            text-indent: 30px;
        }

        .form-group i {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            left: 10px;
            color: #999;
        }

        .form-submit {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-submit:hover {
            background-color: #0056b3;
        }

        .form-link {
            display: block;
            /*text-align: center;*/
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
        }

        .form-link:hover {
            text-decoration: underline;
        }
    </style>

    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">

    <title>Form login unitop.vn</title>
</head>
<body>
<div id="wrapper">
    <form action="/login/authenticate" id="form-login">
        <h1 class="form-heading" style="margin-bottom: 0">Đăng nhập</h1>
        <h2 class="form-heading" style="margin-top: 10px">Quản lý hiệu thuốc</h2>
        <div class="form-group">
            <i class="far fa-user"></i>
            <input type="text" class="form-input" placeholder="Tên đăng nhập">
        </div>
        <div class="form-group">
            <%--            <i class="fas fa-key"></i>--%>
            <i class="far fa-eye" id="togglePassword"></i>
            <input type="password" class="form-input" placeholder="Mật khẩu" id="password">
            <%--            <div id="eye">--%>
            <%--            </div>--%>
        </div>
        <input type="submit" value="Đăng nhập" class="form-submit">
    </form>
    <a href="/login/register" class="form-link">Đăng ký tài khoản</a> <!-- Liên kết đến trang đăng ký -->
</div>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
    // JavaScript code here
    $(document).ready(function () {
        $('#togglePassword').click(function () {
            var password = $('#password');
            var type = password.attr('type') === 'password' ? 'text' : 'password';
            password.attr('type', type);
            $(this).toggleClass('far fa-eye far fa-eye-slash');
        });
    });
</script>
</body>
</html>