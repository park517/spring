<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/css/write.css">
        <title>Document</title>
    </head>
    <body>
        <div class="form_wrap">
            <form action="/list/write/try" class="write_form" method="POST" enctype="multipart/form-data">
                <h1>글쓰기</h1>
                <hr>
                <p></p>
              
                <input    name="title" id="input_title" type="text" placeholder="제목을 입력하세요">
                <br>
                파일 :<input type="file" name="file">
                
                <p></p>
                <textarea name="content" id="input_context" cols="50" rows="10" placeholder="내용을 입력하세요"></textarea>
                <p></p>
                <button id="btn_sumbit" >작성하기</button>
            </form>

        </div>


        
    </body>
</html>