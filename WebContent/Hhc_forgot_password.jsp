 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="fixed">
	<head>

<%
  String message=(String)request.getAttribute("message");

   session.removeAttribute("EMP_NAME");

   if(message==null){
	   message="";
   }
%>
 		<meta charset="UTF-8">

		<meta name="keywords" content="Hetero HealthCare Ltd" />
		<meta name="description" content="Hetero HealthCare Ltd">
		<meta name="author" content="Sairam Duggi">
		
		<title>Hetero Healthcare LTD</title>
          <link rel="icon" href="LOH.png" />
		<!-- <link rel="icon" type="image/png"  href="favicon.ico"> -->

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		
		<meta http-equiv="X-UA-Compatible" content="IE=Edge" />

		<!-- Web Fonts  -->
		<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="assets/vendor/magnific-popup/magnific-popup.css" />
		<link rel="stylesheet" href="assets/vendor/bootstrap-datepicker/css/datepicker3.css" />
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		

		<!-- Theme CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme.css" />

		<!-- Skin CSS -->
		<link rel="stylesheet" href="assets/stylesheets/skins/default.css" />

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="assets/stylesheets/theme-custom.css">
		<!-- <link rel="stylesheet" href="assets/stylesheets/login.css"> -->
		<link rel="stylesheet" href="assets/stylesheets/forgot.css">

		<!-- Head Libs -->
		<script src="assets/vendor/modernizr/modernizr.js"></script>
		
		<script>
var isOpera = (!!window.opr && !!opr.addons) || !!window.opera || navigator.userAgent.indexOf(' OPR/') >= 0;
var isFirefox = typeof InstallTrigger !== 'undefined';
var isSafari = Object.prototype.toString.call(window.HTMLElement).indexOf('Constructor') > 0;
var isIE = /*@cc_on!@*/false || !!document.documentMode;
var isEdge = !isIE && !!window.StyleMedia;
var isChrome = !!window.chrome && !!window.chrome.webstore;
var isBlink = (isChrome || isOpera) && !!window.CSS;
var output = 'Detecting browsers by ducktyping:<hr>';
output += 'isFirefox: ' + isFirefox + '<br>';
output += 'isChrome: ' + isChrome + '<br>';
output += 'isSafari: ' + isSafari + '<br>';
output += 'isOpera: ' + isOpera + '<br>';
output += 'isIE: ' + isIE + '<br>';
output += 'isEdge: ' + isEdge + '<br>';
output += 'isBlink: ' + isBlink + '<br>';

function DetecBrowser(){
	
	$(".sms_loader").fadeOut("slow");
	//$(".presms_loader").fadeOut("slow");
//	document.getElementById("presms_loader").style.display='none';

	
if(isIE){
	
	document.getElementById("loginbdy_IE").style.display='';
	//window.open("leave.html");
}else{
	
	try{
		document.getElementById("loginbdy").style.display='';
	}catch(err){
		alert(err.message+":err");
	}
	}
}
</script>
<script>

/* $(function() {
    $('#btnCallService').click(function() {
        $.ajax({
            type: 'POST',
            url: 'forgotpassword',
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function(response) {
                $('#lblData').html(JSON.stringify(response));
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
}); */

