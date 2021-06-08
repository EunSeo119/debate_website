<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.8.3.min.js"></script>

<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		//page loads...
		$(".tab_content").hide();
		$("ul.tabs li:first").addClass("active").show();
		$(".tab_content:first").show();
		//Click Event
		$("ul.tabs li").click(function() {
			$("ul.tabs li").removeClass("active");
			$(this).addClass("active");
			$(".tab_content").hide();
			var activeTab = $(this).find("a").attr("href");
			$(activeTab).fadeIn();
			return false;
		});
	});
</script>

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
				<li><a href="community.jsp">커뮤니티</a></li>
				<li><a href="Topic.jsp">주제 신청</a></li>
				<li><a href="chart.jsp">랭킹</a><li>
				<li><a href="competition_info.jsp">토론 대회</a><li>
				<li><a href="">토마토</a><li>
			</ul>
		</div>
	</div>

	<br />
	<div class="main_content">
	<div class = "content_wrap" style="margin: 0 auto; float:left;">
	<div class="hot_content">
	<ul>

	</ul>
	</div>

	<div class ="guide">
	<p> 사용 방법 </p>
	<p>1. 회원가입을 통해 로그인을합니다.</p>
	<p>2. 홈 위쪽메뉴를 통해 토론을 진행 할 수 있습니다.</p>
	<p>3. 토론탭을 누르시면 화면 왼쪽에 토론 정렬메뉴를 통해 토론주제를 쉽게 찾을 수 있습니다.</p>
	<p>4. 진행하고있는 토론대회에 참여를 할 수 있습니다.</p>
	<p>5. 토론진행을 열심히하면 토론랭킹에 등재됩니다.</p>
	<p>--------------------------메뉴설명--------------------------</p>
	<p>토론 : 현재 진행되고있는 토론에 참여하거나 토론글을 직접 작성할 수 있습니다.</p>
	<p>커뮤니티 : 유저들이 자유롭게 의견을 나눌 수 있는 곳 입니다.</p>
	<p>주제신청 : 유저들이 토론하고싶은 주제가 토론을 하기에 적합한지 의견을 나눌 수 있는 곳 입니다.</p>
	<p>랭킹 : 유저들의 토론랭킹을 볼 수 있는 곳입니다.</p>
	<p>토론대회 : 현재 진행하고있는 토론 대회를 알려줍니다.</p>

	</div>
	</div>
	<br />
	<br />
	<div style="width: 20%; float: right; box-sizing: border-box; ">

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
											type="text" style="margin-top: 5px" placeholder="이름" name="userName"
											required> <br /> <label for="password" style="margin-top: 10px"><b>비밀번호</b></label>
										<input type="password" style="margin-top: 5px" placeholder="비밀번호"
											name="password" required> <br />
										<div style="display: flex; margin-left: 0px">
										<label style="margin-top: 10px; margin-right: 65px"> <span id="registerLink"> <a href="./register.html"> 회원가입</a></span></label>
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