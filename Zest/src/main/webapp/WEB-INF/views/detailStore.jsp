<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html;charset=UTF-8");
%>

<%-- <sql:setDataSource var="ds" dataSource="jdbc/zest" /> --%>

<c:set var="ss" value="${param.stname}"/>
<c:if test="${!(empty stname)}">
  <c:set var="ss" value="${stname}"/>
</c:if>

<%-- <sql:query dataSource="${ds}" var="rs"> --%>
<!--          SELECT * FROM store WHERE stname = ?  -->
<%--          <sql:param value="${ss}" /> --%>
<%-- </sql:query> --%>


<c:forEach var="row" items="${Results}">
	<c:set var = "id" value = "${row.id}"/>
	<c:set var = "stname1"  value = "${row.stname}"/>
	<c:set var = "sclass" value = "${row.sclass}"/>
	<c:set var = "saddress" value = "${row.saddress}"/>
	<c:set var = "stitd" value = "${row.stitd }"/>
	<c:set var = "stitddt" value = "${row.stitddt }"/>
	<c:set var = "tel" value = "${row.tel }"/>
	<c:set var = "bannerurl" value = "${row.bannerurl }"/>
	<c:if test = "${userFullData.account != null}" >
		<c:set var = "userId" value = "${row.webUserData.userId}"/>
	</c:if>
</c:forEach>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
     <link rel='stylesheet' href='${pageContext.request.contextPath}/css/ProductCard.css'  type="text/css" />
     <link rel='stylesheet' href='${pageContext.request.contextPath}/css/test.css'  type="text/css" />
    <%@include file = "Link_Meta-Include.jsp" %>
<!--     <link rel="stylesheet" -->
    <title>橙皮  </title>
    <style>
        body{
         background-color: 		rgb(235, 159, 18);
        
        
       }

       .header{
            height: 100px;
            border-bottom: 3px solid #e76f51;height: 90px;
            padding-top: 5px;
            background-color: #003049
       }
       .photo{
           padding: 0%;
           background-color: yellow;
           background: url("Images/backbar2-1.jpg"); 
           background-repeat: no-repeat;
           height: 700px;
           padding-top: 220px;
           background-size:100%
       }
       .shopcar{
            height: 40px;
            margin: 0;
            margin-left:5px ;
       }

#gotop {
    position:fixed;
    z-index:90;
    right:30px;
    bottom:31px;
    display:none;
    width:50px;
    height:50px;
    color:#fff;
    background:#ddbe56;
    line-height:50px;
    border-radius:50%;
    transition:all 1.5s;
    text-align: center;
    box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16), 0 2px 10px 0 rgba(0,0,0,0.12);
}
#gotop :hover{
    background:#0099CC;
}

.search-area {
  position: fixed;
  left: 0;
  top: 0;
  z-index: 5555;
  background-color: #051922;
  width: 100%;
  height: 100%;
  text-align: center;
}

span.close-btn {
  position: absolute;
  right: 0%;
  color: #fff;
  top: 5%;
  cursor: pointer;
}

.search-area {
  height: 100%;
}

.search-area div {
  height: 100%;
}

.search-bar {
  height: 100%;
  display: table;
  width: 100%;
}

a.mobile-show {
  display: none;
}

.search-area .search-bar div.search-bar-tablecell {
  display: table-cell;
  vertical-align: middle;
  height: auto;
}

.search-bar-tablecell input {
  border: none;
  padding: 15px;
  width: 60%;
  background-color: transparent;
  border-bottom: 1px solid #F28123;
  display: block;
  margin: 0 auto;
  text-align: center;
  font-size: 50px;
  font-weight: 700;
  margin-bottom: 40px;
  color: #fff;
}

.search-bar-tablecell button[type=submit] {
  border: none;
  background-color: #F28123;
  padding: 15px 30px;
  cursor: pointer;
  display: inline-block;
  border-radius: 50px;
  font-weight: 700;
}

.search-bar-tablecell input::-webkit-input-placeholder {
  color: #fff;
}

.search-bar-tablecell input:-ms-input-placeholder {
  color: #fff;
}

.search-bar-tablecell input::-ms-input-placeholder {
  color: #fff;
}

