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


<body bgcolor="#FAEBD7">

	<div class="header">
		<div class="header_wrap">
			<div class="title">
				<p>토요일은 마주앉아 토론하자</p>
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
				<li><a href="">토론</a></li>
				<li><a href="">정보공유</a></li>
				<li><a href="">랭킹</a></li>
			</ul>
		</div>
	</div>

	<br />

	<div style="width: 80%; float: left; box-sizing: border-box;">
		<div class="tab_wrap">
			<ul class="tabs">
				<li><a href="#tab1">사이트 소개</a></li>
				<li><a href="#tab2">이용 방법</a></li>
				<li><a href="#tab3">추천주제</a></li>
			</ul>
			<div class="tab_container" style="height: 500px;">
				<div id="tab1" class="tab_content">
					<!--내용채우기-->
					<div class="parent"
						style="width: 100%; height: 455px; background: #585858;">
						<div class="child1" style="background: #ffeba2;">
							<p>사이트 소개</p>
						</div>
						<div class="child1" style="background: #ffeba2de;">
							<p>..</p>
						</div>
						<div class="child1" style="background: #ffeba2;">
							<p>..</p>
						</div>
					</div>
				</div>
				<div id="tab2" class="tab_content">
					<!--여개 내용-->
					<div class="parent"
						style="width: 100%; height: 455px; background: #585858;">


						<div class="child2" style="background: #ffeba2;">
							<p>..</p>
						</div>
						<div class="child2" style="background: #ffeba2de;">
							<p>...</p>
						</div>
						<div class="child2" style="background: #ffeba2;">
							<p>..</p>
						</div>
					</div>
				</div>
				<div id="tab3" class="tab_content">
					<!--채우기-->

					<p>..</p>
				</div>
			</div>
		</div>
	</div>
	<br />
	<br />
	<div style="width: 20%; float: right; box-sizing: border-box;">

		


	</div>

</body>
</html>