//로그아웃 모달창
function openLogoutModal(){

	setTimeout(function() {
		$('#loginModal').modal('show');
	}, 230);
	

	
}


//logout-footer
//회원가입 아이디 입력시 아이디 중복확인 새로해야되기 때문에 설정
function isIdDuplicationSame(){
	registerForm.idDuplication.value="unCheck";
}

//회원가입 비밀번호와 비밀번호확인 같은지 체크
function isPwSame() {
	var pw = registerForm.password.value;
	var pwCheck = registerForm.password_confirmation.value;

	if (pw == "" && pwCheck == "") {
		registerForm.password.style.background = 'rgba(0, 0, 0, 0.09)';
		registerForm.password_confirmation.style.background = 'rgba(0, 0, 0,0.09)';
	} else {
		if (pw != pwCheck) {
			registerForm.password.style.background = 'red';
			registerForm.password_confirmation.style.background = 'red';
		} else {
			registerForm.password.style.background = 'rgb(232, 240, 254)';
			registerForm.password_confirmation.style.background = 'rgb(232, 240, 254)';
		}
	}
}
//회원가입 생일(date) 유효성확인
function birthdayDateCheck(){
	if (registerForm.birth.value == "") {
		registerForm.email.style.background = 'rgba(0, 0, 0, 0.09)';
	}else{
		if (isDateCheck(registerForm.birth.value)) {
			registerForm.birth.style.background = 'rgb(232, 240, 254)';
		} else {
			registerForm.birth.style.background = 'red';
		}
	}
}
// 이메일 유효성확인
function registerEmailCheck() {
	if (registerForm.email.value == "") {
		registerForm.email.style.background = 'rgba(0, 0, 0, 0.09)';
	}else{
		if (isEmailCheck(registerForm.email.value)) {
			registerForm.email.style.background = 'rgb(232, 240, 254)';
		} else {
			registerForm.email.style.background = 'red';
		}
	}
}

//회원가입 아이디 중복 확인
function duplicationCheck(){
	var url = "./ajaxIdDuplicationCheck.do";
	var data =  { userid: registerForm.userid.value }
	// 1.넘긴값 2.상태 3.xhr;
	function callback(result, status, xhr) {
		if (result == 1) {
			alert("아이디 중복")
			registerForm.idDuplication.value="unCheck";
			registerForm.userid.style.background = 'red';

		}else{
			alert("중복아님")
			registerForm.idDuplication.value="check";
			registerForm.userid.style.background = 'rgb(232, 240, 254)';
		}

	}
	// 아작스 요청 함수
	$.post(url, data, callback);

	return false;
}
//회원가입 전화번호 유효성 검사
function registerTelCheck(){
	if (registerForm.usertel.value == "") {
		registerForm.email.style.background = 'rgba(0, 0, 0, 0.09)';
	}else{
		if( isTelCheck(registerForm.usertel.value) ) {
			registerForm.usertel.style.background = 'rgb(232, 240, 254)';
		}else{
			registerForm.usertel.style.background = 'red';
		}
		
	}
}

// 회원가입
function registerClick() {
	if (registerForm.userid.value == "") {
		alert("아이디를 입력하세요.");
		return false;
	}
	if (registerForm.username.value == "") {
		alert("이름를 입력하세요.");
		return false;
	}
	if (registerForm.email.value == "") {
		alert("이메일을 입력하세요.");
		return false;
	}
	if (registerForm.password.value == "") {
		alert("패스워드을 입력하세요.");
		return false;
	}
	if (registerForm.password_confirmation.value == "") {
		alert("패스워드 확인을 입력하세요.");
		return false;
	}
	if (registerForm.usertel.value == "") {
		alert("휴대폰번호를 입력하세요.");
		return false;
	}
	if (registerForm.birth.value == "") {
		alert("생일을 입력하세요.");
		return false;
	}
	if (registerForm.gender.value == "") {
		alert("성별을 입력하세요.");
		return false;
	}
	
	if(registerForm.idDuplication.value=="unCheck"){
		alert("아이디 중복체크를 해주세요")
		return false;
	}
	if(!isEmailCheck(registerForm.email.value)){
		alert("이메일 양식에 맞춰주세요")
		return false
	}
	if (registerForm.password.value != registerForm.password_confirmation.value) {
		alert("패스워드 확인과 다릅니다.")
		return false;
	} 
	if(!isTelCheck(registerForm.usertel.value)){
		alert("전화번호 양식에 맞춰주세요")
		return false;
	}
	if(!isDateCheck(registerForm.birth.value)){
		alert("날짜 양식에 맞춰주세요")
		return false;
	}
	//ajax이용하여 DB에 데이터 넣기
	var url = "./ajaxRegisterDB.do";
	var data = $('#registerForm').serialize();
	// 1.넘긴값 2.상태 3.xhr;
	function callback(result, status, xhr) {

	}
	
	// 아작스 요청 함수
	$.post(url, data, callback);
	
	console.log($('#registerCongratulation'));
	$('#registerCongratulation')[0].innerHTML=registerForm.userid.value+"<br> 님 회원 가입을 축하합니다";
	showMemberForm();
	registerForm.userid.value = "";
	registerForm.username.value = "";
	registerForm.email.value = "";
	registerForm.password.value = "";
	registerForm.password_confirmation.value="";
	registerForm.usertel.value = "";
	registerForm.birth.value = "";
	registerForm.gender.value = "";
	registerForm.idDuplication.value="unCheck";
	return false;
}

