$(document).on('click', '#btnUpdate', function(e){
	e.preventDefault();
	let deleteCheck = confirm("수정하시겠습니까?");
	if(deleteCheck)	$("#form").submit();
});
	$(document).on('click', '#btnList', function(e){
	e.preventDefault();
	location.href="./list";
});
function deleteArticle(aid) {

	let deleteCheck = confirm("삭제하시겠습니까?");
	if(deleteCheck)	location.href="./doDelete?aid=${article.aid}";
		
}
function deleteComment(sid) {
		let deleteCheck = confirm("댓글을 삭제 하시겠습니까?");
		if(deleteCheck) location.href="./deleteComment?sid="+sid;
}

function updateComment(sid) {
	let ta = 'content'+sid;
	let updateBtnId = 'update_btn_group'+sid;
	let doUpdateBtnId ='doUpdate_btn_group'+sid;
	
	let cta = document.getElementById(ta);
	let updateBtn = document.getElementById(updateBtnId);
	let doUpdateBtn = document.getElementById(doUpdateBtnId);
	console.log(updateBtn);
	console.log(doUpdateBtn);
	
	updateBtn.style.display="none";
	doUpdateBtn.style.display="block";
	cta.removeAttribute('readonly');
}

function cancleUpdate(sid,scontents) {
	let ta = 'content'+sid;
	let updateBtnId = 'update_btn_group'+sid;
	let doUpdateBtnId ='doUpdate_btn_group'+sid;
	
	let cta = document.getElementById(ta);
	let updateBtn = document.getElementById(updateBtnId);
	let doUpdateBtn = document.getElementById(doUpdateBtnId);
	
	updateBtn.style.display="block";
	doUpdateBtn.style.display="none";
	cta.setAttribute('readonly',"readonly");
	cta.value = scontents;
}