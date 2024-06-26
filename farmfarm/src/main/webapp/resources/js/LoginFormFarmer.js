function f_printEmail() {     
	    
	    // 이메일 입력창, 이메일 입력조건 불만족 시 하단에 표시되는 경고 텍스트 변수에 할당
	    	const email = document.getElementById('farmer_email');    
	    	const email_check = document.getElementById('farmer_email_check');
	  
	  	// 입력창의 값이 이메일 형태와 맞지 않게 입력된 경우
	    	if(!isEmail(email.value)){	
	  		
	        // 이메일 입력창의 테두리 빨간색으로 변경
	        	email.style.borderColor = '#EF4444';
	        // 입력창 하단의 경고 텍스트 보이게
	        	email_check.style.visibility = 'visible';               
	    	}
	    // 이메일 형태에 적합하게 입력된 경우
	    	else {
	    	// 테두리 색 원래대로 변경
	        	email.style.borderColor = '#9CA3AF';
	        // 경고 텍스트 안보이게 처리
	        	email_check.style.visibility = 'hidden';        
	  
	    // 로그인 버튼 활성화 여부를 체크하는 함수 선언
		    	

	    	}       
	    	f_btnCheck();

	  }
      function isEmail(asValue) {
		  	// 이메일 형식에 맞게 입력했는지 체크
		    let regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		    return regExp.test(asValue); // 형식에 맞는 경우에만 true 리턴	
		  
		  }
      function f_printPw() {

			// 비밀번호 입력창, 비밀번호 경고 텍스트 변수 할당
		    const pw = document.getElementById('farmer_pw');
		    const pw_check = document.getElementById('farmer_pw_check');

			// 입력한 비밀번호가 8~15자 이내가 아닐 경우
		    if(pw.value.length < 8 || pw.value.length > 15){	
		  		
		        // 입력창 테두리 빨간색으로 표시하고 경고 텍스트 보이게 처리
		        pw.style.borderColor = '#EF4444';
		        pw_check.style.visibility = 'visible';       
		        
		    }
		    else {
		    	// 입력창 테두리 원래 색으로 표시하고 경고 텍스트 안보이게 처리
		        pw.style.borderColor = '#9CA3AF';
		        pw_check.style.visibility = 'hidden';   
		    }       
		    // 로그인 버튼 활성화 여부 체크
		    f_btnCheck();
		  }
		  
		  // 이메일/비밀번호 입력값이 모두 유효할 때만 버튼 활성화
		  function f_btnCheck() {
			
		    // 이메일, 비밀번호, 로그인 버튼 변수 할당
		    const email = document.getElementById('farmer_email').value;       
		    const pw = document.getElementById('farmer_pw');
		    const login_btn = document.getElementById('login_btn');
		       
		    if (isEmail(email) && (pw.value.length >= 8 && pw.value.length <= 15)) {
		            
		        login_btn.disabled = false;
		        login_btn.style.backgroundColor = '#64a246';
		        login_btn.style.border = 'solid 0.0744rem #64a246';
		        login_btn.style.cursor = 'pointer';

		    }
		    // 모두 만족하는 경우 로그인 버튼 활성화
		    else {        
		        login_btn.disabled = true;
		        login_btn.style.backgroundColor = '#a2a2a3';
		        login_btn.style.border = 'solid 0.0744rem #a2a2a3';
		        login_btn.style.cursor = '';
		    }
		  }