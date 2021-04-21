let url = window.location.search;
console.log("url : "+url);
url  =  url.replace("?","");
console.log("url : " +url);
let list = url.split('=');
let page = document.getElementById(list[1]);
console.log("page : "+page);
page.classList.add('active');

function search() {
	var keywordInput =document.getElementById('search');
	var keyword = keywordInput.value;
	var type = document.getElementById('type');
	type = type.options[type.selectedIndex].value;
	if(type !="") {
			$.ajax({
					url : "/article/search",
					type : "post",
					data : {
						type:type,
						keyword : keyword	
					},
					success : function(result) {
						console.log(result);
						if(keyword !=null && type !=null){
						var articleList = document.getElementById('articleList');
						var articleListHtml="";
						articleList.innerHTML="";
						articleListHtml +="<thead><th>글 번호</th><th>제목</th><th>작성자</th>"
						articleListHtml +="<th>작성일</th><th>조회수</th></thead>"
						for(var i=0 ; i<result.length ; i++) {
							articleListHtml+="<tbody><tr><td>"+(i+1)+"</td>";
							articleListHtml+="<td><a href='detail?aid="+result[i].aid+"'>"+result[i].title+"</a></td>";
							articleListHtml+="<td>"+result[i].mid+"</td>";
							articleListHtml+="<td>"+result[i].regDate+"</td>";
							articleListHtml+="<td>"+result[i].hit+"</td></tr></tbody>";
						}
			
						
						articleList.innerHTML= articleListHtml;
						}
					},
					
					error : function(xhr,status,error) {
						console.log(error);
					}
			});
	}
	else {
		alert("항목을 선택해주세요");
		keywordInput.value ="";
		
	}

	
}