.search-bar-tablecell input::placeholder {
  color: #fff;
}

.search-bar-tablecell button[type=submit] i {
  margin-left: 5px;
}

.search-area {
  visibility: hidden;
  opacity: 0;
  -webkit-transition: 0.3s;
  -o-transition: 0.3s;
  transition: 0.3s;
}

.search-area.search-active {
  visibility: visible;
  opacity: 1;
  z-index: 999;
}

.search-bar-tablecell h3 {
  color: #fff;
  margin-bottom: 30px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 7px;
}
    </style>
</head>
<body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!--PreLoader-->
    <div class="loader">
        <div class="loader-inner">
            <div class="circle"></div>
        </div>
    </div>
    <script>
    jQuery(window).on("load",function(){
        jQuery(".loader").fadeOut(1000);
    });
    
	$(document).ready(function(){
		$("#lazyload").hide();
		
         // search form
        $(".search-bar-icon").on("click", function(){
            $(".search-area").addClass("search-active");
        });

        $(".close-btn").on("click", function() {
            $(".search-area").removeClass("search-active");
        });		
	});
    </script>
    <!--PreLoader Ends-->
    
    <%@include file = "Header-Include.jsp" %>

<!--             <div class="container-fluid  header" > -->
<!--               <div class="container" > -->
<!--               <a href="Index1.jsp"  style="float: left;font-size:37px; text-decoration:none;color:orange"><img src="Images/LOGO1-removebg-preview.png" style="height: 70px;"></a> -->
<!--               <p style="text-align: right;font-family: 'Ubuntu', sans-serif; color: #eae2b7; font-weight: 650;"><br>登入 | 註冊  |<img src="Images/PLZPLZ-removebg-preview.png" class="shopcar"> -->
<!--             </p> -->
<!--               </div> -->
<!--             </div> -->

<!-- search area -->
		<div class="search-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<span class="close-btn"><i class="fas fa-window-close"></i></span>
						<div class="search-bar">
							<div class="search-bar-tablecell">
							
								<form action="<c:url value='/StoreGetNamestore'/>" method="GET" enctype="UTF-8"  >
									<h3>搜尋商家名稱:</h3>
									<input type="text" name="nsrch" placeholder="搜尋商家">
									<button type="submit">搜尋 <i class="fas fa-search"></i></button>
							    </form>								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<!-- end search arewa -->
<!-- -------------------------------------------------------------- -->
            <div class="container-fluid photo" style="background-image: url('${pageContext.request.contextPath}/${bannerurl}');background-size:100% 100%">
            </div>
            <c:if test="${userFullData.userId == userId && userId != null}">
