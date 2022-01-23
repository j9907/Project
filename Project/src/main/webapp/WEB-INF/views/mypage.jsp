<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>
#content {
	position: relative;
	padding: 32px 51px 95px;
}

#m_header {
	padding-bottom: 43px;
}

.tbl_model {
	position: relative;
	width: 100%;
	table-layout: fixed;
	border-spacing: 0;
	border-collapse: collapse;
	word-wrap: break-word;
	word-brek: keep-all;
	border: 0;
	border-bottom: 1px solid midnightblue;
}

.tbl_model th {
	color: #ffd700;
	border-right: 1px solid midnightblue;
	background-color: midnightblue;
	width: 20%;
}

.tbl_model th, .tbl_model td {
	line-height: 14px;
	text-align: left;
	vertical-align: top;
	letter-spacing: -1px;
	border: 0;
	border-top: 1px solid midnightblue;
}

.tbl_model .thcell {
	padding: 32px 31px 32px;
}

.tbl_model .tdcell {
	padding: 32px 0 32px 30px;
}

fieldset {
	border: 0;
}

.mark {
	position: absolute;
	z-index: 10;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background: url("/pro/resources/img/bg.png") 0 0;
}

.profile_photo {
	position: relative;
	width: 100px;
	height: 100px;
}

input[type=file] {
	position: absolute;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	height: 1px;
	width: 1px;
	padding: 0;
	border: 0;
	margin: -1px;
}

.btn_file {
	display: inline-block;
	width: 77px;
	height: 33px;
	cursor: pointer;
}

.btn_p {
	position: relative;
	display: inline-block;
	float: left;
	margin-left: 8px;
}

.b_btn {
	border-radius: 10px;
	background-color: midnightblue;
	color: #ffd700;
	border: 1px solid midnightblue;
	font-size: 10pt;
	padding: 5px;
}

.tdcell1 {
	margin-left: 40px;
}

.p_input {
	min-width: 300px;
	padding: 5px;
	outline: 0;
}

.p_button {
	display: flex;
	padding: 32px 0 32px 0;
	align-items: center;
	justify-content: center;
}

.p_sub, .p_btn {
	margin: 0 10px 0 10px;
	background-color: midnightblue;
	color: #ffd700;
	padding: 5px;
	border: 0;
	border-radius: 10px;
	width: 60px;
	height: 33px;
	font-weight: bold;
	cursor:pointer;
}
</style>
<div id="side">
	<p class="profile">Profile</p>
	<p class="profile">내글 반응</p>
</div>
<div id="content">
	<div id="m_header">
		<h2>프로필 수정</h2>
		<p class="contxt">대표 프로필과 별명을 수정할 수 있습니다.</p>
	</div>
	<fieldset>
		<form method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${login.id }"> <input
				type="hidden" name="profile" value="${login.profile }">
			<table class="tbl_model">
				<colgroup>
					<col style="width: 22%'">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><div class="thcell">프로필 사진</div></th>
						<td>
							<div class="thcell">
								<div class="profile_photo">
									<img src="${cpath }/uploadFile/${login.profile}" width="100"
										height="100" id="preview"> <span class="mark"></span>
								</div>
							</div>
							<div class="tdcell1">
								<div class="btn_p">
									<label class="btn_file"><b class="b_btn">사진변경</b><input
										type="file" name="File" id="File"></label> <b class="b_btn"><button
											id="anon" class="b_btn"
											style="font-weight: bold; cursor: pointer">삭제</button></b>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><div class="thcell">별명</div></th>
						<td>
							<div class="tdcell">
								<p>
									<input type="text" value="${login.name }" autocomplete="off"
										class="p_input" name="name">
								</p>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="p_button">
				<input type="submit" value="적용" class="p_sub">
				<button onclick="history.go(-1);" class="p_btn">취소</button>
			</div>
		</form>
	</fieldset>
</div>
<script>
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#preview').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	// 이벤트를 바인딩해서 input에 파일이 올라올때 위의 함수를 this context로 실행합니다.
	$("#File").change(function() {
		readURL(this);
	});
</script>


<%@ include file="footer.jsp"%>