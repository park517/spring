let password = document.getElementById('password'); 
let password_confirm = document.getElementById('password_confirm');
console.log(password);
console.log(password_confirm);
function checkPassword() {
	   if(password.value !== password_confirm.value) {
	    alert("비밀번호가 일치 하지 않습니다.");
	    password.value ="";
	    password_confirm.value = "";
	    password.focus();
	   }	
}