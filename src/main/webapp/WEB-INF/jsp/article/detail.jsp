<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html><
<head>
<meta charset="UTF-8">

<!-- jQuery -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<!-- Bootstrap CSS -->

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">

<title>board</title>
<script>

	$(document).on('click', '#btnUpdate', function(e){
		e.preventDefault();
		$("#form").submit();
	});
	$(document).on('click', '#btnList', function(e){
		e.preventDefault();
		location.href="./list";
	});
</script>
<style>
body {
  padding-top: 70px;
  padding-bottom: 30px;
}
</style>
</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>수정하기</h2>
			<form name="form" id="form" role="form" method="post" action="./modify">
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="title" id="title" readonly="readonly" value="${article.title}">
                </div>

				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="body" id="content" readonly="readonly">${article.body}</textarea>
				</div>

			</form>
			<div >
				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>

			</div>

		</div>

	</article>

</body>

</html>