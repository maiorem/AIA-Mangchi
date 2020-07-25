<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">
    <title>로그인 / 회원가입</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/carousel/">

    <!-- Bootstrap core CSS -->
	<link rel='stylesheet' href='<c:url value="/assets/dist/css/bootstrap.css"/>'>
	<link rel='stylesheet' href='<c:url value="/css/default.css"/>'> 
    <!-- Custom styles for this template -->
    <link href='<c:url value="/css/carousel.css"/>' rel="stylesheet">
    <link href='<c:url value="/css/RegForm.css"/>' rel="stylesheet">
    
  
  </head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<div>

<main role="main">

  <div id="myCarousel" class="carousel slide" data-ride="carousel">

	<div class="section">
		<div class="container">
			<div class="row full-height justify-content-center">
				<div class="col-12 text-center align-self-center py-5">
					<div class="section pb-5 pt-5 pt-sm-2 text-center">
						<h6 class="mb-0 pb-3"><span>Log In </span><span>Sign Up</span></h6>
			          	<input class="checkbox" type="checkbox" id="reg-log" name="reg-log"/>
			          	<label for="reg-log"></label>
						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
								<div class="card-front">
									<div class="center-wrap">
										<div class="section text-center">
											<h4 class="mb-4 pb-3">Log In</h4>
											<form action="login.do" method="post">
											<div class="form-group">
												<input type="email" name="logemail" class="form-style" placeholder="Your Email" id="logemail" autocomplete="off">
												<i class="input-icon uil uil-at"></i>
											</div>	
											<div class="form-group mt-2">
												<input type="password" name="logpass" class="form-style" placeholder="Your Password" id="logpass" autocomplete="off">
												<i class="input-icon uil uil-lock-alt"></i>
											</div>
											<input type="submit" class="btn mt-4">
											</form>
                            				<p class="mb-0 mt-4 text-center"><a href="#0" class="link">Forgot your password?</a></p>
                            				<br>
                            				<!-- 카카오 로그인 api -->
                            				<a id="custom-login-btn" href="#"><img src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222"/></a>
				      					</div>
			      					</div>
			      				</div>
								<div class="card-back">
									<div class="center-wrap">
										<div class="section text-center">
											<h4 class="mb-4 pb-3">Sign Up</h4>
											<div class="form-group">
												<input type="text" name="logname" class="form-style" placeholder="Your Full Name" id="logname" autocomplete="off">
												<i class="input-icon uil uil-user"></i>
											</div>	
											<div class="form-group mt-2">
												<input type="email" name="logemail" class="form-style" placeholder="Your Email" id="logemail" autocomplete="off">
												<i class="input-icon uil uil-at"></i>
											</div>	
											<div class="form-group mt-2">
												<input type="password" name="logpass" class="form-style" placeholder="Your Password" id="logpass" autocomplete="off">
												<i class="input-icon uil uil-lock-alt"></i>
											</div>
											<a href="#" class="btn mt-4">submit</a>
				      					</div>
			      					</div>
			      				</div>
			      			</div>
			      		</div>
			      	</div>
		      	</div>
	      	</div>
	    </div>
	</div>
  </div>
  
 
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>window.jQuery || document.write('<script src="<c:url value='/assets/js/vendor/jquery.slim.min.js'/>"><\/script>')</script><script src="<c:url value='/assets/dist/js/bootstrap.bundle.js'/>"></script>
	
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	Kakao.init('5a8a5ce6115cd1642bcb72f180541d7b');
	
	$(function(){
		
		
		
		
		var idCheck = function(res){
            var id = res.id;
            var nick = res.properties.nickname;
            var photo = res.properties.profile_image;
            /* goAjaxPost("/Mangchi/member/kakaoCheck.do", 'post', param , function(data){
            	
            }); */
            $.ajax({
            	url:"/Mangchi/member/kakaoCheck.do",
            	type:"post",
            	data:{id:id, nick:nick, photo:photo},
            	success:function(data){
            		if(data==0){
            			alert("사이트가 처음이시군요?" +
            						"\n 추가 회원 가입이 필요합니다." +
            						"\n 회원가입 페이지로 이동합니다.");
            			location.replace("kakaoRegForm.do?kid="+id);
            		}else if(data==1){
            			alert("추가 회원가입을 안하셨군요?" +
            					"\n 추가 회원 가입이 필요합니다." +
								"\n 회원가입 페이지로 이동합니다.");
            			location.replace("kakaoRegForm.do?kid="+id);
            		}else if(data=2){
            			alert("로그인 되었습니다.");
            			location.replace("kakaoLogin.do?kid="+id);
            		};
            	},
            	error:function(request,status,error){
            		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
            });
		};
		
		
		var kakaoLogin = function(){
			Kakao.Auth.login({
	               success: function(authObj) {
						
	            	   Kakao.API.request({
	                       url: '/v2/user/me',
	                       success: function(res) {

	                           //alert(JSON.stringify(authObj));
	                           alert('로그인 되었습니다.');
								
	                           
		                        //$('#login').css('display', 'none');
		                        //$('#uinfo').css('display', 'inline');
		                        //$('#status').css('display', 'inline');
		                        //$('#logout').css('display', 'inline');
								
	                           console.log(res);

	                           // -> 요기에다가 회원가입이나 로그인하는 서버 로직 호출
	                           idCheck(res);
	                          /*  var id = res.id;
	                           $.ajax({
	                           	url:"kakaoCheck.do",
	                           	type:"post",
	                           	data:{id:id},
	                           	success:function(data){
	                           		alert("완료!" + id);
	                           		//window.opener.location.reload();
	                           		//self.close();
	                           	}
	                           }); */

	                       },
	                       fail: function(error) {
	                           alert(JSON.stringify(error));
	                       }
	                   });

	               },
	               fail: function(error) {
	                   alert(JSON.stringify(error))
	               }
	           });
		}
		
		var kakaoLoninBtnOnClickEvent = function(){
			$("#custom-login-btn").on("click", function(){
				kakaoLogin();
			});
		}
		
		
		
		
		var init = function(){
			kakaoLoninBtnOnClickEvent();
		}
		
		init();
	})
	
	
	
	
	
	/*
	$(function(){
		
		$.kakaoLogin = function(){
			Kakao.Auth.login({
	               success: function(authObj) {
						
	            	   Kakao.API.request({
	                       url: '/v2/user/me',
	                       success: function(res) {

	                           //alert(JSON.stringify(authObj));
	                           alert('로그인 되었습니다.');
								
	                           
		                        //$('#login').css('display', 'none');
		                        //$('#uinfo').css('display', 'inline');
		                        //$('#status').css('display', 'inline');
		                        //$('#logout').css('display', 'inline');
								
	                           console.log(res);

	                           // -> 요기에다가 회원가입이나 로그인하는 서버 로직 호출해주면되 엌.. 감사합니다...(__)

	                       },
	                       fail: function(error) {
	                           alert(JSON.stringify(error));
	                       }
	                   });

	               },
	               fail: function(error) {
	                   alert(JSON.stringify(error))
	               }
	           });
		}
		
		$.fn.kakaoLoninBtnOnClickEvent = function(){
			var $this = $(this);
			$this.on("click", function(){
				$.kakaoLogin();
			})
		}
		
		
		$($.initView = function(){
			$("#custom-login-btn").kakaoLoninBtnOnClickEvent();
		})
		
		
		$.initView();
		이게다임 아..하..		
		
	})
	*/
	</script>
	

</body>
</html>

  
  
  
  
  