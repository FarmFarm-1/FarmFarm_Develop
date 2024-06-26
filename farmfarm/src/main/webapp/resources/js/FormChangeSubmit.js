
		function showForm(formId) {
			  // 모든 form 숨기기
			  
			  if (formId == 'sloginForm') {
		document.getElementById('farmer_email').style.borderColor = '#9CA3AF';
    	document.getElementById('farmer_email_check').style.visibility = 'hidden';
    	document.getElementById('farmer_pw').style.borderColor = '#9CA3AF';
    	document.getElementById('farmer_pw_check').style.visibility = 'hidden';

				  
       	document.querySelector('.rectangle-97-tDT').style.backgroundColor = '#f6f6f6';
        document.querySelector('.rectangle-97-tDT p').style.color = '#2d2d2d';
        document.querySelector('.rectangle-97-tDT p').style.fontWeight = '700';
        document.querySelector('.rectangle-97-tDT p').style.left = '20rem';
        document.querySelector('.rectangle-97-tDT').style.width = '625.879px';
        document.querySelector('.rectangle-97-tDT').style.left = '29rem';
    	document.getElementById('farmer_email_check').style.visibility = 'hidden';

        document.querySelector('.group-102-V6m').style.backgroundColor = '#eeeeee';
        document.querySelector('.group-102-V6m p').style.color = '#686868';
        document.querySelector('.group-102-V6m p').style.fontWeight = '400';
        document.querySelector('.group-102-V6m p').style.left = '6rem';
        document.querySelector('.group-102-V6m').style.width = '290.241px';

    } else if (formId == 'floginForm') {
		document.getElementById('user_email').style.borderColor = '#9CA3AF';
    	document.getElementById('email_check').style.visibility = 'hidden';
    	
    	document.getElementById('user_pw').style.borderColor = '#9CA3AF';
    	document.getElementById('pw_check').style.visibility = 'hidden';
    	
    	
        document.querySelector('.group-102-V6m').style.backgroundColor = '#f6f6f6';
        document.querySelector('.group-102-V6m p').style.color = '#2d2d2d';
        document.querySelector('.group-102-V6m p').style.fontWeight = '700';
        document.querySelector('.group-102-V6m p').style.left = '23rem';
        document.querySelector('.group-102-V6m').style.width = '625.879px';

        
        document.querySelector('.rectangle-97-tDT').style.backgroundColor = '#eeeeee';
        document.querySelector('.rectangle-97-tDT p').style.color = '#686868';
        document.querySelector('.rectangle-97-tDT p').style.fontWeight = '400';
        document.querySelector('.rectangle-97-tDT p').style.left = '4.5rem';
        document.querySelector('.rectangle-97-tDT').style.width = '290.241px';
        document.querySelector('.rectangle-97-tDT').style.left = '62.5rem';
    	}
			  
			  
			  const allForms = document.querySelectorAll('.rectangle-98-HoK');
			  allForms.forEach((form) => {
			    form.style.display = 'none';
			    form.reset();
			  });

			  const targetForm = document.getElementById(formId);
			  if (targetForm) {
			    targetForm.style.display = 'block';
			  }
			  
		}	
		
		
		function submitForm(){
			
			var currentForm = document.querySelector('.rectangle-98-HoK[style="display: block;"]');
   			if (currentForm.id === 'sloginForm') {
            	user_login_check();
        	} else if (currentForm.id === 'floginForm') {
            	farmer_login_check();
        	}
		}
		
		
		function user_login_check(){
			
			var user_email = $("#user_email").val();
	        var user_pw = $("#user_pw").val();
	        
	        $.ajax({
	            type: "POST",
	            url: "login/userLogin",
	            data: {
	                "user_email": user_email,
	                "user_pw": user_pw
	            },
	            success: function (result) {
	                // 로그인이 성공한 경우
	                if (result === "true") {
	                    location.href = "/"; // 로그인 성공 시 이동할 페이지
	                }else {
	                    // 로그인 실패 시 메시지를 표시하고 페이지에 머무르게 함
	                     $(".btnOk_myproject").addClass('hidden');
	                     $(".btnOk_account").addClass('hidden');
	                     document.querySelector('.alertTitle').style.margin = '3rem 0rem 3rem 0rem';
	                    document.querySelector('#basicModal .alertTitle').textContent = "로그인에 실패했습니다.";
            			document.querySelector('#basicModal .alertContent').textContent = "ID 또는 패스워드를 다시 확인해 주세요.";            			
	                    document.querySelector('.modal').style.display='flex';
	                    
	                }
	            },
	            error: function () {
	                alert("서버 오류가 발생했습니다.");
	            }
	        });
		}
		
		function farmer_login_check(){
			
			var farmer_email = $("#farmer_email").val();
	        var farmer_pw= $("#farmer_pw").val();
	        $.ajax({
	            type: "POST",
	            url: "login/farmerLogin",
	            data: {
	                "farmer_email": farmer_email,
	                "farmer_pw": farmer_pw
	            },
	            success: function (result) {
	                // 로그인이 성공한 경우
	                if (result === "true") {
	                    location.href = "/"; // 로그인 성공 시 이동할 페이지
	                } else {
	                    // 로그인 실패 시 메시지를 표시하고 페이지에 머무르게 함
	                     $(".btnOk_myproject").addClass('hidden');
	                     $(".btnOk_account").addClass('hidden');
	                     document.querySelector('.alertTitle').style.margin = '3rem 0rem 3rem 0rem';
	                    document.querySelector('#basicModal .alertTitle').textContent = "로그인에 실패했습니다.";
            			document.querySelector('#basicModal .alertContent').textContent = "ID 또는 패스워드를 다시 확인해 주세요.";
	                    document.querySelector('.modal').style.display='flex';
	                    
	                }
	            },
	            error: function () {
	                alert("서버 오류가 발생했습니다.");
	            }
	        });
		}