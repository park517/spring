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

	$(document).on('click', '#btnSave', function(e){
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
h1 {
	margin-bottom: 20px;

}
</style>
</head>
<body>
	<article>
		<div class="container" role="main">
			<h1>board Form</h1>
			<form name="form" id="form" role="form" method="post" action="./doAdd" enctype="multipart/form-data">
				<input type="hidden" name="mid" value="${loginMember.mid}">
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
                </div>

		        <div class="mb-3">
		            <label for="file"><strong>첨부 파일</strong></label>
					<input type="file" class="form-control" name="file" id="file" placeholder="파일을 선택해 주세요">
		        </div>
		        
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="contents" id="content" placeholder="내용을 입력해 주세요" ></textarea>
				</div>

			</form>
			<div >
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>

			</div>

		</div>

	</article>

</body>

</html>