var OTPSTORE=0;
function GetOTP(dataObj){
	
	//$("#inmsg").hide();
	
	$("#errmsg").html("");
    //$('#inmsg').hide();
    $("#password_block").hide();
    
    $("#vuserid").prop('disabled',true);
    
    var flag=true;

	//alert("hi");
	var userid = $("#username").val();
	
    if (userid.length<4)  
		{
    	//alert("hi");
    	//$('#inmsg').show();
    	$("#errmsg").html("Please enter valid UserID..!");
    	
    	$("#vuserid").prop('disabled',false);
    	
    	
    	flag=false;
    	return false;
    	
		}	
    $(".sms_loader").fadeOut("slow");
	$("#stepTwo_blk").hide();
	$("#stepThree_blk").hide();
	document.getElementById("presms_loader").style.display='';
	
	$("#get").prop('disabled',true);
	document.getElementById("errmsg").innerHTML="";
	
	var user_name=document.getElementById("username");
			var password=$("#NewPass").val();
			var ConPassword=$("#ConNewPass").val();
			var Mobile=$("#Mobile").val();
			var OTP=$("#dbotp").val();
            var SUBROUTE="NA";
			//$(".sms_loader").fadeIn("slow");
			 
			$("#stepThree_blk").css("display","block"); 
			
			 if(dataObj=="Submitform"){
				 
				 /* $("#conf_submit").show();
				 $("#stepTwo_blk").show();
				 $("#stepThree_blk").show(); */
				 
				 var FGGG= /^(?=.*[0-9])(?=.*[!@#$&])[a-zA-Z0-9!@#$&]{6,15}$/;
				 
				 $(".sms_loader").fadeOut("slow");
				 
				 $("#stepTwo_blk").show();
        		 $("#stepThree_blk").show();
        		 $("#password_block").show();
        		 
				 if(password!=ConPassword){
					 $("#errmsg").html("New password and confirm password should be same..!");
					  $(".sms_loader").fadeOut("slow"); 
					/*  $('.sms_loader').fadeOut(500, function () {
						    alert("Now all '.hotel_photo_select are hidden'");
						});
					 */	
					 
					 return false;
				 }else if(!ConPassword.match(FGGG)){
					 
					 $("#errmsg").html("Invalid password. Please select password as per the instructions <a href='#' data-toggle='tooltip' title='Password should be minimum 6 & maximum 15 Characters with minimum one letter [a-z(OR)A-Z] , one special Character [!,@,#,$,&] and digits[0-9].' data-original-title='Password should be minimum 6 & maximum 15 Characters with minimum one letter [a-z(OR)A-Z] ,minimum one special Character [!,@,#,$,&] and Number[0-9].' data-type='info' class='hetero_tooltip' id='hetero_tooltp'><i class='fa fa-info-circle' aria-hidden='true'></i></a>");
 				 
					/*  $("#errmsg").html("Invalid password Please select password as per the instructions <a href="#" title="Link Detail in Tooltip"></a>"); */

					 // VENU
					 $(".sms_loader").fadeOut("slow");
					 return false;
				 
				 }else if(ConPassword.length<6){
					 
					 $("#errmsg").html("Password lenght should be > 6 ");
					 $(".sms_loader").fadeOut("slow");
					 return false;
				 }
				 
				 
				 if(OTP.length!=4){
					 
					 $("#errmsg").html("Please enter valid OTP");
					 $(".sms_loader").fadeOut("slow");
					 return false;
					 
				 }else if(OTPSTORE!=OTP){
					 
					 $("#errmsg").html("Please enter valid OTP");
					 $(".sms_loader").fadeOut("slow");
					 return false;
				 }
				 
			 }
			 
			 else if(dataObj=="Getsms"){
				 if( $("#mobile_valid").prop("checked") == true ){
					 SUBROUTE="ALMB";
					 Mobile=$("#Mobile1").val();
					 if(Mobile.length<10){
						 $("#errmsg").html("Enter valid mobile number..!");
						// $(".sms_loader").fadeOut("slow");
						 return false;
					 }
				 }
							 }

	var routing=dataObj;
	if (user_name.value.length>=4 && flag){
		
		$("#conf_submit").show();
		 $("#stepTwo_blk").hide();
		 $("#stepThree_blk").hide();
		    
		$.ajax({
            type: 'POST',
            url: "forgotpassword?Routing="+dataObj+"&username="+user_name.value+"&password="+ConPassword+"&Mobile="+Mobile+"&OTP="+OTP+"&SUBROUTE="+SUBROUTE+"",
           dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function(data) {
            	OTPSTORE=000;
            	
            	/* Getsms;
            	Submitform
 */
            	
            	if(data.Code =="000" && dataObj=="Getsms" ){
            		
            		OTPSTORE=data.OTP;
            		
            		 $("#stepTwo_blk").show();
            		 $("#stepThree_blk").show();
            		 
            		 try{
            			 
            		 $("#username").prop('disabled',true);
            		// document.getElementById("username").readOnly=true;
            		 }catch(err){
            			// alert(err.message);
            		 }
            		// $("#password_block").show();
            		 
            		 
            		 $("#vuserid").prop('disabled',true);
    			    $("#Mobile").val(data.MOBILE);
					$("#Mobile").prop('disabled',true);
					$("#subt").prop('disabled',false);
					$("#Mobile1").prop('disabled',true);
					//$("#stepThree_blk").show();
					/* if ($("#rdobtn").prop("checked")) {
						
						$("#Mobile1).prop('disabled',false);
					} */
					
					
					$("#NewPass").prop('disabled',false);
					$("#ConNewPass").prop('disabled',false);
					$("#dbotp").prop('disabled',false);
					
					$(".sms_loader").fadeOut("slow");
										
    			}else if(dataObj=="Submitform" ){
    				 $("#stepTwo_blk").show();
            		 $("#stepThree_blk").show();
            		// $("#stepThree_blk").show();
    				$("#errmsg").html(data.message); 
    				$(".sms_loader").fadeOut("slow");
    				$("#subt").prop('disabled',true);
    				 $("#NewPass").prop('disabled',true);
  					$("#ConNewPass").prop('disabled',true);
  					
  					setTimeout(skipfun, 1000);
    				
    			}else if(dataObj=="GetValid" ){
    				
    				//$("#stepTwo_blk").show();
    				 $("#Mobile").val(data.MOBILE);
    				if(data.Code=="1001"){
    					 $("#username").prop('disabled',true);
    					$("#stepTwo_blk").show();
    					$("#get").prop('disabled',false);
    					$("#vuserid").prop('disabled',true);
    					
    				
    									
    				}else{
    					//$("#get").prop('disabled',t);
    					$("#vuserid").prop('disabled',false);
							
    					$("#stepThree_blk").hide();
    				}
    				$("#errmsg").html(data.message);
    				$(".sms_loader").fadeOut("slow");
    				
    			}
            	
            	else{
    				document.getElementById("errmsg").innerHTML=data.message;
    				$(".sms_loader").fadeOut("slow");
    				$("#stepTwo_blk").hide();
    				$("#get").prop('disabled',false);
    			}
            },
            error: function(error) {
                console.log(error);
                $(".sms_loader").fadeOut("slow");
                $("#get").prop('disabled',false);
                $("#stepTwo_blk").hide();
                $("#stepThree_blk").hide(); 
            }
        });
		
	}else{
		document.getElementById("errmsg").innerHTML="Please Enter your valid UserID ";
		$("#get").prop('disabled',false);
		$(".sms_loader").fadeOut("slow");
		return false;
	}
	
	//$(".sms_loader").fadeOut("slow");
	
//}
	
}
var ACT_TIME=4000;
function skipfun(){
	
	var IDLTIME=parseInt(ACT_TIME/1000);
	ACT_TIME=ACT_TIME-1000;
	
	document.getElementById("timed").innerHTML=IDLTIME;
	if(IDLTIME<1){
	  document.forms[0].action="login.html";
	  document.forms[0].submit();
	}else{
		setTimeout(skipfun, ACT_TIME);
	}
	
}

function pwvalidate(){
	
	
	var user_name=document.getElementById("username");
	
	
	if (user_name.value.length>0){
		
		document.forms[0].submit();
		
		$("#get").prop('disabled',true);
		
	}else{
		document.getElementById("errmsg").innerHTML="Please Enter your Username & Mobile number";
		return false;
	}
	
}


$('a').tooltip({
    
    disabled: true,
    close: function( event, ui ) { $(this).tooltip('disable'); }
});

$('a').on('click', function () {
    $(this).tooltip('enable').tooltip('open');
});
//only number


function handleKeyPress(evt) {
	evt = (evt) ? evt : window.event;
	var charCode = (evt.which) ? evt.which : evt.keyCode;
	if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		return false;
	}
	return true;
}

function isNumber(evt) {
	evt = (evt) ? evt : window.event;
	var charCode = (evt.which) ? evt.which : evt.keyCode;
	if (charCode > 31 && (charCode < 48 || charCode > 57)) {
		return false;
	}
	return true;
}



/* function verifyUser(){
	
	$("#stepTwo_blk").css("display","block"); 
}
 */
</script>

<script>
  function disableBackButton() {
	   window.history.forward();
	}
	setTimeout("disableBackButton()", 0);
	document.onkeydown = function(){
	       if(event.keyCode == 116) {
	            event.returnValue = false;
	            event.keyCode = 0;
	            return false;
	        }

	}

 function handleKeyPress1(e){
		 var key=e.keyCode || e.which;
		  if (key==13){
		     pwvalidate();
		  }
		}

 function keydown(e){
	 
	 var OTP=$("#dbotp").val();
	 
	 $("#errmsg").html("");
	// alert(OTP +"~" +e);
	 
	 if(OTP==OTPSTORE){
		 
		 $("#errmsg").html('');
		 $("#password_block").show();
		 $("#conf_submit1").show();
		 
		 $("#dbotp").prop("disabled",true);
		 
	 }else{
		 $("#dbotp").prop("disabled",false);
		 $("#errmsg").html("Please enter valid OTP");
	 }
	 /* var key=e.keyCode || e.which;
	  if (key==13){
	     pwvalidate();
	  } */
	}

 
	</script>

	<script type="text/javascript">
		window.history.forward();
		function noBack() { 
		
			
			window.history.forward(); 
			
		}
		
		$(document).ready(function(){
			  $('[data-toggle="tooltip"]').tooltip();
			});
	
  </script>

<script type="text/javascript">

function radiobtn ()
{
	//alert("hi");
	$("#Mobile1").prop('disabled',false);
	
	}


function Resetbt(){
	
	//alert("hi");
	$("#username").prop('disabled',false);
	$("#get").prop('disabled',false);
	$("#username").prop('disabled',false);
	$("#vuserid").prop('disabled',false);
	
	//$("#username").prop('disabled',false);
	
	
	//$("#Mobile1").prop('disabled',true);
	$("#stepTwo_blk").hide();
	$("#stepThree_blk").hide();
	$("#password_block").hide();
	$("#conf_submit1").hide();

	//$("#Mobile1").prop('disabled',true);
	document.getElementById("errmsg").innerHTML='';
	
	
	//$("#errmsg").hide();
	document.forms[0].reset();
	
}
/* $("#resetbtn").onclick(function(){
	alert("hi");
	$("#get").prop('disabled',false);
	document.getElementById("errmsg").innerHTML='';
	//$("#errmsg").hide();
	document.forms[0].reset();


}); */

</script>




	</head>
	<body onload="DetecBrowser(); disableBackButton(); noBack();">
		<!-- start: page -->
<form >
	<input type='password' style='display:none;' value='0' id='pwdotp' >
	<div id="loginbdy_IE" style="display:none" > 
	<div class="conatiner">
		
		
			
			<div class="text-center"><a href="http://www.heterohealthcare.com/" /> <h3>Compatible only with Chrome , Firefox & Edge Browser's</h3>  </a></div>
			
			
		
		</div>
	</div>
	<div id="loginbdy" style="display:none">	
<section class="body-sign">
			<div class="center-sign">
				 <!-- <a href="/" class="logo pull-left">
					<img src="assets/images/logo.png"  alt="Hetero HealthCare Ltd" />
				</a>  -->
<div class="frgot_section">

<div class="col-sm-12 " align='right' >
							 <a href="login.html" ><em><B>Skip</B></em></a>
							</div>
							
				<div class="panel1 panel-sign">
					<div class="panel-title-sign mt-xl text-right">
					    
						<h2 class="title text-uppercase text-bold m-none"><i class="fa fa-user mr-xs"></i>Forgot Password</h2>
					</div>
					<div class="panel-body">
						<div style=""></div>
						
							<div class="form-group ">
								<div class="col-sm-8">
								<label >EmployeeID</label>
									<div class="input-group input-group-icon">
										<input type="text"  id="username"  maxlength='6'  placeholder="Employee ID"  class="form-control" autocomplete="off"  onkeypress="return isNumber(event)" / >
									 <!-- <div id="inmsg" style='color:red;margin-bottom: 20px;' hidden = "hidden">Please enter User ID</div> --> 
										
										<span class="input-group-addon">
											<span class="icon">
												<i class="fa fa-user"></i>
											</span>		
										</span>										
									</div>
										</div>
							<div class="col-sm-4">
									<br>
									<button type="button" id='vuserid' onclick="GetOTP('GetValid')" class="btn btn-primary btn-block get_otp_btn" >Verify</button>
									</div>
								
																
							</div>
							
							
							<div class="fadeIn" id="stepTwo_blk">
							<div class="form-group ">
							<label class="mob_lbl">Mobile Number (if you want to update mobile number,please contact HR)</label>
								<div class="col-sm-8">
								
									<div class="input-group input-group-icon">
										<input name="otp" type="text" maxlength='10' autocomplete="off"   placeholder="Enter Employee Mobile Number OTP " id="Mobile" class="form-control" onkeypress="return isNumber(event)" disabled/>
										<span class="input-group-addon">
											<span class="icon">
												<i class="fa fa-mobile"></i>
											</span>
										</span>
									</div>
								</div>
								
								
								<div class="col-sm-4">
									<button type="button" onclick="GetOTP('Getsms');" class="btn btn-primary btn-block get_otp_btn loader_div" id="get">GET OTP</button>
									</div>
								
								
								
								<!-- <div class="col-sm-6">
								<label><input type="radio" id="mobile_valid" name="mobile_valid" value="altmobile" onclick="radiobtn();">Alternative Mobile Number
								<a href="#" data-toggle="tooltip" title="" data-original-title="Alternative Mobile No. will be updated in HR Database"><i class="fa fa-info-circle" aria-hidden="true"></i></a>  </label>
									<div class="input-group input-group-icon">
									
										<input name="otp" type="text" maxlength='10' autocomplete="off"   placeholder="Enter Employee Mobile Number OTP " id="Mobile1" class="form-control" onkeypress="return isNumber(event)" disabled />
										<span class="input-group-addon">
											<span class="icon">
												<i class="fa fa-mobile"></i>
											</span>
										</span>
									</div>
								</div> -->
								
								
								</div>
								
							</div>
							
							
							<div class="fadeIn" id="stepThree_blk">
							
							<div class="form-group">
							<div class="col-sm-6">
								<label>OTP</label>
									<div class="input-group input-group-icon otp_sctn">
										<input type="text"  size=4 placeholder="Enter OTP" name="dbotp" autocomplete="off"  id="dbotp" Onblur="keydown(event)"  onkeypress="return isNumber(event)" class="form-control" disabled />
										<span class="input-group-addon">
											<span class="icon">
												<i class="fa fa-lock"></i>
											</span>
										</span>
									</div>
								</div>
								<div class="col-sm-6"><br>
								<p>Enter <b>OTP</b> Received on Registered Mobile Number & <Strong>"Press TAB" </Strong></p>
								</div>
							</div>
                             
							<div id='password_block' class="form-group fadeIn">
							<div class="col-sm-6">
				<label >Enter Password
				<a href="#" data-toggle="tooltip" title="" data-original-title="Password should be minimum 6 & maximum 15 characters with
				minimum one letter [a-z(OR)A-Z] , one special Character [!,@,#,$,&] and digits[0-9]." data-type="info" class="hetero_tooltip" id="hetero_tooltp"><i class="fa fa-info-circle" aria-hidden="true"></i></a>
						</label>		
									<div class="input-group input-group-icon">
										<input  type="password" placeholder="Password" name="pwd" autocomplete="off" id="NewPass" onkeypress="handleKeyPress(event)" class="form-control" disabled />
										<span class="input-group-addon">
											<span class="icon">
												<i class="fa fa-lock"></i>
											</span>
										</span>
									</div>
								</div>
								<div class="col-sm-6">
								<label>Confirm Password</label>
									<div class="input-group input-group-icon">
										<input  type="password" placeholder="Password" name="pwd" autocomplete="off"  id="ConNewPass" onkeypress="handleKeyPress(event)"; class="form-control" disabled />
										<span class="input-group-addon">
											<span class="icon">
												<i class="fa fa-lock"></i>
											</span>
										</span>
									</div>
								</div>
							</div>
							
							</div>
							
							
							

							<div class="row m_0" id="conf_submit" style='display:none;'>
								
								<div class="col-sm-6 text-right" id="conf_submit1" style='display:none;'>
								    <button type="button"  onclick="GetOTP('Submitform');" class="btn btn-primary btn-block btn-flat" id="subt" disabled >Confirm</button>
									<!--<button type="submit" class="btn btn-primary btn-block visible-xs ">Sign In</button>-->
									<!--  onclick="pwvalidate();" -->
								</div>
							<div class="col-sm-6 ">
							 <input type="reset" id="resetbtn" class="btn btn-primary btn-block" onclick='Resetbt()'  value="Reset">
							</div>
                             
                             </div>
                             
                             <!-- <div class="col-sm-6 ">
							 <a href="login.html" ><input type="button" class="btn btn-primary btn-block"  value="Home"> </a>
							</div>
                              -->
                             
                             
                             <div class="clearfix"></div>
                             <div class="row m_0">
							<div class="text-center error_msg col-sm-12">
							<p style="color:red" class="text-center" id="errmsg"><%=message %></p>
							</div>
							</div>

					</div>
					
					
					<div class="hr_note"> Note: if you want to update mobile number, please contact HR.<div>
				</div>

             
			</div>	
						</div>
		</section>
		<!-- end page -->
		
		<script>
		$(document).ready(function() {
			  $('[data-toggle="tooltip"]').tooltip()
			});
		</script>
		<!-- Vendor -->
		<script src="assets/vendor/jquery/jquery.js"></script>
		<script src="assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
		<script src="assets/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="assets/vendor/nanoscroller/nanoscroller.js"></script>
		<script src="assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/vendor/magnific-popup/magnific-popup.js"></script>
		<script src="assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>
		
		<!-- Theme Base, Components and Settings -->
		<script src="assets/javascripts/theme.js"></script>
		
		<!-- Theme Custom -->
		<script src="assets/javascripts/theme.custom.js"></script>
		
		<!-- Theme Initialization Files -->
		<script src="assets/javascripts/theme.init.js"></script>
    </div>
    
 
    
    <div class="sms_loader" id="presms_loader" style='display:none;'></div>
    </form>
	</body>
</html> 
