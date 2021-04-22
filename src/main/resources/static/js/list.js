let url = window.location.search;
url  =  url.replace("?","");
let list = url.split('=');
let page = document.getElementById(list[1]);
page.classList.add('active');

function search(page) {
	var keywordInput =document.getElementById('search');
	var keyword = keywordInput.value;
	var type = document.getElementById('type');
	type = type.options[type.selectedIndex].value;
	
	if(type !="") {
			$.ajax({
					url : "/article/search?currentPageNo="+page,
					type : "post",
					dataType : 'text',
					data : {
						type:type,
						keyword : keyword	
					},
					success : function(result) {
						var pagination1 = document.getElementById('pagination1');
						pagination1.style.display = "block"
						
						//결과 값으로 넘어온 String ->Json으로 변환
						var resultJson = JSON.parse(result);
						 
						// 타입이랑 검색어가 없다면 실행안됨 
						if(keyword !=null && type !=null){
						var articleList = document.getElementById('articleList');
						var pagination = document.getElementById('pagination');
						pagination.style.display = "none";
						var articleListHtml="";
						articleList.innerHTML="";
						
						//불러온 데이터 화면에 보여주기
						articleListHtml +="<thead><th>글 번호</th><th>제목</th><th>작성자</th>"
						articleListHtml +="<th>작성일</th><th>조회수</th></thead>"
						for(var i=0 ; i<resultJson["list"].length ; i++) {
							articleListHtml+="<tbody><tr><td>"+(i+1)+"</td>";
							articleListHtml+="<td><a href='detail?aid="+resultJson["list"][i].aid+"'>"+resultJson["list"][i].title+"</a></td>";
							articleListHtml+="<td>"+resultJson["list"][i].mid+"</td>";
							articleListHtml+="<td>"+resultJson["list"][i].regDate+"</td>";
							articleListHtml+="<td>"+resultJson["list"][i].hit+"</td></tr></tbody>";
						}
						articleList.innerHTML= articleListHtml;
						
						// 검색한 결과의 페이징 버튼
						pagination1Html="";
						pagination1Html +="<li class='disabled'><a href='#'><span> << </span></a>";
						for(var i=0 ; i< resultJson["pageList"][0] ; i++)
						pagination1Html +="<li id=1 onclick='search("+i+")'><a>"+(i+1)+"</a>";
						pagination1Html +="<li class='disabled'><a href='#'><span> >> </span></a>";
						pagination1.innerHTML = pagination1Html;
						}
					},
					
					error : function(xhr,status,error) {
						console.log(error);
						console.log(xhr);
						console.log(status);
					}
			});
	}
	else {
		alert("항목을 선택해주세요");
		keywordInput.value ="";
		
	}

	
}