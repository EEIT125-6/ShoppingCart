<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">   
<title>查詢結果</title>
<!-- Google Icon -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<!--     字體跟ICON     -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet" />
	 <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" data-integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" data-crossorigin="anonymous"/>
    <!-- CSS Files -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/light-bootstrap-dashboard.css" rel="stylesheet" />	
</head>
<body>
    <div class="wrapper">
		<%@include file = "adminAdminSystem-side-header.jsp" %>
<!---------------------------------------------------------------------------->	
			<div class="content" style="background-color: #F0F0F0;">
				<div class="container-fluid">
<!---------------------------------------------------------------------------->
		            <div class="container"  style="margin-top: 20px;background-color:#FFF;">
						<c:if test="${managedUserData.account == null}">
							<c:redirect url="adminAccount" />
						</c:if>
						<c:if test="${userFullData.accountLv.lv != -1}">
							<c:redirect url="WebUserMain" />
						</c:if>
						<c:if test="${userFullData.account.length() == 0}">
							<c:redirect url="webUser/WebUserLogin" />
						</c:if>
						<form method="post">
							<fieldset>
								<legend>以下為所點選的使用者帳號：</legend>
								<input type="hidden" name="userId" id="userId" value="${managedUserData.userId}" />
								<hr />
								<label>帳號圖示：</label>
		                		<c:if test="${managedUserData.iconUrl == ''}" >
		                			<img src="<c:url value='/images/webUser/defaultIcon/ncu_scens.jpg' />" width="200" height="200" title="這是系統預設的帳號圖示">
		                		</c:if>
		                		<c:if test="${managedUserData.iconUrl != ''}" >
		                			<img src="<c:url value='${managedUserData.iconUrl}' />" width="200" height="200" title="這是您目前的帳號圖示">
		                		</c:if>
		                		<label>圖示預覽：</label>
		                		<img id="picPreview" src="#" width="200" height="200" alt="這是預覽的帳號圖示" title="這是預覽的帳號圖示">
		                		<hr />
		                		<label>圖示檔案：</label>
								<input type="hidden" name="oldIconUrl" id="oldIconUrl" value="${managedUserData.iconUrl}">
								<input type="file" name="iconUrl" id="iconUrl" data-target="iconUrl" accept="image/png, image/jpg, image/jpeg, image/gif" />
		                		<button type="button" name="uploadPic" id="uploadPic" style="font-size:18px">執行上傳 <i class="material-icons" style="font-size:18px;color:green">upload</i></button>
		                		<button type="button" name="resetDefault" id="resetDefault" style="font-size:18x">回復預設 <i class="material-icons" style="font-size:18px;color:green">refresh</i></button>
		                		<span id="picSpan"></span>
								<hr />
							</fieldset>
						</form>
						<form method="post">
							<fieldset>
								<label>帳號名稱：</label>
								<input type="hidden" name="account" id="account" value="${managedUserData.account}" />
								<c:out value="${managedUserData.account}" />
								<hr />
								<c:if test="${managedUserData.password == null}">
									<input type="hidden" name="password" id="password" value="${managedUserData.password}" onblur="checkPassword()"
										size="30" maxlength="30" placeholder="請輸入密碼，6~30個字" readonly>
								</c:if>
								<c:if test="${managedUserData.password != null}">
									<label>帳號密碼：</label>
									<input type="password" name="password" id="password" value="${managedUserData.password}" onblur="checkPassword()"
										size="30" maxlength="30" placeholder="請輸入密碼，6~30個字">
								</c:if>
								<c:if test="${managedUserData.password == null}">
									<input type="hidden" name="oldPassword" id="oldPassword" value="${managedUserData.password}">
									<button type="button" style="font-size:18px;display:none;" id="visibility_switch" onclick="changeVisibility()">顯示密碼 <i class="material-icons" style="font-size:18px;color:red">visibility</i></button>
								</c:if>
								<c:if test="${managedUserData.password != null}">
									<input type="hidden" name="oldPassword" id="oldPassword" value="${managedUserData.password}">
									<button type="button" style="font-size:18px" id="visibility_switch" onclick="changeVisibility()">顯示密碼 <i class="material-icons" style="font-size:18px;color:red">visibility</i></button>
									<span id="passwordSpan"></span>
									<hr />
								</c:if>
								<label>中文姓氏：</label>
								<input type="text" name="firstName" id="firstName" value="${managedUserData.firstName}" onblur="checkFirstName()"
									size="30" maxlength="30" placeholder="請輸入名字，1~3個中文字">
								<input type="hidden" name="oldFirstName" id="oldFirstName" value="${managedUserData.firstName}">
								<span id="firstNameSpan"></span>
								<hr />
								<label>中文名字：</label>
								<input type="text" name="lastName" id="lastName" value="${managedUserData.lastName}" onblur="checkLastName()"
									size="30" maxlength="30" placeholder="請輸入名字，1~22個中文字">
								<input type="hidden" name="oldLastName" id="oldLastName" value="${managedUserData.lastName}">
								<span id="lastNameSpan"></span>
								<hr />
								<label>稱呼方式：</label>
								<input type="text" name="nickname" id="nickname" value="${managedUserData.nickname}" onblur="checkNickname()"
									size="30" maxlength="30" placeholder="請輸入想要的稱呼">
								<input type="hidden" name="oldNickname" id="oldNickname" value="${managedUserData.nickname}">
								<span id="nicknameSpan"></span>
								<hr />
								<label>生理性別：</label>
								<c:forEach items="${genderList}" var="userGender" >
									<c:if test="${userGender.genderCode == managedUserData.gender.genderCode}" >
										<input type="radio" name="gender" value="${userGender.genderCode}" 
											class="gender" checked="checked" onblur="checkGender()" />
									</c:if>
									<c:if test="${userGender.genderCode != managedUserData.gender.genderCode}" >
										<input type="radio" name="gender" value="${userGender.genderCode}"
											class="gender" onblur="checkGender()" />
									</c:if>
									<label><c:out value="${userGender.genderText}" /></label>
								</c:forEach>
								<input type="hidden" name="oldGender" id="oldGender" value="${managedUserData.gender.genderCode}" />
								<span id="genderSpan"></span>
								<hr />
								<label>西元生日：</label>
								<input type="date" name="birth" id="birth" value="${managedUserData.birth}" 
									onblur="checkBirth()" />
								<input type="hidden" name="oldBirth" id="oldBirth" value="${managedUserData.birth}" />
								<span id="birthdaySpan"></span>
								<hr />
								<label>偏好食物：</label>
								<c:forEach items="${fervorList}" var="fervorObject" >
									<c:if test="${managedUserData.fervor.indexOf(fervorObject.fervorItem)!=-1}">
										<input type="checkbox" id="fervor" name="fervor"  
											class="fervor" value="${fervorObject.fervorCode}" onblur="checkFervor()" checked="checked" />
									</c:if>
									<c:if test="${managedUserData.fervor.indexOf(fervorObject.fervorItem)==-1}">
										<input type="checkbox" id="fervor" name="fervor" class="fervor" 
											value="${fervorObject.fervorCode}" onblur="checkFervor()" />
									</c:if>
									<label>${fervorObject.fervorItem}</label>
								</c:forEach>
								<input type="hidden" name="oldFervor" id="oldFervor" value="${managedUserData.fervor}">
								<span id="fervorSpan"></span>
								<hr />
								<label>聯絡信箱：</label>
								<input type="text" name="email" id="email" value="${managedUserData.email}" onblur="checkEmail()"
									size="30" maxlength="30" placeholder="請輸入驗證、聯絡用的E-Mail地址">
								<input type="hidden" name="oldEmail" id="oldEmail" value="${managedUserData.email}">
								<span id="emailSpan"></span>
								<hr />
								<label>聯絡電話：</label>
								<input type="text" name="phone" id="phone" value="${managedUserData.phone}" onblur="checkPhone()"
									size="40" maxlength="11" placeholder="請輸入行動電話或市內電話號碼">
								<input type="hidden" name="oldPhone" id="oldPhone" value="${managedUserData.phone}">
								<span id="phoneSpan"></span>
								<hr />
								<label>是否願意接收促銷/優惠訊息：</label>
								<c:forEach items="${willingList}" var="userWilling" >
							    	<c:if test="${userWilling.willingCode.equals(managedUserData.getEmail.willingCode)}" >
							    		<input type="radio" id="getEmail1" name="getEmail" value="${userWilling.willingCode}" 
											onblur="checkGetEmail()" checked="checked" >
							    	</c:if>
							    	<c:if test="${!userWilling.willingCode.equals(managedUserData.getEmail.willingCode)}" >
							    		<input type="radio" id="getEmail2" name="getEmail" value="${userWilling.willingCode}" 
											onblur="checkGetEmail()" >
							    	</c:if>
							    	<label><c:out value="${userWilling.willingText}"></c:out></label>
							    </c:forEach>
								<input type="hidden" name="oldGetEmail" id="oldGetEmail" value="${managedUserData.getEmail.willingCode}">
							    <span id="getEmailSpan"></span>
								<hr />
								<label>居住區域：</label>
								<select name="locationCode" id="locationCode" onblur="checkLocationCode()">
							    	<c:forEach items="${cityInfoList}" var="cityInfo">
						    			<option value="${cityInfo.cityCode}"
						    				<c:if test="${cityInfo.cityCode == managedUserData.locationInfo.cityCode}">
				                         		selected="selected"
				                         	</c:if> 
						    			>
						    				<c:out value="${cityInfo.cityName}" /> 	
						    		 	</option>
						    		</c:forEach>
							    </select>
								<input type="hidden" name="oldLocationCode" id="oldLocationCode" value="${managedUserData.locationInfo.cityCode}">
								<span id="locationCodeSpan"></span>
								<hr />
								<label>生活地點一：</label>
								<input type="text" name="addr0" id="addr0" value="${managedUserData.addr0}" onblur="checkAddr0()"
									size="65" maxlength="65" placeholder="此項為必填，請輸入完整地址方面後續服務之利用">
								<input type="hidden" name="oldAddr0" id="oldAddr0" value="${managedUserData.addr0}">
								<span id="addr0Span"></span>
								<hr />
								<label>生活地點二：</label>
								<input type="text" name="addr1" id="addr1" value="${managedUserData.addr1}" onblur="checkAddr1()"
									size="65" maxlength="65" placeholder="此項為選填，請輸入完整地址方面後續服務之利用">
								<input type="hidden" name="oldAddr1" id="oldAddr1" value="${managedUserData.addr1}">
								<span id="addr1Span"></span>
								<hr />
								<label>生活地點三：</label>
								<input type="text" name="addr2" id="addr2" value="${managedUserData.addr2}" onblur="checkAddr2()"
									size="65" maxlength="65" placeholder="此項為選填，請輸入完整地址方面後續服務之利用">
								<input type="hidden" name="oldAddr2" id="oldAddr2" value="${managedUserData.addr2}">
								<span id="addr2Span"></span>
								<hr />
								<label>所擁有的橙幣：</label>
								<c:out value="${managedUserData.zest}" />
								<hr />
								<label>帳號狀態：</label>
								<c:choose>
									<c:when test="${managedUserData.status=='active'}">已啟用</c:when>
									<c:when test="${managedUserData.status=='inactive'}">未啟用</c:when>
									<c:when test="${managedUserData.status=='quit'}">已停用</c:when>
								</c:choose>
								<input type="hidden" name="status" id="status" value="${managedUserData.status}">
								<hr />
							</fieldset>
							<div align="center">
								<button type="button" style="font-size:18px" id="updateAccount" >編輯帳號 <i class="material-icons" style="font-size:18px;color:blue">build</i></button>
								<button type="reset" style="font-size:18px" onclick="clearMessage()">重設 <i class="material-icons" style="font-size:18px;color:blue">refresh</i></button>
								<a href="adminAccount"><button type="button" style="font-size:18px" >返回上一頁 <i class="material-icons" style="font-size:18px;color:green">undo</i></button></a>
								<hr />
								<span id="operateResult"></span>
							</div>
						</form>
						<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
						<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
						<script src="<c:url value='/js/webUser/DisplayManagedUserData.js' />"></script>
						<script>
							$(document).ready(function () {
								document.getElementById("uploadPic").style = "display:none";
								document.getElementById("picPreview").style = "display:none";
								$("#iconUrl").change(function () {
		                			if (this.files && this.files[0]) {
		                				var picReader = new FileReader();
		                				document.getElementById("picPreview").style = "display:inline";
		                				picReader.onload = function (e) {
		                					$('#picPreview').attr('src', e.target.result);
		                				};
		                				picReader.readAsDataURL(this.files[0]);
		                				var pName = this.files[0].name;
		                				var oldPNameTmp = (document.getElementById("oldIconUrl").value.trim() == '') ? '' : document.getElementById("oldIconUrl").value;
		                				var oldPName = (oldPNameTmp == '') ? '' : oldPNameTmp.split("/")[oldPNameTmp.split("/").length - 1];
		                				var picSpan = document.getElementById("picSpan");
		                				var picStr = "";
		                				
		               					picStr = "圖片已設定完畢";
		               					picSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:green'>check_circle</i>" + picStr;
					            		picSpan.style.color = "black";
					            		picSpan.style.fontStyle = "normal";
					            		document.getElementById("uploadPic").style = "display:inline";
		                			}
		                		});
							});
							
							$("#uploadPic").click(function() {
		                		picUpload();
		                	});
		                	function picUpload() {
		                		let choice=confirm("是否確定要上傳指定的圖片？");
		                		if (choice == true) {
		                			/* 停用按鈕，防止連點 */
		                			document.getElementById("uploadPic").disabled = true;
		                			/* 設定計時器，定時啟用 */
		                			setTimeout(enableUploadBtn, 30000);
		                			/* 恢復按鈕的點選 */
		                			function enableUploadBtn() {
		                				document.getElementById("uploadPic").disabled = false;
									}
		                			var picForm = new FormData();
		                			var pic = $("#iconUrl")[0].files[0];
		                			picForm.append("pic", pic);
		                			
		                			picStr = "...處理中，請稍後";
		           					picSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:green'>autorenew</i>" + picStr;
				            		picSpan.style.color = "black";
				            		picSpan.style.fontStyle = "normal";
				            		
				            		$.ajax({
				            			type:"POST",
							            url:"<c:url value='/webUser/controller/WebUserAdminModifyIcon' />",
										data : picForm,
										contentType : false,
										processData : false,
										success:function(resultObj) {
											if (resultObj.resultCode == "true") {
												picStr = resultObj.resultMessage;
												/* 顯示彈窗訊息 */
												swal(picStr,"","success");
												setTimeout(function() {
													picSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:green'>check_circle</i>" + picStr;
													picSpan.style.color = "green";
													picSpan.style.fontStyle = "normal";
												},1500);
											} else {
												picStr = resultObj.resultMessage;
												/* 顯示彈窗訊息 */
												swal(picStr,"","error");
												picSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:red'>cancel</i>" + picStr;
												picSpan.style.color = "red";
												picSpan.style.fontStyle = "italic";
											}
										},
										error:function(err) {
											picStr = "發生錯誤，無法上傳";
											/* 顯示彈窗訊息 */
											swal(picStr,"","error");
											picSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:red'>cancel</i>" + picStr;
											picSpan.style.color = "red";
											picSpan.style.fontStyle = "italic";
										}
				            		});
		                		}
		                	}
		                	
		                	$("#resetDefault").click(function() {
			                	if (document.getElementById("oldIconUrl").value != "") {
				                	let choice=confirm("是否確定回復圖示設定到預設值？");
				                	if (choice == true) {
				                		/* 停用按鈕，防止連點 */
			                			document.getElementById("resetDefault").disabled = true;
			                			/* 設定計時器，定時啟用 */
			                			setTimeout(enableResetIconBtn, 30000);
			                			/* 恢復按鈕的點選 */
			                			function enableResetIconBtn() {
			                				document.getElementById("resetDefault").disabled = false;
										}
				                		picStr = "...處理中，請稍後";
			           					picSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:green'>autorenew</i>" + picStr;
					            		picSpan.style.color = "black";
					            		picSpan.style.fontStyle = "normal";
					            		
					            		$.ajax({
					            			type:"POST",
								            url:"<c:url value='/webUser/controller/WebUserAdminResetIcon' />",
								            dataType : "json",
											success:function(resultObj) {
												if (resultObj.resultCode == "true") {
													picStr = resultObj.resultMessage;
													/* 顯示彈窗訊息 */
													swal(picStr,"","success");
													setTimeout(function() {
														picSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:green'>check_circle</i>" + picStr;
														picSpan.style.color = "green";
														picSpan.style.fontStyle = "normal";
													},1500);
												} else {
													picStr = resultObj.resultMessage;
													/* 顯示彈窗訊息 */
													swal(picStr,"","error");
													picSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:red'>cancel</i>" + picStr;
													picSpan.style.color = "red";
													picSpan.style.fontStyle = "italic";
												}
											},
											error:function(err) {
												picStr = "發生錯誤，無法回復預設值";
												/* 顯示彈窗訊息 */
												swal(picStr,"","error");
												picSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:red'>cancel</i>" + picStr;
												picSpan.style.color = "red";
												picSpan.style.fontStyle = "italic";
											}
					            		});
				                	}
			                	} else {
			                		picStr = "無法回復預設值！因為已經為預設圖示";
			                		/* 顯示彈窗訊息 */
									swal(picStr,"","error");
									picSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:red'>cancel</i>" + picStr;
									picSpan.style.color = "red";
									picSpan.style.fontStyle = "italic";
			                	}
			                });
							
							function checkUpdateNickname() {
								let nickname = document.getElementById("nickname").value.replace('<', ' ').replace('>', '').trim();
								let nicknameSpan = document.getElementById("nicknameSpan");
								let nicknameStr = "處理中...，請稍後";
								let nicknameIsOk = true;
								let mode = "checkNickname";
								
								nicknameSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:green'>autorenew</i>" + nicknameStr;
			            		nicknameSpan.style.color = "black";
			            		nicknameSpan.style.fontStyle = "normal";
								
								$.ajax({
									type:"POST",
						            url:"<c:url value='/webUser/controller/UserInfoController' />",
						            data:{
						            	'register':mode,
						            	'inputNickname':nickname
						            },
						            dataType:"json",
						            success:function(resultObj) {
						            	if (resultObj.resultCode == 1) {
						            		nicknameStr = "此稱呼已有人使用！";
						            		nicknameIsOk = false;
						            	} else if (resultObj.resultCode == 0) {
						            		nicknameStr = "可使用此稱呼！";
						            		nicknameIsOk = true;
						            	} else if (resultObj.resultCode == -1) {
						            		nicknameStr = "檢查途中遭遇錯誤！";
						            		nicknameIsOk = false;
						            	}
						            	if (!nicknameIsOk) {
						            		/* 顯示彈窗訊息 */
											swal(nicknameStr,"","error");
						            		nicknameSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:red'>cancel</i>" + nicknameStr;
						            		nicknameSpan.style.color = "red";
						            		nicknameSpan.style.fontStyle = "italic";
						            	} else {
						            		nicknameSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:green'>check_circle</i>" + nicknameStr;
						            		nicknameSpan.style.color = "black";
						            		nicknameSpan.style.fontStyle = "normal";
						            	}
						            },
						            error:function(err) {
						            	nicknameStr = "發生錯誤，無法執行檢查";
						            	nicknameSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:red'>cancel</i>" + nicknameStr;
						            	nicknameSpan.style.color = "red";
						            	nicknameSpan.style.fontStyle = "italic";
						            	/* 顯示彈窗訊息 */
										swal(nicknameStr,"","error");
						            }
								});
							}
							
							function checkUpdateEmail() {
								let email = document.getElementById("email").value.replace('<', ' ').replace('>', '').trim();
								let emailSpan = document.getElementById("emailSpan");
								let emailStr = "...處理中，請稍後";
								let emailIsOk = true;
								let mode = "checkEmail";
								
								emailSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:green'>autorenew</i>" + emailStr;
			            		emailSpan.style.color = "black";
			            		emailSpan.style.fontStyle = "normal";
								
								$.ajax({
									type:"POST",
						            url:"<c:url value='/webUser/controller/UserInfoController' />",
						            data:{
						            	'register':mode,
						            	'inputEmail':email
						            },
						            dataType:"json",
						            success:function(resultObj) {
						            	if (resultObj.resultCode == 1) {
						            		emailStr = "此電子信箱已有人使用！";
						            		emailIsOk = false;
						            	} else if (resultObj.resultCode == 0) {
						            		emailStr = "可使用此電子信箱！";
						            		emailIsOk = true;
						            	} else if (resultObj.resultCode == -1) {
						            		emailStr = "檢查途中遭遇錯誤！";
						            		emailIsOk = false;
						            	}
						            	if (!emailIsOk) {
						            		/* 顯示彈窗訊息 */
											swal(emailStr,"","error");
						            		emailSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:red'>cancel</i>" + emailStr;
						            		emailSpan.style.color = "red";
						            		emailSpan.style.fontStyle = "italic";
						            	} else {
						            		emailSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:green'>check_circle</i>" + emailStr;
						            		emailSpan.style.color = "black";
						            		emailSpan.style.fontStyle = "normal";
						            	}
						            },
						            error:function(err) {
						            	emailStr = "發生錯誤，無法執行檢查";
						            	emailSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:red'>cancel</i>" + emailStr;
						            	emailSpan.style.color = "red";
						            	emailSpan.style.fontStyle = "italic";
						            	/* 顯示彈窗訊息 */
										swal(emailStr,"","error");
						            }
								});
							}
							
							function checkUpdatePhone() {
								let phone = document.getElementById("phone").value.trim();
								let phoneSpan = document.getElementById("phoneSpan");
								let phoneStr= "...處理中，請稍後";
								let phoneIsOk = true;
								let mode = "checkPhone";
								
								phoneSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:green'>autorenew</i>" + phoneStr;
			            		phoneSpan.style.color = "black";
			            		phoneSpan.style.fontStyle = "normal";
								
								$.ajax({
									type:"POST",
						            url:"<c:url value='/webUser/controller/UserInfoController' />",
						            data:{
						            	'register':mode,
						            	'inputPhone':phone
						            },
						            dataType:"json",
						            success:function(resultObj) {
						            	if (resultObj.resultCode == 1) {
						            		phoneStr = "此聯絡電話已有人使用！";
						            		phoneIsOk = false;
						            	} else if (resultObj.resultCode == 0) {
						            		phoneStr = "可使用此聯絡電話！";
						            		phoneIsOk = true;
						            	} else if (resultObj.resultCode == -1) {
						            		phoneStr = "檢查途中遭遇錯誤！";
						            		phoneIsOk = false;
						            	}
						            	if (!phoneIsOk) {
						            		/* 顯示彈窗訊息 */
											swal(phoneStr,"","error");
						            		phoneSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:red'>cancel</i>" + phoneStr;
						            		phoneSpan.style.color = "red";
						            		phoneSpan.style.fontStyle = "italic";
						            	} else {
						            		phoneSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:green'>check_circle</i>" + phoneStr;
						            		phoneSpan.style.color = "black";
						            		phoneSpan.style.fontStyle = "normal";
						            	}
						            },
						            error:function(err) {
						            	phoneStr = "發生錯誤，無法執行檢查";
						            	phoneSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:red'>cancel</i>" + phoneStr;
						            	phoneSpan.style.color = "red";
						            	phoneSpan.style.fontStyle = "italic";
						            	/* 顯示彈窗訊息 */
										swal(phoneStr,"","error");
						            }
								});
							}
							
							$("#updateAccount").click(function() {
								checkUpdate();
		                	});
		                	function checkUpdate() {
		                		if (checkForm()) {
		                			doUpdate();
		                		} else {
		                			swal("欄位檢查失敗!","","error");
		                		}	
		                	}
		                	function doUpdate() {
		                		let newPassword = document.getElementById("password").value.trim();
		                		let newFirstName = document.getElementById("firstName").value.trim();
		                		let newLastName = document.getElementById("lastName").value.trim();
		                		let newNickname = document.getElementById("nickname").value.replace('<', ' ').replace('>', '').trim();
		                		let genderObj = document.getElementsByClassName("gender");
		                		let newGender = "";
		                		for (let genderIndex = 0; genderIndex < genderObj.length; genderIndex++) {
		                			if ((genderObj[genderIndex].checked)) {
		                				newGender = genderObj[genderIndex].value
		                			}
		                		}
		                		let newBirth = document.getElementById("birth").value.trim();
		                		let fervorObj = document.getElementsByClassName("fervor");
		                		let newFervor = "";
		                		for (let fervorIndex = 0; fervorIndex < fervorObj.length; fervorIndex++) {
		                			if (newFervor != "" && fervorObj[fervorIndex].checked) {
		                				newFervor += ",";
		                			}
		                			newFervor += (fervorObj[fervorIndex].checked) ? fervorObj[fervorIndex].value : "";
		                		}
		                		let newEmail = document.getElementById("email").value.replace('<', ' ').replace('>', '').trim();
		                		let newPhone = document.getElementById("phone").value.trim();
		                		let newGetEmail =(document.getElementById("getEmail1") == null) ? "" : document.getElementById("getEmail1").value;
		                		newGetEmail = (document.getElementById("getEmail2") == null) ? "" : document.getElementById("getEmail2").value;
		                		let newLocationCode = document.getElementById("locationCode").value.trim();
		                		let newAddr0 = document.getElementById("addr0").value.replace('<', ' ').replace('>', '').trim();
		                		let newAddr1 = document.getElementById("addr1").value.replace('<', ' ').replace('>', '').trim();
		                		let newAddr2 = document.getElementById("addr2").value.replace('<', ' ').replace('>', '').trim();
		                		
		                		let updateSpan = document.getElementById("operateResult");
		                		let updateStr = "...處理中，請稍後";
								let updateIsOk = true;
								
								updateSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:green'>autorenew</i>" + updateStr;
								updateSpan.style.color = "black";
								updateSpan.style.fontStyle = "normal";
								
								$.ajax({
									type:"POST",
									url:"<c:url value='/webUser/controller/WebUserAdminModifyData' />",
									data:{
						            	'newPassword':newPassword,
						            	'newFirstName':newFirstName,
										'newLastName':newLastName,
										'newNickname':newNickname,
										'newGender':newGender,
										'newBirth':newBirth,
										'newFervor':newFervor,
										'newEmail':newEmail,
										'newPhone':newPhone,
										'newGetEmail':newGetEmail,
										'newLocationCode':newLocationCode,
										'newAddr0':newAddr0,
										'newAddr1':newAddr1,
										'newAddr2':newAddr2
						            },
						            dataType:"json",
						            success:function(resultObj) {
						            	if (resultObj.resultCode == 1) {
						            		updateStr = resultObj.resultMessage;
						            		/* 顯示彈窗訊息 */
											swal(updateStr,"","success");
											setTimeout(function() {
							            		updateSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:green'>check_circle</i>" + updateStr;
							            		updateSpan.style.color = "black";
							            		updateSpan.style.fontStyle = "normal";
											},1500);
						            	} else {
						            		updateStr = resultObj.resultMessage;
							            	updateSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:red'>cancel</i>" + updateStr;
							            	updateSpan.style.color = "red";
							            	updateSpan.style.fontStyle = "italic";
							            	/* 顯示彈窗訊息 */
											swal(updateStr,"","error");
						            	}
						            },
						            error:function(err) {
						            	updateStr = "發生錯誤，無法執行檢查";
						            	updateSpan.innerHTML = "<i class='material-icons' style='font-size:18px;color:red'>cancel</i>" + updateStr;
						            	updateSpan.style.color = "red";
						            	updateSpan.style.fontStyle = "italic";
						            	/* 顯示彈窗訊息 */
										swal(updateStr,"","error");
						            }
								});
		                	}
						</script>
		            </div>
<!-- -------------------------------------------------------------------- -->
				</div>
			</div>
<!--           		footer 				  -->
		<%@include file = "dashborad-footer.jsp" %>
    </div>
</body>
<!--   Core JS Files   -->
<!-- <script src="js/jquery.3.2.1.min.js" type="text/javascript"></script> -->
<script src="js/popper.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
<script src="js/bootstrap-switch.js"></script>
<!--  Chartist Plugin  -->
<script src="js/chartist.min.js"></script>
<!--  Notifications Plugin    -->
<script src="js/bootstrap-notify.js"></script>
<!-- Control Center for Light Bootstrap Dashboard: scripts for the example pages etc -->
<script src="js/light-bootstrap-dashboard.js?v=2.0.0 " type="text/javascript"></script>
<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<!-- <script src="js/demo.js"></script> -->
</html>