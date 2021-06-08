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
	overflow: hidden;
}
</style>

</head>


<body>

	<div class="header">
		<div class="header_wrap">
			<div class="title">
				<a href="main.jsp"> <span
					style="font-size: 25px; font-weight: bold; color: red;">토</span> <span
					style="font-size: 20px">요일은 </span> <span
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
				<li><a href="community.jsp">커뮤니티</a></li>
				<li><a href="Topic.jsp">주제 신청</a></li>
				<li><a href="chart.jsp">랭킹</a>
				<li>
				<li><a href="competition_info.jsp">토론 대회</a>
				<li>
				<li><a href="">토마토</a>
				<li>
			</ul>
		</div>
	</div>



	<br />



	<div id="wrapper"
		style="float: left; width: 60%; position: relative; box-sizing: border-box; left: 105px; margin-left: 11%">

		<div class="nav_ul">

			<p style="text-align: center;">토론 주제 신청</p>

		</div>

		<div class="parent10.1">

			<hr align="center" style="border: dashed 0.5px grey;">

		</div>


		<div class="container">

			<div class="row">

				<form method="post" action="writeAction2.jsp">
					<table width="60%" border="3" bordercolor="lightgray"
						align="center">

						<font size="6" color="gray">글쓰기</font>
						<tr>
							<td width="10%">카테고리</td>
							<td><select id="select" class="select" name="select1"
								data-attribute_name="" data-show_option_none="yes"
								onchange="change();" style="margin: 0px; width: 100%;">
									<option value="0">옵션을 선택하세요</option>
									<option value="1" class="attached enabled">정치</option>
									<option value="2" class="attached enabled">경제</option>
									<option value="3" class="attached enabled">과학</option>
									<option value="4" class="attached enabled">환경</option>

							</select></td>
						</tr>

						<tr>
							<td>제 목</td>
							<td><input type="text" class="form-control"
									placeholder="신청하고자 하는 주제의 제목을 입력해주세요" name="bbsTitle" maxlength="50" style="margin: 0px; width: 99%;"/></td>
						</tr>

						<tr>
							<td id="title">내 용</td>
							<td><textarea class="form-control" placeholder="신청하고자 하는 주제의 내용을 입력해주세요"
										name="bbsContent" maxlength="2048"
										style="height: 250px; margin: 0px; width: 99%;"></textarea></textarea>
							</td>
						</tr>


					</table>
					<div style="text-align: center;">
						<input type="submit" class="btn btn-primary pull-right"
							style="margin: 20px auto;" value="글쓰기" />
					</div>
				</form>

			</div>
		</div>





		<!-- 애니매이션 담당 JQUERY -->

		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

		<!-- 부트스트랩 JS  -->

		<script src="js/bootstrap.js"></script>

		<br /> <br />
		<div
			style="float: right; width: 0%; position: relative; box-sizing: border-box; bottom: 453px; left: 49px">

			<table style="height: 400px; border-color: gray; width: 250px;"
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
												type="text" style="margin-top: 5px" placeholder="이름"
												name="userName" required> <br /> <label
												for="password" style="margin-top: 10px"><b>비밀번호</b></label>
											<input type="password" style="margin-top: 5px"
												placeholder="비밀번호" name="password" required> <br />
											<div style="display: flex; margin-left: 0px">
												<label style="margin-top: 10px; margin-right: 65px">
													<span id="registerLink"> <a href="./register.html">
															회원가입</a></span>
												</label>
												<button type="submit" style="height: auto; margin-top: 10px">로그인</button>
											</div>
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