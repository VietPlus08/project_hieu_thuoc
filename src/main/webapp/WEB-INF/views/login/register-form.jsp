<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Đăng ký</title>
    <style>
        /* CSS cho trang đăng ký */
        #wrapper {
            width: 100%;
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .form-heading {
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }

        .form-input {
            width: 100%;
            padding: 10px;
            margin-left: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-submit {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
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
</head>
<body>
<div id="wrapper">
    <form action="" id="form-register">
        <h1 class="form-heading" style="margin-bottom: 0">Đăng ký</h1>
        <h2 class="form-heading" style="margin-top: 10px">Quản lý hiệu thuốc</h2>
        <div class="form-group">
            <i class="far fa-user"></i>
            <input type="text" class="form-input" placeholder="Họ tên">
        </div>
        <div class="form-group">
            <i class="far fa-envelope"></i>
            <input type="email" class="form-input" placeholder="Email">
        </div>
        <div class="form-group">
            <i class="far fa-envelope"></i>
            <input type="number" class="form-input" placeholder="Số điện thoại">
        </div>
        <div class="form-group">
            <i class="far fa-user"></i>
            <input type="text" class="form-input" placeholder="Tên đăng nhập">
        </div>
        <div class="form-group">
            <i class="far fa-key"></i>
            <input type="password" class="form-input" placeholder="Mật khẩu">
        </div>
        <div class="form-group">
            <i class="far fa-key"></i>
            <input type="password" class="form-input" placeholder="Xác nhận mật khẩu">
        </div>
        <input type="submit" value="Đăng ký" class="form-submit">
        <a href="/login" class="form-link">Đã có tài khoản? Đăng nhập</a>
    </form>
</div>
</body>
</html>