<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
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

    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css">

    <title>Form login unitop.vn</title>
</head>
<body>
<div id="wrapper">
    <c:if test="${not empty failMessage}">
        <div id="alert" class="alert alert-danger">
                ${failMessage}
        </div>
    </c:if>
    <form action="/login/authenticate" id="form-login" method="post">
        <h1 class="form-heading" style="margin-bottom: 0">Đăng nhập</h1>
        <h2 class="form-heading" style="margin-top: 10px">Quản lý hiệu thuốc</h2>
        <div class="form-group">
            <i class="far fa-user"></i>
            <input type="text" class="form-input" placeholder="Tên đăng nhập" name="username">
        </div>
        <div class="form-group">
            <i class="far fa-eye" id="togglePassword"></i>
            <input type="password" class="form-input" placeholder="Mật khẩu" id="password" name="password">
        </div>
        <input type="submit" value="Đăng nhập" class="form-submit">
    </form>
    <a href="/login/register-form" class="form-link">Đăng ký tài khoản</a>
    <!-- Liên kết đến trang đăng ký -->
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
    document.addEventListener('DOMContentLoaded', function () {
        var alert = document.getElementById('alert');
        console.log('vao day' + alert)
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