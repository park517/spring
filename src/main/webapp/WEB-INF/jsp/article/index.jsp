<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@include file="../part/head.jspf"%>
    <link rel="stylesheet" href="/resource/index.css">
    <title>Document</title>
</head>
<body>

	<%@include file="../part/nav.jspf" %>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h2>게시판 만들면서 스프링 배우기!</h2>
        <p>스프링, 스프링 부트를 익히기 위해 게시판을 만들면서 모르는점을 배우는 식으로 해보겠습니다.</p>
        <p><a class="btn btn-primary btn-lg" href="/article/list" role="button">게시판으로 이동하기 &raquo;</a></p>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4">
          <h2>템플릿</h2>
          <p>이번 공부 시 템플릿은 JSP를 사용하도록 하겠습니다.</p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-4">
          <h2>DB</h2>
          <p>db는 친숙한 Mysql를 사용 한후 JPA를 공부해보도록 하겠습니다. </p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
       </div>
        <div class="col-md-4">
          <h2>화면구성</h2>
          <p>화면 구성은 부트스트랩를 사용해보도록 하겟습니다!</p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
      </div>

      <hr>

      <footer>
        <p>&copy; Spring study 2021-04</p>
      </footer>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>