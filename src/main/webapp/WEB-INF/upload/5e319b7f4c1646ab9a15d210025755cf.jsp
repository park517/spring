<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/css/login.css">
        <title>로그인</title>
    </head>
    <body>
    	
        <form action="/login/try" id="login_form" name="login_form" method="post">

            <div class="content">
            	<p></p>
         	    <h1>JSP를 이용한 간단한 게시판 만들기</h1>
                <a href=""><img src="/images/my_logo.png" alt="로고자리" id="logo"></a>
                <input name ="mid" id="mid" type="text" placeholder="아이디">
                <input name ="mpassword" type="password" placeholder="비밀번호">
                <input type="button" value="로그인" onclick="id_check()">
                <input type="button" value="회원가입" onclick="location.href='/register'" >
                <input id="id_list" type="hidden" value="${id_list}">

                <div class="sub_btn">
                    <a href="">아이디 찾기
                    </a>
                    <a href="">|</a>
                    <a href="">
                        비밀번호 찾기</a>

                </div>
                
                <c:if test="${!empty check}">
                   <p id="loing_fail" style="color='red'"> 로그인에 실패하셨습니다 다시 입력해주세요.</p>
                </c:if>

            </div>

        </form>
        <script src="/js/login.js"></script>
    </body>
</html>