// 로그인 버튼클릭시 동작
function LoginClick() {
	if (loginForm.userid.value == "") {
		alert("아이디를 입력하세요.");
		return false;
	}
	if (loginForm.password.value == "") {
		alert("패스워드를 입력하세요.");
		return false;
	}
	
	var url = "./ajaxLoginCheck.do";
	var data = $('#loginForm').serialize();
	// 1.넘긴값 2.상태 3.xhr;
	function callback(result, status, xhr) {
		if (result == 1) {
			shakeModal("아이디가 존재하지 않습니다.")
			return false;
			
		} else if (result == 2) {
			alert("login ");
			closeLoginModal();
			return true;
			
		} else {
			shakeModal("비밀번호가 틀렸습니다.")
			return false;
		}
	}
	// 아작스 요청 함수
	$.post(url, data, callback);
		
	if(result==2)
		
		
		return true;
	else
		return false;

}

// 아이디 비밀번호 오류시 경고
function shakeModal(text) {
	$('#loginModal .modal-dialog').addClass('shake');
	$('.error').addClass('alert alert-danger').html(text);
	$('input[type="password"]').val('');
	setTimeout(function() {
		$('#loginModal .modal-dialog').removeClass('shake');
	}, 1000);
}

// 로그인화면 footer에 '회원가입' 버튼클릭시 동작
function showRegisterForm() {
	$('.loginBox').fadeOut('fast', function() {
		$('.registerBox').fadeIn('fast');
		$('.login-footer').fadeOut('fast', function() {
			$('.register-footer').fadeIn('fast');
		});
		$('.modal-title').html('Register with');
	});

	$('.error').removeClass('alert alert-danger').html('');

}

// 로그인화면 footer에 '아이디찾기' 버튼클릭시 동작
function showFindIdForm() {
	$('.loginBox').fadeOut('fast', function() {
		$('.idFindBox').fadeIn('fast');
		$('.login-footer').fadeOut('fast', function() {
			$('.idFind-footer').fadeIn('fast');
		});
		$('.modal-title').html('ID Find');
	});

	$('.error').removeClass('alert alert-danger').html('');

}

// 회원가입 창에서 (가입하기) 누를시 동작
function showMemberForm() {
	$('#loginModal .registerBox').fadeOut('fast', function() {
		$('.registerCheckBox').fadeIn('fast');
		$('.register-footer').fadeOut('fast', function() {
			$('.registerCheck-footer').fadeIn('fast');
		});
		$('.modal-title').html('Login with');
	});
	$('.error').removeClass('alert alert-danger').html('');
}
// 가입 축하 창에서 홈 버튼 누를시 동작
function createCheckForm() {
	$('#loginModal .registerCheckBox').fadeOut('fast', function() {
		$('.loginBox').fadeIn('fast');
		$('.registerCheck-footer').fadeOut('fast', function() {
			$('.login-footer').fadeIn('fast');
		});
		$('.modal-title').html('Login with');
	});
	$('.error').removeClass('alert alert-danger').html('');
}

// 아이디 찾기 창에서 footer 클릭시 ;
function showLoginIdFindForm() {
	$('.idFindBox').fadeOut('fast', function() {
		$('.loginBox').fadeIn('fast');
		$('.idFind-footer').fadeOut('fast', function() {
			$('.login-footer').fadeIn('fast');
		});

		$('.modal-title').html('Login with');
	});
	$('.error').removeClass('alert alert-danger').html('');
}
//인증번호 전송
function certificationTransmission(){
	var url = "./ajaxIdPwCheck.do";
	var data = $('#idFindForm').serialize();
	// 1.넘긴값 2.상태 3.xhr;
	function callback(result, status, xhr) {
		if(result != 0){
			document.getElementById('idFindSpan').innerHTML=result.substring(1);
			
			alert(idFindForm.email.value+"인증번호를 전송했습니다.")
		}
		else{
			alert("일치하는 정보가 없습니다")
		}
	}
	// 아작스 요청 함수
	$.post(url, data, callback);
	
	
}

