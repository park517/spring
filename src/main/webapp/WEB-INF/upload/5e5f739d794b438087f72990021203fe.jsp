<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/css/update.css">
        <title>Document</title>
    </head>
    <body>
        <div class="form_wrap">
            <form action="/list/update/try" class="write_form" method="POST">
            	<input name="bid" type="hidden" value="${list.bid}">
                <h1>글쓰기</h1>
                <hr>
                <p></p>
                <input value="${list.btitle}" name="title" id="input_title" type="text" placeholder="제목을 입력하세요" >
                <p></p>
                <textarea name="content" id="input_content" cols="50" rows="10" placeholder="내용을 입력하세요">${list.bcontent}</textarea>
                <p></p>
                <button id="btn_sumbit" >수정하기</button>
            </form>
        </div>

    </body>
</html>