<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
		<%@include file="../part/head.jspf" %> 
        <title>Insert title here</title>
    </head>
    <style>

        form {
            padding: 10px;
            border: 1px solid black;
            width: 420px;
            margin: auto;
        }
        img {
            height: 250px;
            width: 250px;
            display: block;
            margin: auto;

        }
		fieldset {
			margin-left: 40px;
		}
		input {
			margin-top: 10px;
			width: 250px;
		}
        #legend {
            text-align: center;
        }
    </style>
    <body>
        <form class="form-horizontal" action='./doRegister' method="POST">
		
            <img src="/images/my_logo.png">
			<div id="legend">
				<legend class="">회원가입</legend>
			</div>
            <fieldset>

             
                <div class="control-group">
                    <!-- Username -->
                    <label class="control-label" for="username">아이디</label>
                    <div class="controls">
                        <input
                            type="text"
                            id="userId"
                            name="userId"
                            placeholder="아이디를 적어주세요"
                            class="input-xlarge">
                    </div>
                </div>
                
                <div class="control-group">
                    <!-- Password-->
                    <label class="control-label" for="password">비밀번호</label>
                    <div class="controls">
                        <input
                            type="password"
                            id="password"
                            name="password"
                            placeholder=""
                            class="input-xlarge">
                        <p class="help-block">Password should be at least 4 characters</p>
                    </div>
                </div>
                
                <div class="control-group">
                    <!-- Password -->
                    <label class="control-label" for="password_confirm">Password (Confirm)</label>
                    <div class="controls">
                        <input
                            type="password"
                            id="password_confirm"
                            name="password_confirm"
                            placeholder=""
                            class="input-xlarge">
                        <p class="help-block">Please confirm password</p>
                    </div>
                </div>
                


      			<div class="control-group">
                    <!-- E-mail -->
                    <label class="control-label" for="name">이름</label>
                    <div class="controls">
                        <input type="text" id="name" name="name" placeholder="" class="input-xlarge">
                        <p class="help-block">이름을 입력해주세요.</p>
                    </div>
                </div>
                
                <div class="control-group">
                    <!-- E-mail -->
                    <label class="control-label" for="email">E-mail</label>
                    <div class="controls">
                        <input type="text" id="email" name="email" placeholder="" class="input-xlarge">
                        <p class="help-block">Please provide your E-mail</p>
                    </div>
                </div>
                
                <div class="control-group">
                    <!-- E-mail -->
                    <label class="control-label" for="tel">연락처</label>
                    <div class="controls">
                        <input type="tel" id="tel" name="tel" placeholder="" class="input-xlarge">
                        <p class="help-block">연락처를 입력해주세요!</p>
                    </div>
                </div>

         

        
                <div class="control-group">
                    <!-- Button -->
                    <div class="controls">
                        <button class="btn btn-success">Register</button>
                    </div>
                </div>
            </fieldset>
        </form>

    </body>
</html>