// 아이디 찾기 창에서 'ID찾기 클릭시'
function showFindId() {
	var url = "./ajaxIdFindClick.do";
	var data = $('#idFindForm').serialize();
	// 1.넘긴값 2.상태 3.xhr;
	function callback(result, status, xhr) {
		if(result == 0){//인증안됨
			alert("인증번호를 올바르게 입력해주세요")
		}
		else{
			$('.idFindBox').fadeOut('fast', function() {
				$('.idFindResultBox').fadeIn('fast');
				$('.idFind-footer').fadeOut('fast', function() {
					$('.idFindResult-footer').fadeIn('fast');
				});

				$('.modal-title').html('Login with');
			});
			$('.error').removeClass('alert alert-danger').html('');
		}
	}
	// 아작스 요청 함수
	$.post(url, data, callback);
	
}

// '아이디찾기 결과' 창에서 '홈;클릭시
function showFindIdResultForm() {
	$('.idFindResultBox').fadeOut('fast', function() {
		$('.loginBox').fadeIn('fast');
		$('.idFindResult-footer').fadeOut('fast', function() {
			$('.login-footer').fadeIn('fast');
		});
		$('.modal-title').html('Login with');
	});
	$('.error').removeClass('alert alert-danger').html('');
}

// 회원가입 창에서 footer login 클릭시 로그인창이동
function showLoginForm() {
	$('#loginModal .registerBox').fadeOut('fast', function() {
		$('.loginBox').fadeIn('fast');
		$('.register-footer').fadeOut('fast', function() {
			$('.login-footer').fadeIn('fast');
		});

		$('.modal-title').html('Login with');
	});
	$('.error').removeClass('alert alert-danger').html('');
}

// 비밀번호 찾기
function showFindPwForm() {
	$('.loginBox').fadeOut('fast', function() {
		$('.findPwBox').fadeIn('fast');
		$('.login-footer').fadeOut('fast', function() {
			$('.findPw-footer').fadeIn('fast');
		});
		$('.modal-title').html('Pw Check');
	});
	$('.error').removeClass('alert alert-danger').html('');

}

// '비밀번호 찾기' 비밀번호 결과창 이동
function showFindPwResultForm() {
	$('.findPwBox').fadeOut('fast', function() {
		$('.findPwResultBox').fadeIn('fast');
		$('.findPw-footer').fadeOut('fast', function() {
			$('.findPwResult-footer').fadeIn('fast');
		});
		$('.modal-title').html('Login with');
	});
	$('.error').removeClass('alert alert-danger').html('');
}

// '비밀번호 찾기' footer 로그인 창 으로 이동
function findPw_Login() {
	$('.findPwBox').fadeOut('fast', function() {
		$('.loginBox').fadeIn('fast');
		$('.findPw-footer').fadeOut('fast', function() {
			$('.login-footer').fadeIn('fast');
		});
		$('.modal-title').html('Login with');
	});
	$('.error').removeClass('alert alert-danger').html('');
}

// '비밀번호 바꾸기 결과'변경 버튼 클릭후
function showChangePwResultForm() {
	$('.findPwResultBox').fadeOut('fast', function() {
		$('.loginBox').fadeIn('fast');
		$('.findPwResult-footer').fadeOut('fast', function() {
			$('.login-footer').fadeIn('fast');
		});
		$('.modal-title').html('Login with');
	});
	$('.error').removeClass('alert alert-danger').html('');

}
// '비밀번호 바꾸기 결과' footer변경 버튼클릭
function findPwResult_Login() {
	$('.findPwResultBox').fadeOut('fast', function() {
		$('.loginBox').fadeIn('fast');
		$('.findPwResult-footer').fadeOut('fast', function() {
			$('.login-footer').fadeIn('fast');
		});
		$('.modal-title').html('Login with');
	});
	$('.error').removeClass('alert alert-danger').html('');
}

// 홈에서 클릭시 모달창 띄움
function openLoginModal() {
	// showLoginForm();
	setTimeout(function() {
		$('#loginModal').modal('show');
	}, 230);

}
// 로그인 성공시 모달창 닫음
function closeLoginModal() {
	setTimeout(function() {
		$('#loginModal').modal('hide');
	}, 230);
}
//이메일 유효성 검사
function isEmailCheck(email){
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	return regExp.test(email);
}
//전화번호 유효성검사
function isTelCheck(telNumber){
	//01로 시작하는 핸드폰 및 지역번호와 050, 070 검증함. 그리고 -(하이픈)은 넣어도 되고 생략해도 되나 넣을 때에는 정확한 위치에 넣어야 함.
	var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
	return regExp.test(telNumber);
}
//날짜유효성검사
function isDateCheck(date) {
	var df = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
	return date.match(df);
	}