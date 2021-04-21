<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/css/register.css">
        <title>회원가입</title>
    </head>
    <body>
        <form action="/register/try" id="register_form" method="POST">

            <div class="content">
                <a href=""><img src="/images/my_logo.png" alt="로고자리" id="logo"></a>
                <input id = "mid" name="mid" type="text" placeholder="아이디" required onblur="id_check(this.value)">
                <input id ="mpassword" name="mpassword" type="password" placeholder="비밀번호" required>
                <input id ="rmpassword" type="password" placeholder="비밀번호확인" required onblur="password_check(this.value)">
                <input name="mname" type="text" placeholder="이름" required>
                <input name="memail" type="email" placeholder="이메일" required>
                <input name="mphone" type="tel" placeholder="전화번호" required>
                <input type="submit" value = "가입하기">
                <input id="id_list" type="hidden" value ="${id_list}">
            </div>

        </form>
        
        <script src="/js/register.js"></script>
    </body>
</html>