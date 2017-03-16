/* */

function pwCh(){
	var pw = document.f.pw.value;
	var pw2 = document.f.pw2.value;
	
	if(pw==pw2){
		document.getElementById("pw2_res").innerHTML="";
		return true;
	}else{
		document.getElementById("pw2_res").innerHTML="비밀번호가 일치하지 않습니다.";
		return false;
	}
}

function idCh(){
	var id = document.f.id;
	var regex = /^[a-z][a-z0-9]{5,19}$/;
	if(regex.test(id.value)){
		document.getElementById("id_res").innerHTML="";
	}else{
		document.getElementById("id_res").innerHTML="6자 이상의 영문 소문자와 숫자만 허용됩니다.";
		id.select();
	}
}

function nameCh(){
	var name = document.f.name;
	var regex = /^[가-힣]{2,20}$/;
	if(regex.test(name.value)){
		document.getElementById("name_res").innerHTML="";
	}else{
		document.getElementById("name_res").innerHTML="한글 이름만 허용됩니다.";
		name.select();
	}
}

function telCh(){
	var tel = document.f.tel;
	var regex = /^010[1-9][0-9]{7}$/;
	if(regex.test(tel.value)){
		document.getElementById("tel_res").innerHTML="";
	}else{
		document.getElementById("tel_res").innerHTML="전화번호를 정확히 입력해 주십시오.";
		tel.select();
	}
}

function formCh(){
	var pwCheck = pwCh();
	if(!pwCheck){ //pwCh가 false면
		document.f.pw2.select();
		return false;
	}
}