<%--             	<%if(true){ %> --%>
			<c:url value="/Update" var="EDITURL">
<%-- 			<c:param name="stname" value="${stname1}" /> --%>
			<c:param name="id" value="${id}" />	
			</c:url>
			<a href="${EDITURL}">編輯</a>
			<span>|</span>
			<c:url value="/Insert" var="CEATEURL">
			</c:url> 
			<a href="${CEATEURL}">新增</a>
			<span>|</span>
<%-- 		<c:url value = '/DeleteStore'/> --%>
			<form action="<c:url value = '/DeleteStore'/>" method="post" style="display:inline">
				<input type="hidden" name="id" value="${id}">
				<input type="hidden" name="stname" value="${stname1}">
				<input type="submit" value="刪除" style="margin:0;padding:0;border:none;outline:none;background-color: rgb(235, 159, 18);color:rgb(38, 102, 240)">
			</form>
			<span>|</span>
		<c:url value="/UpdatePhoto" var="photoURL">
		<c:param name="stname" value="${stname1}"></c:param>
		<c:param name="id" value="${id}"></c:param>
		<c:param name="photo" value="photo"></c:param>
		</c:url>
			<a href="${photoURL}">修改店家 封面的照片</a>
			<span>|</span>
		<c:url value="/UpdateBanner" var="bannerURL">
		<c:param name="stname" value="${stname1}"></c:param>
		<c:param name="id" value="${id}"/>
		<c:param name="banner" value="banner"></c:param>
		</c:url>
			<a href="${bannerURL}">修改店家banner</a>
			
			<span>|</span>
<%-- 			<c:url value="/InsertProduct"/> --%>
			<form action="${pageContext.request.contextPath}/InsertProduct" method="GET" style="display:inline">
				<input type="hidden" name="id" value="${id}">
				<input type="hidden" name="stname" value="${stname1}">
				<input type="submit" value="新增商品" style="margin:0;padding:0;border:none;outline:none;background-color: rgb(235, 159, 18);color:rgb(38, 102, 240)">
			</form>
			
<!-- 			<span>|</span> -->
<!-- 			<form action="#" method="post" style="display:inline"> -->
<%-- 				<input type="hidden" name="id" value="${id}"> --%>
<%-- 				<input type="hidden" name="stname" value="${stname1}"> --%>
<!-- 				<input type="submit" value="修改商品" style="margin:0;padding:0;border:none;outline:none;background-color: rgb(235, 159, 18);color:rgb(38, 102, 240)"> -->
<!-- 			</form> -->
			
<!-- 			<span>|</span> -->
<!-- 			<form action="#" method="post" style="display:inline"> -->
<%-- 				<input type="hidden" name="id" value="${id}"> --%>
<%-- 				<input type="hidden" name="stname" value="${stname1}"> --%>
<!-- 				<input type="submit" value="刪除商品" style="margin:0;padding:0;border:none;outline:none;background-color: rgb(235, 159, 18);color:rgb(38, 102, 240)"> -->
<!-- 			</form> -->
<%-- 	<%} %> --%>
		</c:if>
	<br>
	
    <div class="container" style="background-color:white; height: 250px;margin-top: 20px;border-radius: 5px 5px 5px 5px; margin-bottom:5px
    ;padding-top : 30px ">
        
<%--         <h1 style="margin-bottom: 100px" ><%=request.getParameter("stname") %></h1> --%>
        <h1 style="margin-bottom: 100px" >${stname1}</h1>
        <hr>
        <span style="font-size: 140%">地點:<c:out value = "${saddress}"></c:out></span>
    </div>
    
	<div class="container" style="background-color:white; height: auto;margin-top: 20px;border-radius: 5px 5px 5px 5px; margin-bottom:5px;padding:5px 10px;padding-left:15px">
		<a href="<c:url value='/booking/${stname1}'/> ">	
			<span style="font-size: 140%">餐廳服務</span>
		</a>
	</div>
	
	<div class="container" style="background-color:white; height: auto;margin-top: 20px;border-radius: 5px 5px 5px 5px; margin-bottom:5px;padding:5px 10px">
		<div style="font-size: 140%">
            <span id="sp1" class="divcato" style="color:orange;text-decoration:underline;">美食分享</span>
            <span id="sp2" class="divcato">熱門餐點</span>
            <span id="sp3" class="divcato">店家餐點</span>    
			<span id="sp4" class="divcato">簡介</span>
        </div>
        <hr>
        <div id="div1" class="ddiv">
            <span style="font-size: 140%">
            	<c:if test="${userFullData.account != null}">
	            	<div class="box1" style="text-align:center; margin:auto " >
	            		<div style="text-align: right;">
							<i class="fas fa-address-book" style="font-size: 25px; color: yellow"></i> 
							<a href="${pageContext.request.contextPath}/orange/ShowComment">查詢留言 </a>
						</div>
			        </div>
		        </c:if>
		        <br>
			    <div class="box2" style="text-align:center ;margin: auto;">
			       <form id="form1" method="get" action="<c:url value='/pack'/>">
			       		<fieldset>
			       			<legend>留言</legend>
			       			<input type="hidden" name="storeId" value="${id}">
			       			<div class="st1">
						       <label class="t1" for="name">名字:</label>
						       <input readonly type="text" id="name" name="name" value="${userFullData.nickname}"><br>
						    </div>
						    <div class="st1">
						        <label for="star" class="t1"></label>
						        <input type="hidden" id="star" name="star" ><br>
						    </div>
						    
					 <div class="d2">
			            <span>評價:  </span>
			            <img id="img1" class="i" src="<c:url value='/star/s1.png'/>" height="25px" width="25px"/>
			            <img id="img2" class="i" src="<c:url value='/star/s1.png'/>" height="25px" width="25px"/>
			            <img id="img3" class="i" src="<c:url value='/star/s1.png'/>" height="25px" width="25px"/>
			            <img id="img4" class="i" src="<c:url value='/star/s1.png'/>" height="25px" width="25px"/>
			            <img id="img5" class="i" src="<c:url value='/star/s1.png'/>" height="25px" width="25px"/>
			            <br>
			            <label id = "startPcs"></label>
			        </div>
						    <div class="st1">
							    <label class="t1" for="pwd1">留言:</label>
							    <textarea name="comment" id="comment" cols="33" rows="5" ></textarea><br>
							</div>
							<div class="sub">
						        <input type="button" name="submit" onclick="doInsert();" value="傳送"  >
						        <input type="reset" value="清除"> 
						    </div>
			       		</fieldset>
			       </form>
			    </div>
			    <br />
			    <script src="js/jquery-3.5.1.min.js"></script>
			    <script >
			    	$(".i").mousedown(function() {
			    		let starts = $(this).attr("id").split("img")[1];
			    		$("#star").val(starts);
			    	});
			    	
			    	$(".i").mouseenter(function() {
			    		$(this).attr("src","<c:url value='/star/s3.png'/>");
			    		$(this).prevAll().attr("src","<c:url value='/star/s3.png'/>");
			    		$(this).nextAll().attr("src","<c:url value='/star/s1.png'/>");
			    		let starts = $(this).attr("id").split("img")[1];
			    	});
			    </script>
            </span>
            <table id="detail" border="1" class="tb1 container">
            	<thead>
            		<tr>
            			<th>名字</th>
			    		<th>日期</th>
			    		<th>評分</th>
			    		<th>內容</th>
            		</tr>
            	</thead>
            	<tbody>
            		<c:forEach var="row" items="${Comments}">
            			<tr>
				    		<td>${row.name} </td>
				    		<td>${row.date}</td>
				    		<td>${row.star}</td>
				    		<td>${row.context}</td>
				    	</tr>
            		</c:forEach>
            	</tbody>
            </table>
          </div>
          
        <div id="div2" style="display:none;" class="ddiv">
            <span style="font-size: 140%"> hello</span>
        </div>
        <div id="div3" style="display:none;" class="ddiv">
