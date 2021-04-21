<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        
        <link rel="stylesheet" href="/css/list.css">
  
        <!-- 부트 스트랩 & 제이쿼리 부분 -->
        
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
        
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
        <title>Document</title>
    </head>
    <body>
    	<input type="hidden" id="member" value="${login.mname}">
    	

			
            <div class="table-responsive">
            
                <h1>게시판</h1>
                
                <div class="form-group row pull-right">
					<div class = "col-xs-8">
						<input class="form-control" id="bwriter" onkeyup="searchFunction()"  type="text" size="20" placeholder="작성자를 입력해주세요!">
					</div>
					<div class="col-xs-2">
						<button class="btn btn-primary" onclick="searchFunction()" type="button">검색</button>
					</div>
				</div>
                <table class="table table-bordered table-hover">
                    <colgroup>
                        <col style="width: 10%;">
                        <col style="width: 40%;">
                        <col style="width: 20%;">
                        <col style="width: 20%;">
                        <col style="width: 10%;">
                    </colgroup>
                    <thead>
                    	<tr>
		                    <th>번호</th>
		                    <th>제목</th>
		                    <th>작성자</th>
		                    <th>작성일</th>
		                    <th>조회수</th>
                    	</tr>
                    </thead>
                    <tbody id="list_table">
					<c:forEach var="n" items="${list}" varStatus="st" >
					    <tr>
	                        <td>${st.index+1}</td>
	                        <td><a href="/list/detail?bid=${n.bid}">${n.btitle}</a></td>
	                        <td>${n.bwriter}</td>
	                        <td>${n.bdate}</td>
	                        <td>${n.hit}</td>
	                    </tr>
					</c:forEach>
					</tbody>
	           
                </table>
                
                <c:if test="${empty login}">
             		<div class="btn">
	            		<button id="btn_login" class = "btn btn-primary" type="button"  onclick="login()">로그인</button>
		        	</div>
		        </c:if>
		        
		        <c:if test="${!empty login}">
					<div class="btn">
	                    <button id="btn_logout" class = "btn btn-danger" type="button" onclick="logout()">로그아웃</button>
	                    <button id ="btn_write" class = "btn btn-primary" type="button" onclick="location.href='/list/write'">글쓰기</button>
               		</div>
		        </c:if>
                
                <ul class="pagination">
              
            	</ul>
             </div>

         


     
	<script src="/js/list.js"></script>
    </body>
</html>