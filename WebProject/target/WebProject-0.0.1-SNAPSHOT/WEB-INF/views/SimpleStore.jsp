
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

<sql:setDataSource var="ds" dataSource="jdbc/zest" />

<%-- <c:set var="ss" value="${param.sclass}" /> --%>
<%-- <sql:query dataSource="${ds}" var="rs"> --%>
<!--          SELECT * FROM store WHERE sclass = ?  -->
<%--          <sql:param value="${ss}" /> --%>
<%-- </sql:query> --%>





<%-- <c:set var="as" value="${param.nsrch}" /> --%>
<%-- <c:if test= "${!(empty param.nsrch)}">   --%>
<%-- <c:set var="as" value="%${param.nsrch}%"/>  --%>
<%-- </c:if> --%>

<%-- <sql:query dataSource="${ds}" var="rs2"> --%>
<!--          SELECT * FROM store WHERE stname like ?  -->
<%--          <sql:param value="${as}" /> --%>
<%-- </sql:query> --%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

    <%@include file = "Link_Meta-Include.jsp" %>

<title>橙皮</title>
<style>
body {
	background-color: rgb(235, 159, 18);
}	
       *{
            margin: 0%;
            padding: 0%;
        }
       .header{
            height: 100px;
            border-bottom: 3px solid #e76f51;height: 90px;
            padding-top: 5px;
            background-color: #003049
       }
       .shopcar{
            height: 40px;
            margin: 0;
            margin-left:5px ;
       }

        .outside{
            margin:20px auto;
            height: 350px;
            width: 100%;
            margin-bottom: 10px;
            border-radius: 5px 5px 5px 5px;
            box-shadow: 5px 5px 5px 5px #646262;
            background-color: white;
             transition: 0.2s;
        }
        .outside:hover{
        	border:  solid ;
        	border-width: 0 0 5px 0; 
			border-image: linear-gradient(to right, #c0392b 0%, #f1c40f 100%);
			border-image-slice: 1;

			 transition: 0.2s;
        }
        .classimg{
         transition: 0.2s;	
        	width:80px
        }
        .classimg:hover{
         transition: 0.2s;
			width: 85px
        }
        .photo{
            float: left;
            background-color: yellow;
            border-radius: 5px 0 0 5px;
            height: 350px;
            width: 30%;
            border-right: 1px solid gray;
        }
        .textdiv{
            padding: 5px;
            
        }
        .h11{
            
            font-size: 45px;
            margin-bottom:40px ;
        }
        .postion{

        }
        .itdc{

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

</style>
</head>
<body>
		<%@include file ="Header-Include-prototype.jsp" %>
            <div class="container-fluid " style="margin-top:10px">
                <!-- <img src="images/backbar2-1.jpg"> -->
                    <form action="StoreGetNamestore" method="GET" enctype="UTF-8"  >
                      <fieldset  style="padding: 8px;margin: auto;width: 550px; background-color:rgb(126, 125, 125,0.3);border-radius: 4px;">
                        <input type ="text" id="srchid" name="nsrch" size="59"  placeholder="搜尋餐廳"
                        style="height: 36px;border-radius: 4px;line-height: 38px;border: solid 2px black;" >
                        <button type="submit"  style="background-color:#fcbf49 ;border: 1px black solid;border-radius: 4px;margin:0px
                         ;float:right;height: 36px">
                        	<img src="Images/searchbut.jpg" >  
                        </button>
                      </fieldset>
                    </form>
            	</div>
            </div>
	<div class="container" style="margin-top:10px">
	<div class="jumbotron row"
		style="padding: 25px; background-color: white;font-size: 150% ;height:170px">
		<c:url value="StoreGetClassstore" var="riceURL">
			<c:param name="sclass" value="中式" />
		</c:url>

		<div class="col-sm-2 "
			style="border-right: rgb(204, 203, 203) 1px solid;text-align: center">
			<a href="${riceURL }"><img class = "classimg"src="Images/S1.jpg"
				></a><br>中式
		</div>


		<c:url value="StoreGetClassstore" var="JPURL">
			<c:param name="sclass" value="日式" />
		</c:url>
		<div class="col-sm-2 "
			style="border-right: rgb(204, 203, 203) 1px solid;; text-align: center">
			<a href="${JPURL}"><img src="Images/S2.jpg" class = "classimg"/></a><br>日式
		</div>


		<c:url value="StoreGetClassstore" var="TEAURL">
			<c:param name="sclass" value="下午茶" />
		</c:url>
		<div class="col-sm-2 "
			style="border-right: rgb(204, 203, 203) 1px solid;; text-align: center">
			<a href="${TEAURL}"><img src="Images/S3.jpg" class = "classimg"></a><br>下午茶
		</div>

		
		<c:url value="StoreGetClassstore" var="WESTURL">
			<c:param name="sclass" value="西式" />
		</c:url>
		<div class="col-sm-2 "
			style="border-right: rgb(204, 203, 203) 1px solid;; text-align: center">
			<a href="${WESTURL}"><img src="Images/S4.jpg" class = "classimg"></a><br>西式
		</div>
		
		
		<c:url value="StoreGetClassstore" var="fastURL">
			<c:param name="sclass" value="快餐" />
		</c:url>
		<div class="col-sm-2 "
			style="border-right: rgb(204, 203, 203) 1px solid;; text-align: center">
			<a href="${fastURL}"><img src="Images/S5.jpg"
				class = "classimg"></a><br>快餐
		</div>

		<c:url value="StoreGetClassstore" var="metURL">
			<c:param name="sclass" value="燒肉" />
		</c:url>
		<div class="col-sm-2 " style="text-align: center">
			<a href="${metURL }"><img src="Images/S6.jpg"
				class = "classimg"	></a><br>燒肉
		</div>

		<!-- <div class="col-sm-4"><i class="fas fa-cloud"></i></div>
                  <div class="col-sm-4"><i class="fas fa-cloud"></i></div> -->
	</div>
	</div>
	<div class="row">
	<div class="col-sm-3 ">
	 <div class="container" style="background-color: wheat;border-radius:5px;padding:100px;border: 1px solid wheat;box-shadow: 5px 5px 5px rgb(75, 75, 75);margin-top:15px;margin-bottom:15px;margin-left:20px; ">
        <!-- 用container -->
        <form action="############################" method="post" >
            <fieldset style="width: auto;margin:1px auto;">
                <legend>進階查詢</legend>
				<br>
           		  	<input type="radio" id="d1" name="dollar" >
  					<label for="d1"><i class="fas fa-dollar-sign" style = "font-size:20px;color:green"></i></label>
  				<br>   
                   	<input type="radio" id="d2" name="dollar" >
  					<label for="d2"><i class="fas fa-dollar-sign" style = "font-size:20px;color:green"></i><i class="fas fa-dollar-sign" style = "font-size:20px;color:green"></i></label>
  				<br>
                   	<input type="radio" id="d3" name="dollar" >
  					<label for="d3"><i class="fas fa-dollar-sign" style = "font-size:20px;color:green"></i><i class="fas fa-dollar-sign" style = "font-size:20px;color:green"></i><i class="fas fa-dollar-sign" style = "font-size:20px;color:green"></i></label>
  				<br>
                   	<input type="radio" id="d4" name="dollar" >
  					<label for="d4"><i class="fas fa-dollar-sign" style = "font-size:20px;color:green"></i><i class="fas fa-dollar-sign" style = "font-size:20px;color:green"></i><i class="fas fa-dollar-sign" style = "font-size:20px;color:green"></i><i class="fas fa-dollar-sign" style = "font-size:20px;color:green"></i></label>
  				<br>
                   	<input type="radio" id="d5" name="dollar" >
  					<label for="d5"><i class="fas fa-dollar-sign" style = "font-size:20px;color:green"></i><i class="fas fa-dollar-sign" style = "font-size:20px;color:green"></i><i class="fas fa-dollar-sign" style = "font-size:20px;color:green"></i><i class="fas fa-dollar-sign" style = "font-size:20px;color:green"></i><i class="fas fa-dollar-sign" style = "font-size:20px;color:green"></i></label>
  				<br>
                <hr>
                <label>欲查詢幾顆星以上店家
                </label>
				<br>
					<input type="radio" id="star3.5" name="star" >
  					<label for="star3.5">3.5+</label>
  				<br>
  					<input type="radio" id="star4" name="star" >
  					<label for="star4">4.0+</label>
  				<br>
 
            </fieldset>
            <div style="text-align: center;">
                <input type="submit" value="查詢">
                <input type="reset" value="清除">
            </div>
        </form>
    </div>
	</div>
	<div class="col-sm-6" >
<!-- 
<form name="AddForm" action="detailStore.jsp" method="GET">
         <input type="hidden" name="todo" value="add">
         Select Book: <select name=bookID>         
         
         // <%
            // Scriptlet 1: Populate the books into the "select" control.
//           for (int i = 0; i < StoreDB.size(); ++i) {
//           	if( 
//            			StoreDB.getStname(i).equals(request.getParameter("nsrch"))){
//               out.println("<option value='" + i + "'>");
//               out.println(StoreDB.getStname(i) + " | " + StoreDB.getSclass(i)
//                       + " | " + StoreDB.getSaddress(i));
//               out.println("</option>");
//            	}
//            } 
        %> 
        
        <%
            // Scriptlet 1: Populate the books into the "select" control.
//            for (int i = 0; i < StoreDB.size(); ++i) {
//            	if(StoreDB.getSclass(i).equals(request.getParameter("sclass"))){
//               out.println("<option value='" + StoreDB.getStname(i) + "'>");
//               out.println(StoreDB.getStname(i) + " | " + StoreDB.getSclass(i)
//                       + " | " + StoreDB.getSaddress(i));
//               out.println("</option>");
//            	}
//            } 
        %> 
 
         </select>
           Enter Quantity: <input type="text" name="qty" size="10" value="1">
         <input type="submit" value="Add to Shopping Cart">
      </form>
   -->
      
      
		<div class="test1" style="margin-bottom:50px;">
			<div id="ajax"></div>
<%-- 		<c:forEach var="row" items="${Results}"> --%>

<%-- 				<c:url value="StoreGetFullstore" var="GOURL"> --%>
<%-- 				<c:param name="id" value="${row.id}" /> --%>
<%-- 				<c:param name="stname" value="${row.stname}" />				 --%>
<%-- 				</c:url> --%>
<%-- 			<a href="${GOURL}" style="text-decoration:none;color:black">   --%>
<!-- 			    <div class="outside" > -->
<%--        				 	<div class="photo"  style="background-image: url('${row.photourl}');background-size:100% 100%"> --%>

<!--       				  	</div> -->
<!-- 				        	<div class="textdiv" style="font-size: 135%"> -->
<!-- 				            <h1 class="h11" > -->
<%-- 				                ${row.stname } --%>
<!-- 				            </h1> -->
<!-- 				            <div class="postion"> -->
<%-- 				                ${row.saddress } --%>
<!-- 				            </div> -->
<!-- 				            <hr> -->
<!-- 				            <span class="itdc"> -->
<%-- 				                ${row.sclass}<br> --%>
<%-- 				                ${row.stitd}	 --%>
<!-- 				            </span> -->
<!-- 			        	</div> -->
<!-- 			    </div> -->
<!-- 			</a>  -->

<%-- 		</c:forEach> --%>
		</div>
<!-- 		----------------AJAX 大餅   START----------------------------- -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script type="text/javascript">
		var context = "";
		$(document).ready(function(){
		
			var flag = 0;
				
				$.ajax({
						
						type:"GET",
// 						url:"StoreGetClassStoreAjax/${sclass}",
						url:"StoreGetClassStoreAjax",
						data:{
							'sclass':"${sclass}",
							'stname':"${stname}",
							'limit':3,
							'offset':flag
						},
						datatype:'json',
// 						datatype:'html',

						success:function (data){
				for(var i = 0; i < data.length;i++){
					context +=
						"<a href='StoreGetFullstore/"+data[i].id+"/"+data[i].stname+"' id=a"+data[i].id+"  style='text-decoration:none;color:black'> "+ 
// 						"<a href='StoreGetFullstore'"+"id=a"+data[i].id+"  style='text-decoration:none;color:black'> "+
						    "<div class='outside' >"+
			       				 	"<div class='photo' "+" style='background-image: url("+data[i].photourl+");background-size:100% 100%' >"+		
			      				  	"</div>"+
							        	"<div class='textdiv' style='font-size: 135%'>"+
							            "<h1 class='h11' >"+
// 							                ${row.stname }
							                data[i].stname+
							            "</h1>"+
							            "<div class='postion'>"+
// 							                ${row.saddress }
							                data[i].saddress+
							            "</div>"+
							            "<hr>"+
							            "<span class='itdc'>"+
// 							                ${row.sclass}<br>
							                data[i].sclass+"<br>"+
// 							                ${row.stitd}	
							                data[i].stitd+
							            "</span>"+
						        	"</div>"+
						    "</div>"+
						"</a>" ;
// 					$("#a"+data[i].id).on("click",function(event){
						
// 						event.preventDefault();
// 						$.ajax({
// 							type:"POST",
// 							url:"StoreGetFullstore/",
// 							data:{
// 								"id":data[i].id,
// 								"stname":data[i].stname
// 							},
// 							contentType:"application/x-www-form-urlencoded",
// 							success : function(suc) {
							
// 							}
// 						});
// 					});
				
				}
						$("#ajax").html(context)
// 							console.log(data);
// 							console.log(data[0].stname);						
// 							console.log(data[1].stname);

							flag += 3;
						}
// 						error:function (err) {
// 							alert(err.Message);
// 						}
				})

				$(window).scroll(function(){
					
					if($(window).scrollTop() >= $(document).height() - $(window).height()){
						
						$.ajax({
							
							type:"GET",
							url:"StoreGetClassStoreAjax",
							data:{
								'sclass':"${sclass}",
								'stname':"${stname}",
								'limit':3,
								'offset':flag
							},
							datatype:'json',
							success:function (data){
								for(var i = 0; i < data.length;i++){
									context +=
										"<a href='StoreGetFullstore/"+data[i].id+"/"+data[i].stname+"'  style='text-decoration:none;color:black'> "+ 
										    "<div class='outside' >"+
							       				 "<div class='photo' "+" style='background-image: url("+data[i].photourl+");background-size:100% 100%' >"+
							      				  	"</div>"+
											        	"<div class='textdiv' style='font-size: 135%'>"+
											            "<h1 class='h11' >"+
//				 							                ${row.stname }
											                data[i].stname+
											            "</h1>"+
											            "<div class='postion'>"+
//				 							                ${row.saddress }
											                data[i].saddress+
											            "</div>"+
											            "<hr>"+
											            "<span class='itdc'>"+
//				 							                ${row.sclass}<br>
											                data[i].sclass+"<br>"+
//				 							                ${row.stitd}	
											                data[i].stitd+
											            "</span>"+
										        	"</div>"+
										    "</div>"+
										"</a>" ;
							}
								flag += 3;
								$("#ajax").html(context);
								
					
							}
					})
					}
				});

			});
		
		</script>
<!-- 		----------------AJAX 大餅   END----------------------------- -->
		</div>
	<div class="col-sm-3">
	</div>
	</div>
	
<!-- 		
		<div class="jumbotron">
			<span> 美食照片 </span>
		</div>
		<div class="jumbotron">美食照片 </div>
		<div class="jumbotron">美食照片</div>
		<div class="jumbotron">美食照片</div>
		<div class="jumbotron">美食照片</div>
 -->


<!-- ---------------------------------------- -->
<!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
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
        if ( $(this).scrollTop() > 500){
            $('#gotop').fadeIn();
        } else {
            $('#gotop').fadeOut();
        }
    });
});
</script>    
<%@include file ="Footer-Include.jsp" %>
<!-- -------------------------------------------------------------------------------------------- -->
<!--              <div style="background-color: #003049;border-top: 3px #e76f51 solid; color:white;bottom: 0"> -->
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