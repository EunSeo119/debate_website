<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>

<title>토요일은 마주앉아 토론하자</title>
<link rel="stylesheet" href="css/main.css">

<style type="text/css">
body {
	font-family: "Malgun Gothic";
	font-size: 0.8em;
}
</style>

</head>


<body>

	<div class="header">
		<div class="header_wrap">
			<div class="title">
				<a href="main.jsp">
				<span style="font-size: 25px; font-weight: bold; color: red;">토</span>
				<span style="font-size: 20px">요일은 </span> <span
					style="font-size: 25px; font-weight: bold; color: red;">마</span> <span
					style="font-size: 20px">주앉아 </span> <span
					style="font-size: 25px; font-weight: bold; color: red;">토</span> <span
					style="font-size: 20px">론하자</span>
					</a>
			</div>
			<div class="serch"
				style="position: relative; top: 10px; left: 132px;">
				<div class="serch_input">
					<input type="text"
						style="height: 25px; width: 300px; border-color: gray; border-width: 3px; border-style: solid;">
				</div>
				<div class="serch_button">
					<button
						style="width: 30px; height: 30px; border: 0; padding: 0; background: no-repeat; border: 0;">
						<img style="width: 30px; height: 30px;" src="image/mag.png"></img>
					</button>
				</div>
			</div>

		</div>
	</div>
	<div class="nav">
		<div class="nav_wrap">
			<ul>
				<li><a href="bbs.jsp">토론</a></li>
				<li><a href="">커뮤니티</a></li>
				<li><a href="Topic.jsp">주제 신청</a></li>
				<li><a href="chart.jsp">랭킹</a><li>
				<li><a href="competition_info.jsp">토론 대회</a><li>
				<li><a href="">토마토</a><li>
			</ul>
		</div>
	</div>

	

	<br />
	
	<div align="right"
               style="float: left; width: 10%; height: 409px; border: 2px solid orange; border-radius: 1em; position: relative; top: 0px; left: 46px; text-align: left; padding-top: 15px; padding-bottom: 10px; padding-left: 19px;">

               <span style="cursor: pointer;" class="spread1" id="spreadBtn01">카테고리</span>
               <ul id="hiddenList01" class="example01" style="display: none;">
                  <li><a href="#">정치</a></li>
                  <li><a href="#">경제</a></li>
                  <li><a href="#">과학</a></li>
                  <li><a href="#">환경</a></li>
               </ul>

               <br /> <br /> <span style="cursor: pointer;" class="spread1"
                  id="spreadBtn02">ooo</span>
               <ul id="hiddenList02" class="example01" style="display: none;">
                  <li><a href="#">...</a></li>
                  <li><a href="#">...</a></li>
                  <li><a href="#">...</a></li>
                  <li><a href="#">..</a></li>
                  <li><a href="#">..</a></li>
               </ul>

               <br /> <br /> <span style="cursor: pointer;" class="spread1"
                  id="spreadBtn03">ooo</span>
               <ul id="hiddenList03" class="example01" style="display: none;">
                  <li><a href="#">..</a></li>
                  <li><a href="#">..</a></li>
                  <li><a href="#">..</a></li>
               </ul>

               <br /> <br />
            </div>
            

            <div id="wrapper" style="float: left;
    width: 60%;
    position: relative;
    box-sizing: border-box;
    left: 100px;">

               <div class="nav_ul">

                  <p style="text-align: center;">토론 게시판</p>

               </div>

               <div class="parent10.1">

                  <hr align="center" style="border: dashed 0.5px grey;">





               </div>
               

	<!-- 게시판 -->

	<div class="container">

		<div class="row">

			<form method="post" action="writeAction.jsp">
            <table width="500" border="3" bordercolor="lightgray" align="center">

						  
   <font size="6" color="gray">글쓰기</font>
    <tr>
                 제 목
             </tr>
                <input name="board_subject" type="text" size="70" maxlength="100" value=""/>
             
        <tr>
            <td id="title">
                내 용
            </td>
            <td>
                <textarea name="board_content" cols="72" rows="20"></textarea>            
            </td>        
        </tr>


				</table>	

				<input type="submit" class="btn btn-primary pull-right" value="글쓰기" />

			</form>

		</div>



	







	<!-- 애니매이션 담당 JQUERY -->

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!-- 부트스트랩 JS  -->

	<script src="js/bootstrap.js"></script>
	
	<br />
	<br />
	<div style="float: right;
    width: 0%;
    position: relative;
    box-sizing: border-box;
    bottom: 170px;">

		<table style="height: 400px; border-color: gold; width: 250px;"
			border="orange" width="170">
			<tbody>
				<tr>
					<td style="width: 160.8px;">&nbsp;
						<div class="user_info" style="position: relative; top: -150px;">

							<%
								String userID = null;
								if (session.getAttribute("userID") != null) {
									userID = (String) session.getAttribute("userID");
							%>

							<div id="id01">

								<form class="modal-content animate" action="login2.jsp"
									method="post">



									<div class="container">
										<h2 align="center"><%=userID%>님이 로그인 되었습니다.
										</h2>
										<a href="logout.jsp">로그아웃</a>

									</div>
									<label> <span id="registerLink"> <a
											href="./register.html"> 회원가입</a>
									</span>
									</label>

								</form>
							</div>
							<%
								} else {
							%>
							<div id="id01">

								<form class="modal-content animate" action="login2.jsp"
									method="post" style="position: relative; top: 100px;">

									<div class="imgcontainer">
										<img src="./image/my_page.png" alt="unlock" class="unlock">
										<h2>로그인 해 주세요</h2>
									</div>

									<div class="container">
										<label for="userNameOrEmail"><b>사용자 이름</b></label> <input
											type="text" placeholder="이름을 입력하여 주세요" name="userName"
											required> <br /> <label for="password"><b>비밀번호</b></label>
										<input type="password" placeholder="비밀번호를 입력하여 주세요"
											name="password" required> <br />
										<button type="submit">로그인</button>
										<br />
									</div>
									<label> <span id="registerLink"> <a
											href="./register.html"> 회원가입</a>
									</span>
									</label>

								</form>
							</div>
							<%
								}
							%>



						</div>
					</td>

				</tr>

			</tbody>
		</table>


	</div>
	</div>

</body>
</html>