<!--              <span style="font-size: 140%">ho </span> -->
			<div class="row"  style="padding:10px">
					<c:forEach var="row1" items="${Products}">
						<div class="col-sm-4">
<!-- 					       style="background: url('Images/LOGO1-removebg-preview.png')" -->
								    <div class="card" style="background:#f28633;">
								    <c:if test="${row1.product_picture != null}">
								    	<div class="imgBx">
				             				<img src="${pageContext.request.contextPath}/123/${row1.product_picture}" style="border-radius: 7 px;"/>
				             			</div>	
				             		</c:if>
				             		<c:if test="${row1.product_picture == null }">
								        <div class="imgBx" >
				    	         			<img src="${pageContext.request.contextPath}/Images/LOGO1-removebg-preview.png" style="border-radius: 7 px;"/>
								        </div>
				             		</c:if>
								        <div class="contentBx">
								            <h3>${row1.product_name} </h3>
								            <h2 class="price">$${row1.product_price}</h2>
								            <a href="#" class="buy">Buy Now</a>
								        </div>
								    </div>
<%-- 				             		${row1.product_name}  --%>
<%-- 				             		${row1.product_price} --%>
<%-- 				             		${row1.product_quantity} --%>
<%-- 				             		<c:if test="${row1.product_picture != null}"> --%>
<%-- 				             			<img src="${row1.product_picture}" style="width:50px;height:50px"/>	 --%>
<%-- 				             		</c:if> --%>
<%-- 				             		<c:url value='/updateProductpage'/> --%>

							<c:if test="${userFullData.userId == userId && userId != null}">
							<form action="<c:url value='/updateProductpage'/>" method="post" style="display:inline">
								<input type="hidden" name="id" value="${id}">
								<input type="hidden" name="productid" value="${row1.product_id}">
								<input type="submit" value="修改商品" style="margin:0;padding:0;border:none;outline:none;color:rgb(38, 102, 240)">
							</form>
							
							<span>|</span>
