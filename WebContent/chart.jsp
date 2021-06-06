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


 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["Element", "Density", { role: "style" } ],
        ["Copper", 9, "#b87333"],
        ["Silver", 10, "silver"],
        ["Gold", 19, "gold"],
        ["Platinum", 2, "color: #e5e4e2"]
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        title: "Density of Precious Metals, in g/cm^3",
        width: 600,
        height: 400,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
  }
  </script>

	


</head>


<body>

	<div class="header">
		<div class="header_wrap">
			<div class="title">
				<span style="font-size: 25px; font-weight: bold; color: red;">토</span>
				<span style="font-size: 20px">요일은 </span> <span
					style="font-size: 25px; font-weight: bold; color: red;">마</span> <span
					style="font-size: 20px">주앉아 </span> <span
					style="font-size: 25px; font-weight: bold; color: red;">토</span> <span
					style="font-size: 20px">론하자</span>
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
				<li><a href="">주제 신청</a></li>
				<li><a href="">랭킹</a>
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
		style="float: left; width: 60%; position: relative; box-sizing: border-box; left: 100px; margin-left: 11%">

		<div class="nav_ul">

			<p style="text-align: center;">랭킹 정보</p>

		</div>

		<div class="parent10.1">

			<hr align="center" style="border: dashed 0.5px grey;">



			<div style="text-align: right">
				<ul2> <li2> <a href="write.jsp">글쓰기1&nbsp</a></li2> <li2>
				<a href="">글쓰기2&nbsp</a></li2> <li2> <a href="">글쓰기3&nbsp</a></li2> <br />
				<br />
				</ul2>
			</div>


		</div>
		
		<div>오늘의 토론왕</div>

 <div id="columnchart_values" style="width: 900px; height: 300px;"></div>


		<br /> <br />
		<div
			style="float: right; width: 0%; position: relative; box-sizing: border-box; bottom: 170px; left:50px">

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