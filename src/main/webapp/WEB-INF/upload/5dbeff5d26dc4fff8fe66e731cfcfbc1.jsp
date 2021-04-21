<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/css/detail.css">
        <title>Document</title>
    </head>
    <body>
        <div class="form_wrap">
            <form action="/write/try" class="write_form" method="POST">
                <h1>글보기</h1>
                <hr>
                <p></p>
                <input
                    value="${list.btitle}"
                    readonly="readonly"
                    name="title"
                    id="input_title"
                    type="text"
                    placeholder="제목">
                <br>
                <input
                    value="${list.bwriter}"
                    readonly="readonly"
                    name="write"
                    id="input_title"
                    type="text"
                    placeholder="작성자">

                <p>
                    첨부된 파일 :
                    <a href="/downloadAciton?file=${list.fileRealName}">${list.fileRealName}</a>
                </p>

                <p></p>
                <textarea
                    readonly="readonly"
                    name="context"
                    id="input_context"
                    cols="50"
                    rows="10"
                    placeholder="내용">${list.bcontent}</textarea>

                <c:if test="${login.mid eq list.mid }">
                    <p></p>
                    <button
                        id="btn_update"
                        type="button"
                        onclick="location.href ='/list/update?id=${list.bid}'">수정하기</button>
                    <p></p>
                    <button
                        id="btn_delete"
                        type="button"
                        onclick="location.href ='/list/delete?id=${list.bid}'">삭제하기</button>
                </c:if>
                <p></p>
                <button type="button" onclick="location.href='/list'">목록보기</button>
            </form>

            <form
                id="comment_form"
                name="comment_form"
                action="/list/comment/write"
                method="post">
                <h2>댓글</h2>
                <hr>
                <div class="input">
                    <textarea
                        name="comment"
                        id="comment"
                        cols="40"
                        rows="2"
                        placeholder="댓글을 입력해주세요"></textarea>
                    <input type="hidden" name="bid" value="${list.bid}">
                    <button id="comment_write" type="submit">댓글 작성</button>
                </div>
            </form>

            <div class="comment_wrap">
                <c:forEach var="n" items="${slist}">
                    <div class="comment">
                        <p>${n.swriter}</p>
                        <textarea readonly="readonly" class="comment_output" cols="30" rows="1">${n.scontent}</textarea>

                        <c:if test="${login.mid eq n.mid }">
                            <form name="comment_update_form" action="/list/comment/update" method="post">
                                <input type="hidden" name="bid" value="${n.bid}">
                                <input type="hidden" name="sid" value="${n.sid}">
                                <input type="hidden" id="scontent" name="scontent" value="${n.scontent}">
                                <button type="button" onclick="comment_update()">수정</button>
                                <button value="${n.sid}" type="button" onclick="comment_delete(this.value)">삭제</button>
                            </form>
                        </c:if>

                    </div>

                </c:forEach>

            </div>

        </div>

        <script src="/js/detail.js"></script>
    </body>
</html>