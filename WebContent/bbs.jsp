<%@page import="javax.security.auth.callback.ConfirmationCallback"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="bbs.BbsDAO"%>

<%@ page import="bbs.Bbs"%>

<%@ page import="java.util.ArrayList"%>
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
		/*왼쪽메뉴만들기*/
		$('.more').click(function() {
			if ($('.more').hasClass('more')) {
				$('.more').addClass('close').removeClass('more');
				$('.board').css('visibility', 'visible');
			} else if ($('.close').hasClass('close')) {
				$('.close').addClass('more').removeClass('close');
				$('.board').css('visibility', 'hidden');
			}
		});
		$('#spreadBtn01').click(function() {
			if ($("#hiddenList01").is(":visible")) {
				$("#spreadBtn01").toggleClass("spread1 spread2");
				$("#hiddenList01").slideUp();
			} else {
				$("#spreadBtn01").toggleClass("spread2 spread1");
				$("#hiddenList01").slideDown();
			}
		});
		$('#spreadBtn02').click(function() {
			if ($("#hiddenList02").is(":visible")) {
				$("#spreadBtn02").toggleClass("spread1 spread2");
				$("#hiddenList02").slideUp();
			} else {
				$("#spreadBtn02").toggleClass("spread2 spread1");
				$("#hiddenList02").slideDown();
			}
		});
		$('#spreadBtn03').click(function() {
			if ($("#hiddenList03").is(":visible")) {
				$("#spreadBtn03").toggleClass("spread1 spread2");
				$("#hiddenList03").slideUp();
			} else {
				$("#spreadBtn03").toggleClass("spread2 spread1");
				$("#hiddenList03").slideDown();
			}
		});
	});
</script>

</head>


<body>

	<%
		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1; //기본 페이지 넘버
		//페이지넘버값이 있을때
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>

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

	<div align="right"
		style="float: left; width: 10%; height: 409px; border: 2px solid gray; border-radius: 1em; position: relative; top: 0px; left: 46px; text-align: left; padding-top: 15px; padding-bottom: 10px; padding-left: 19px;">

		<span style="cursor: pointer;" class="spread1" id="spreadBtn01">카테고리</span>
		<ul id="hiddenList01" class="example01" style="display: none;">
			<li><a href="#">정치</a></li>
			<li><a href="#">경제</a></li>
			<li><a href="#">과학</a></li>
			<li><a href="#">환경</a></li>
		</ul>
	</div>


	<div id="wrapper"
		style="float: left; width: 60%; position: relative; box-sizing: border-box; left: 100px;">

		<div class="nav_ul">

			<p style="text-align: center;">토론 게시판</p>

		</div>

		<div class="parent10.1">

			<hr align="center" style="border: dashed 0.5px grey;">



		</div>


		<!-- 게시판 -->

		<div class="container">
				<!-- 회원만넘어가도록 -->

				<%
					//if logined userID라는 변수에 해당 아이디가 담기고 if not null
					if (session.getAttribute("userID") != null) {
				%>

				<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>

				<%
					} else {
				%>

				<button class="btn btn-primary pull-right"
					onclick="if(confirm('로그인 하세요'))location.href='login.jsp';"
					type="button" style="float: right; margin: 10px 0 10px 0;">글쓰기</button>

				<%
					}
				%>


			<div class="row">

				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd; width: 100%;">

					<thead>

						<tr>

							<th style="background-color: #eeeeee; text-align: center;">번호</th>

							<th style="background-color: #eeeeee; text-align: center;">제목</th>

							<th style="background-color: #eeeeee; text-align: center;">작성자</th>

							<th style="background-color: #eeeeee; text-align: center;">작성일</th>

						</tr>

					</thead>

					<tbody>

						<%
							BbsDAO bbsDAO = new BbsDAO();
							ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
							for (int i = 0; i < list.size(); i++) {
						%>

						<tr>

							<td><%=list.get(i).getBbsID()%></td>

							<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%></a></td>

							<td><%=list.get(i).getUserID()%></td>

							<td><%=list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시"
						+ list.get(i).getBbsDate().substring(14, 16) + "분"%></td>

						</tr>



						<%
							}
						%>



					</tbody>

				</table>

				<!-- 페이지 넘기기 -->

				<%
					if (pageNumber != 1) {
				%>

				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"
					class="btn btn-success btn-arrow-left">이전</a>

				<%
					}
					if (bbsDAO.nextPage(pageNumber)) {
				%>

				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"
					class="btn btn-success btn-arrow-left">다음</a>

				<%
					}
				%>







			</div>

		</div>





		<!-- 애니매이션 담당 JQUERY -->

		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

		<!-- 부트스트랩 JS  -->

		<script src="js/bootstrap.js"></script>

		<br /> <br />
		<div
			style="float: right; width: 0%; position: relative; box-sizing: border-box; bottom: 90px; left: 50px">

			<table style="height: 400px; border-color: gray; width: 250px;"
				border="orange" width="170">
				<tbody>
					<tr>
						<td style="width: 160.8px;">&nbsp;
							<div class="user_info" style="position: relative; top: -150px;">

								<%
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
</html>