<%-- 							<c:url value='/deleteProductpage'/> --%>
							<form action="<c:url value='/deleteProductpage'/>" method="post" style="display:inline">
								<input type="hidden" name="id" value="${id}">
								<input type="hidden" name="productid" value="${row1.product_id}">
								<input type="submit" value="刪除商品" style="margin:0;padding:0;border:none;outline:none;color:rgb(38, 102, 240)">
							</form>
						</c:if>
				             		<br>
			             </div>
		            </c:forEach>
			</div>
        </div>
        <div id="div4" style="display:none;" class="ddiv">
        	 <span style="font-size: 140%"><c:out value = "${stitddt }"></c:out></span>
        </div>
    </div>
        <script>
        function doInsert(){
			var storeId = $('input[name="storeId"]').val();
			var comment = $('textarea[name="comment"]').val();
			var name = $('input[name="name"]').val();
			var star = $("#star").val();
			var map = {};
			map['storeId'] = storeId;
			map['comment'] = comment;
			map['name'] = name;
			map['star'] = star;
			map['photo'] = '';
        	$.ajax({
        		  url:'<c:url value="/insertboard"/>',
        		  type:'POST',
        		  data:map,
        		  success:function(res){
        				console.log(res);
        				if(typeof res.boardBean !== 'undefined'){
        					var tr = $('<tr>');
        					tr.append($('<td>').text(res.boardBean.name));
        					tr.append($('<td>').text(new Date(res.boardBean.date).toLocaleString()));
        					tr.append($('<td>').text(res.boardBean.star));
        					tr.append($('<td>').text(res.boardBean.context));
        					$('#detail').find('tbody').append(tr);
            				alert('新增成功');
            				$('#name').val("");
            				$('#comment').val("");
            				$('.i').attr("src","<c:url value='/star/s1.png'/>")
        				}else{
            				alert('新增異常');
        				}
        	      },error:function(err){
        				console.log(err);
        				alert('新增失敗');
        		  }
        		});
        }
        $("#sp1").click(function(){
            $(".ddiv").css("display","none")
            $("#div1").css("display","inline")
        })

        $("#sp2").click(function(){
            $(".ddiv").css("display","none")
            $("#div2").css("display","inline")
        })
        $("#sp3").click(function(){
            $(".ddiv").css("display","none")
            $("#div3").css("display","inline")
        })
        $("#sp4").click(function(){
            $(".ddiv").css("display","none")
            $("#div4").css("display","inline")
        })
        
        $(".divcato").click(function(){
            $(".divcato").css("color","black")
            $(".divcato").css("font-weight","normal")
            $(".divcato").css("text-decoration","none")
            $(this).css("color","orange")
            $(this).css("font-weight","bolder")
            $(this).css("text-decoration","underline")
        })
         </script>
         
   	<div class="container" style="background-color:white; height: auto;margin-top: 20px;border-radius: 5px 5px 5px 5px; margin-bottom:20px;padding:5px 10px;padding-left:15px;">
		<div style="style="font-size: 140%"">餐廳資訊</div>
		<h2 style="color:gray;margin-bottom:10px;margin-top:10px"><c:out value="${stname1}"></c:out></h2>
		<hr>
		<div >
			<span style="font-size: 140%">電話:<c:out value="${tel }"></c:out></span>
		</div>
		<div>
			<span style="font-size: 140%">地址:<c:out value="${saddress }"></c:out></span>
		</div>
	</div>

<!-- ---------------------------------------- -->
<a href="https://www.blogger.com/blogger.g?blogID=2031514508322140995#" id="gotop">
   <i class="fas fa-chevron-up"></i>
</a>
<script type="text/javascript">
$(function() {
    /* 按下GoTop按鈕時的事件 */
    $('#gotop').click(function(){
        $('html,body').animate({ scrollTop: 0 }, 'slow');   /* 返回到最頂上 */
        return false;
    });
    
    /* 偵測卷軸滑動時，往下滑超過400px就讓GoTop按鈕出現 */
    $(window).scroll(function() {
        if ( $(this).scrollTop() > 700){
            $('#gotop').fadeIn();
        } else {
            $('#gotop').fadeOut();
        }
    });
});
</script>   
<!-- -------------------------------------------------------------------- -->
    <%@include file = "Footer-Include.jsp" %>

