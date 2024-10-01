function fn_submit(){
	var fn = document.frm;
	
	if(fn.V_JUMIN.value === ""){
		alert("주민번호를 입력해주세요!");
		fn.V_JUMIN.focus();
		return false;
	}
	if(fn.V_NAME.value === ""){
		alert("성명을 입력해주세요!");
		fn.V_NAME.focus();
		return false;
	}
	if(fn.M_NO.value === ""){
		alert("투표번호를 선택해주세요!");
		fn.M_NO.focus();
		return false;
	}
	if(fn.V_TIME.value === ""){
		alert("투표시간을 입력해주세요!");
		fn.V_TIME.focus();
		return false;
	}
	if(fn.V_AREA.value != "제1투표장" && fn.V_AREA.value != "제2투표장"){
		alert("투표장소를 입력해주세요!");
		fn.V_AREA.focus();
		return false;
	}
	if(fn.V_CONFIRM.value === ""){
		alert("유권자확인을 선택해주세요!");
		fn.V_CONFIRM.focus();
		return false;
	}
	fn.submit();
}
function fn_reset(){
	alert("정보를 지우고 처음부터 다시 입력합니다.");
	location="voteMember.jsp";
}