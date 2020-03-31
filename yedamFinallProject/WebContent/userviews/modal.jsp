<%@page import="co.nambbang.app.dao.UsersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#btn {
	background-color: #fe4c50;
}
#btn:hover {
	background-color: #ff8c8f;
	transition: 0.5s;
}
</style>    
<div class="container">

	<div class="modal fade login" id="loginModal">
		<div class="modal-dialog login animated">

			<div class="modal-content">
				<div class="modal-header">
				<h4 class="modal-title">NAM <span style="color:#ff3847">BBANG</span> LOGIN</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>					
				</div>
				
				<div class="modal-body">
				
					<div class="box">
						<div class="content">
							<div class="social">

							</div>
							<div class="division">
								<div class="line l"></div>
								<span>NAM BBANG</span>
								<div class="line r"></div>
							</div>
							<div class="error"></div>
							
							<!-- 로그인 화면 -->
							<div class="form loginBox">
								<form  id ="loginForm" action="./logIn.do" method="post" onsubmit="return LoginClick();" accept-charset="UTF-8">
									<c:if test ="${empty CONECTR_SE}">
									<input id="userid" class="form-control" type="text" placeholder="id"
										name="userid"><br />
									<input id="password" class="form-control" type="password" placeholder="Password"
										name="password"><br />
									<!-- LOGIN 버튼 --> 
									<input class="btn btn-default btn-login" id="btn" type="submit" value="Login" name="submit">  
									</c:if>
									
									<c:if test ="${not empty CONECTR_SE && CONECTR_SE == 'US'}">
									<!-- 로그아웃 화면-->
									<!--  <input class="btn btn-default btn-login" type="submit" value="회원정보수정"
										name="submit">
									<br/>
									-->
									<input class="btn btn-default btn-login" type="button" onclick="location.href='myPage.do'" value="구매내역">
									<br/>
									
									</c:if>
									<c:if test ="${not empty CONECTR_SE && CONECTR_SE == 'SE'}">
									
									<input class="btn btn-default btn-login" type="button" onclick="location.href='listSellGoods.do'" value="판매내역">
									<br/>
									
									</c:if>
								</form>
								
							</div>
							
						</div>
					</div>


					
					<!-- 회원가입  -->
					<div class="box">
						<div class="content registerBox" style="display:none;">
							<div class="form">
								<!-- <form method="" html="{:multipart=>true}" data-remote="true" action="" accept-charset="UTF-8">-->
								<form id ="registerForm"  method="post" accept-charset="UTF-8">
									<div class="input-group">
										<input id="userid" class="form-control" type="text" placeholder="아이디를 입력해주세요."
											name="userid" onkeyup  ="isIdDuplicationSame()" value="">
										<span class="input-group-btn">
											<button id="idDuplication" class="btn btn-success" type="button"
												style="height: 46px;" onclick="location.href='javascript: duplicationCheck();'" value="unCheck">중복확인</button>
										</span>
									</div>
									<input id="username" class="form-control" type="text" placeholder="이름을 입력해주세요."
										name="username" value="">
									<input id="email" class="form-control" type="email" placeholder="이메일 abc@abc.com"
										name="email" onkeyup  ="registerEmailCheck()" value="">
									<input id="password" class="form-control" type="password" placeholder="비밀번호를 입력하세요."
										name="password" onkeyup  ="isPwSame()" value="">
									<input id="password_confirmation" class="form-control" type="password" placeholder="비밀번호를 확인해주세요." 
										name="password_confirmation" onkeyup  ="isPwSame()" value="">

									<input id="usertel" class="form-control" type="tel" placeholder="010-0000-0000"
										name="usertel" onkeyup="registerTelCheck()" value="">

									<input id="birth" class="form-control" type="text" placeholder="2000-01-01"
										name="birth" onkeyup="birthdayDateCheck()" value="">
									
									<br />
									<div>
									<label><input id="gender"  type="radio" name="gender"
											value="M" checked="checked"> 남자 </label>
									<br />
									<label><input id="gender"  type="radio" name="gender"
											value="W"> 여자 </label>

									<input class="btn btn-default btn-register" id="btn" type="button" value="가입 신청"
										name="submit" onclick="location.href='javascript: registerClick();'" >
									</div>
								</form>
							</div>
						</div>
					</div>
					
					
							
					<!-- 회원가입 축하메시지 -->
					<div class="box">
						<div class="content registerCheckBox" style="display:none;">
							<div class="form">
								<form  html="{:multipart=>true}" data-remote="true" action=""
									accept-charset="UTF-8">
								<span id="registerCongratulation">
								<h3></h3>
								</span><br /> 
								<input class="btn btn-danger" type="button" onclick="location.href='javascript: createCheckForm();'" value="홈" name="goHome">
								</form>
							</div>
						</div>
					</div>
					
					
					<!-- 아이디 찾기 -->
					<div class="box">
						<div class="content idFindBox" style="display:none;">
							<div class="form">
								<form id ="idFindForm" method="post" action="javascript: showFindId()"  
								html="{:multipart=>true}" data-remote="true" 
									accept-charset="UTF-8">
									<input id="username" class="form-control" type="text" placeholder="name"
										name="username"><br />
									<div class="input-group">
										<input id="email" class="form-control" type="email" placeholder="email" name="email">
										<span class="input-group-btn">
											<button class="btn btn-success" type="button" onclick="location.href='javascript: certificationTransmission();'"
												style="height: 46px;">인증번호</button>
										</span>
									</div>
									<br /> <input id="Certification" class="form-control" type="text"
										placeholder="인증번호" name="Certification"><br />
									
									<input class="btn btn-default btn-idFind" type="submit" value="ID Search"
										name="submit" >
								</form>
							</div>
						</div>
					</div>
					
					
					<!-- 아이디 결과 찾기 결과 -->
					<div class="box">
						<div class="content idFindResultBox" style="display:none;">
							<div class="form" id="idFindResultForm">
								<form method="" html="{:multipart=>true}" data-remote="true" action=""
									accept-charset="UTF-8">
								<span>
									<h3>아이디는 <span id="idFindSpan"></span> 입니다.</h3>
								</span><br /> 
							
								<input class="btn btn-default btn-idfindresult" type="button" value="로그인 페이지 돌아가기"
										name="commit" onclick="location.href='javascript: showFindIdResultForm();'">
								</form>
							</div>
						</div>
					</div>
					
					<!-- 비밀번호 찾기 -->
					<div class="box">
						<div class="content findPwBox" style="display:none;">
							<div class="form">
								<div class="form">
								<form method="" html="{:multipart=>true}" data-remote="true" action=""
									accept-charset="UTF-8">
									<input id="userid" class="form-control" type="text" placeholder="id"
										name="userid"><br />
									<div class="input-group">
										<input id="tel" class="form-control" type="text" placeholder="phone" name="tel">
										<span class="input-group-btn">
											<button class="btn btn-success" type="button"
												style="height: 46px;">인증번호</button>
										</span>
									</div>
									<br /> 
									<input id="Certification Number" class="form-control" type="text"
										placeholder="인증번호" name="Certification Number"><br />
									<input class="btn btn-default btn-find" type="button" value="Create account"
										name="commit" onclick="location.href='javascript: showFindPwResultForm();'">
								</form>
							</div>
							</div>
						</div>
					</div>
					
					<!-- 비밀번호 찾기 결과-->
					<div class="box">
						<div class="content findPwResultBox" style="display:none;">
							<div class="form">
								<div class="form">
								<form method="" html="{:multipart=>true}" data-remote="true" action=""
									accept-charset="UTF-8">
									
								<input id="password" class="form-control" type="password" placeholder="Password"
									name="password"> 
								<input id="password_confirmation" class="form-control"
									type="password" placeholder="Repeat Password" name="password_confirmation">
								<input class="btn btn-default btn-findPwResult" type="button" value="Create account"
										name="commit" onclick="location.href='javascript: showChangePwResultForm();'">
								</form>
							</div>
							</div>
						</div>
					</div>
					
					

				</div>
				
				
				<div class="modal-footer">
					<div class="forgot login-footer">
						<span>
							<c:if test ="${empty CONECTR_SE}">
							<button type="button" class="btn btn-default btn-login" id="btn" style="display:inline; padding:5px; width:100px" onclick="location.href='boardSellRegist.do'">판매자가입</button>&nbsp;&nbsp;
							<button type="button" class="btn btn-default btn-login" id="btn" style="display:inline; padding:5px; width:100px" onclick="javascript: showRegisterForm();">회원가입</button>
							<!-- <a href="javascript: showFindIdForm();">아이디찾기</a>&nbsp;&nbsp;&nbsp;
							<a href="javascript: showFindPwForm();">비번찾기</a> -->
							
							
							</c:if>
							
							<c:if test ="${not empty CONECTR_SE}">
							<!-- 로그아웃  -->
							<a href="./logOut.do">Logout</a>
							</c:if>
						</span>
					</div>
					
					

					<div class="forgot register-footer" style="display:none">
						<span>이미 회원이신가요?</span>
						<a href="javascript: showLoginForm();">Login</a>
					</div>
					<!-- 아이디 가입축하  -->
					<div class="forgot registerCheck-footer" style="display:none">
						<span></span>
					</div>
					<!-- 아이디 찾기  -->
					<div class="forgot idFind-footer" style="display:none">
						<span>로그인창으로돌아가기</span>
						<a href="javascript: showLoginIdFindForm();">Login</a>
					</div>
					<!-- 아이디 찾기 결과 -->
					<div class="forgot idFindResult-footer" style="display:none">
						<span>ㄴㅁㅇㄴㅁㅇㄴㅁㅇㅁㄴㅇ</span>
					</div>
					<!-- 비밀번호 찾기 -->
				 	<div class="forgot findPw-footer" style="display:none">
						<span>로그인창으로돌아가기</span>
						<a href="javascript: findPw_Login();">Login</a>
					</div>
					<!-- 비밀번호 찾기 결과 -->
					<div class="findPwResult-footer" style="display:none">
						<span>로그인창으로돌아가기</span>
						<a href="javascript: findPwResult_Login();">Login</a>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>