<!--              <div style="background-color: #003049;border-top: 3px #e76f51 solid; color:white"> -->
<!--                 Footer -->
<!--                 <footer class="page-footer font-small mdb-color lighten-3 pt-4"> -->
                
<!--                   Footer Links -->
<!--                   <div class="container text-center text-md-left"> -->
                
<!--                     Grid row -->
<!--                     <div class="row"> -->
                
<!--                       Grid column -->
<!--                       <div class="col-md-4 col-lg-3 mr-auto my-md-4 my-0 mt-4 mb-1"> -->
                
<!--                         Content -->
<!--                         <h5 class="font-weight-bold text-uppercase mb-4">More Content</h5> -->
<!--                         <p>商務合作</p> -->
<!--                         <p>	餐飲代理商招募<br> -->
<!--                         	商業企劃<br> -->
<!--                         	申請掃碼點餐<br> -->
<!--                         	美國收單代理商招募<br> -->
<!--                         	美國收銀代理商招募<br> -->
<!--                         	免費使用美國排隊<br></p> -->
                
<!--                       </div> -->
<!--                       Grid column -->
                
<!--                       <hr class="clearfix w-100 d-md-none"> -->
                
<!--                       Grid column -->
<!--                       <div class="col-md-2 col-lg-2 mx-auto my-md-4 my-0 mt-4 mb-1"> -->
                
<!--                         Links -->
<!--                         <h5 class="font-weight-bold text-uppercase mb-4">ABOUT</h5> -->
                
<!--                         <ul class="list-unstyled"> -->
<!--                           <li> -->
<!--                             <p> -->
<!--                               <a href="#!">計畫</a> -->
<!--                             </p> -->
<!--                           </li> -->
<!--                           <li> -->
<!--                             <p> -->
<!--                               <a href="#!">關於我們</a> -->
<!--                             </p> -->
<!--                           </li> -->
<!--                           <li> -->
<!--                             <p> -->
<!--                               <a href="#!">Facebook</a> -->
<!--                             </p> -->
<!--                           </li> -->
<!--                           <li> -->
<!--                             <p> -->
<!--                               <a href="#!">AWARDS</a> -->
<!--                             </p> -->
<!--                           </li> -->
<!--                         </ul> -->
                
<!--                       </div> -->
<!--                       Grid column -->
                
<!--                       <hr class="clearfix w-100 d-md-none"> -->
                
<!--                       Grid column -->
<!--                       <div class="col-md-4 col-lg-3 mx-auto my-md-4 my-0 mt-4 mb-1"> -->
                
<!--                         Contact details -->
<!--                         <h5 class="font-weight-bold text-uppercase mb-4">Address</h5> -->
                
<!--                         <ul class="list-unstyled"> -->
<!--                           <li> -->
<!--                             <p> -->
<!--                               <i class="fas fa-home mr-3"></i> 四川 中壢 </p> -->
<!--                           </li> -->
<!--                           <li> -->
<!--                             <p> -->
<!--                               <i class="fas fa-envelope mr-3"></i> zestinfo@google.com</p> -->
<!--                           </li> -->
<!--                           <li> -->
<!--                             <p> -->
<!--                               <i class="fas fa-phone mr-3"></i> + 02 453 245 88</p> -->
<!--                           </li> -->
<!--                           <li> -->
<!--                             <p> -->
<!--                               <i class="fas fa-print mr-3"></i> + 02 453 249 89</p> -->
<!--                           </li> -->
<!--                         </ul> -->
                
<!--                       </div> -->
<!--                       Grid column -->
<!--                       <hr class="clearfix w-100 d-md-none"> -->
<!--                       Grid column -->
                
<!--                     </div> -->
<!--                     Grid row -->
                
<!--                   </div> -->
<!--                   Footer Links -->
                
<!--                   Copyright -->
<!--                   <div class="footer-copyright text-center py-3">© 2020 Copyright: -->
<!--                     <a > 橙皮美食平台</a> -->
<!--                   </div> -->
<!--                   Copyright -->
                
<!--                 </footer> -->
<!--                 Footer -->
<!--                     </div> -->
        
</body>
</html>