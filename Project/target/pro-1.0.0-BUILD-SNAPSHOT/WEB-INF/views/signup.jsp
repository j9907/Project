<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>


	<div id="main">
	<h1 id="sign">회원가입</h1>
	<form method="post" id="frm">
	<p class="sign_p">아이디</p>
	<input type="text" placeholder="ID" autofocus required
		autocomplete="off" name="id" class="sign_input" id="signid">
		<div id="sign_bo"></div>
	<p class="sign_p">비밀번호</p>
	<input type="password" placeholder="PW" required  class="sign_input" name="pw">
	<p class="sign_p">이름</p>
	<input type="text" name="name" class="sign_input" autocomplete="off">
	<p class="sign_p">생년월일</p>
	<span>  
        <input type="text" name="Y" placeholder="연도 ex)1993" class="sign_m" required >
		<select class="sign_m" name="M">
			<option selected>월</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
	</select> <input type="text" name="D" placeholder="일" class="sign_m" required>
	</span>
	<p class="sign_p">성별</p>
	<select class="sign_se" name="gender">
		<option selected>성별</option>
		<option value="M">남자</option>
		<option value="F">여자</option>
		<option value="U">선택 안함</option>
	</select>
	
    <div class="submit">
        <input type="submit" value="회원가입" class="input_su">
    </div>
</form>
</div>

<script>
	$('#signid').focusout(function(){
		$.ajax({
			type:"POST",
			url:"userid",
			data:{"id" : $('#signid').val()},
			success:function(data){
			$('#sign_bo').text(data);
			if ($('#sign_bo').text() == '일치하는 아이디가 존재합니다.'){
				$('#sign_bo').css("color","red");
			}
			else{
				$('#sign_bo').css("color","midnightblue")
				
			}
			},
			error: function(){
				alert('ajax error' + error);
			}
		})
		
	});
</script>
<%@ include file="footer.jsp"%>