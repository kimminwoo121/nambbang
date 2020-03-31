/*
 *
 * login-register modal
 * Autor: Creative Tim
 * Web-autor: creative.tim
 * Web script: http://creative-tim.com
 * 
 */

function showFindId(){
	$('#loginModal').modal('hide');
	$('#pwModal').modal('hide');
	$('#memberModal').modal('hide');
	$('#idModal').modal('show');
}

function showFindIdForm(){
	showFindId();
	
    $(' .findIdResultBox').fadeOut('fast',function(){
        $('.findIdBox').fadeIn('fast');
    }); 
    $('.error').removeClass('alert alert-danger').html('');	
}

function showFindIdResultForm(){
	showFindId();
	
    $(' .findIdBox').fadeOut('fast',function(){
        $('.findIdResultBox').fadeIn('fast');
    }); 
    $('.error').removeClass('alert alert-danger').html('');	
}

function showFindPw(){
	$('#loginModal').modal('hide');
	$('#idModal').modal('hide');
	$('#memberModal').modal('hide');
	$('#pwModal').modal('show');
}

function showFindPwForm(){
	showFindPw();

    $(' .findPwResultBox').fadeOut('fast',function(){
        $(' .findPwBox').fadeIn('fast');
    }); 
    $('.error').removeClass('alert alert-danger').html('');	
}
function showFindPwResultForm(){
	showFindPw();
	
    $(' .findPwBox').fadeOut('fast',function(){
        $(' .findPwResultBox').fadeIn('fast');
    }); 
    $('.error').removeClass('alert alert-danger').html('');		
}

function showMemberForm(){
	$('#loginModal').modal('hide');
	$('#idModal').modal('hide');
	$('#pwModal').modal('hide');
	$('#memberModal').modal('show');
}


function showRegisterForm(){
    $(' .loginBox').fadeOut('fast',function(){
        $('.registerBox').fadeIn('fast');
        $('.login-footer').fadeOut('fast',function(){
            $('.register-footer').fadeIn('fast');
        });
        $('.modal-title').html('회원가입');
    }); 
    $('.error').removeClass('alert alert-danger').html('');
       
}

function showLogin(){
	$('#idModal').modal('hide');
	$('#pwModal').modal('hide');
	$('#memberModal').modal('hide');
}

function showLoginForm(){
	showLogin();
	
    $('#loginModal .registerBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.register-footer').fadeOut('fast',function(){
            $('.login-footer').fadeIn('fast');    
        });
        
        $('.modal-title').html('로그인');
    });       
     $('.error').removeClass('alert alert-danger').html(''); 
}

function openLoginModal(){
    showLoginForm();
    setTimeout(function(){
        $('#loginModal').modal('show');    
    }, 230);
    
}
function openRegisterModal(){
    showRegisterForm();
    setTimeout(function(){
        $('#loginModal').modal('show');    
    }, 230);
    
}

function loginAjax(){
    /*   Remove this comments when moving to server
    $.post( "/login", function( data ) {
            if(data == 1){
                window.location.replace("/home");            
            } else {
                 shakeModal(); 
            }
        });
    */

/*   Simulate error message from the server   */
     shakeModal();
}

function shakeModal(){
    $('#loginModal .modal-dialog').addClass('shake');
             $('.error').addClass('alert alert-danger').html("Invalid id/password combination");
             $('input[type="password"]').val('');
             setTimeout( function(){ 
                $('#loginModal .modal-dialog').removeClass('shake'); 
    }, 1000 ); 
}

   