<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="공통디자인 - 사용자 페이지 header"
    %>
<%
	String username = (String)session.getAttribute("username");	//사용자이름
%>
<header id="header">
	<div class="in_header">
		<div class="sub-bg"></div>
		<div class="container">
			<ul class="topbar">
				<% if(username != null){ %>
					<li><%= username %>님 안녕하세요</li>
					<li><a href="">주문현황</a></li>
					<li><a href="logout.jsp">로그아웃</a></li>
				<% } else {%>
					<li><a href="http://localhost/paik_prj/paik/loginPage.jsp">로그인</a></li>
				<% }//if~el %>
			</ul>
			<div class="nav_wrap">
				<a href="http://localhost/paik_prj/index.jsp" class="logo">
					<img src="http://localhost/paik_prj/common/images/logo.png" alt="빽다방">
				</a>
				<a href="http://localhost/paik_prj/index.jsp" class="logo light">
					<img src="http://localhost/paik_prj/common/images/logo-2.png" alt="빽다방">
				</a>
				<div class="nav">
					<div class="nav-icon"><div></div></div>
					<ul class="navbar">
					<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-95">
						<a href="" style="margin-right: 30px;">빽다방</a>
					<ul class="sub-menu">
						<li>
							<a href="">빽다방 소개</a>
						</li>
						<li>
							<a href="">커피 이야기</a>
						</li>
						<li>
							<a href="">교육 이야기</a>
						</li>
					</ul>
					</li>
					
					<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-95">
						<a href="" style="margin-right: 30px;">메뉴</a>
						<ul class="sub-menu">
							<li>
								<a href="http://localhost/paik_prj/paik/newMenuPage.jsp">신메뉴</a>
							</li>
							<li>
								<a href="http://localhost/paik_prj/paik/coffeMenuPage.jsp">커피</a>
							</li>
							<li>
								<a href="http://localhost/paik_prj/paik/drinkMenuPage.jsp">음료</a>
							</li>
							<li>
								<a href="http://localhost/paik_prj/paik/icecreamDessertMenuPage.jsp">아이스크림/디저트</a>
							</li>
							<li>
								<a href="http://localhost/paik_prj/paik/paikccinoPage.jsp">빽스치노</a>
							</li>
						</ul>
					</li>
					<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-95">
						<a href="" style="margin-right: 30px;">장바구니</a>
					</li>
					<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-95">
						<a href="" style="margin-right: 30px;">고객의 소리</a>
						<ul class="sub-menu">
							<li>
								<a href="">고객의 소리</a>
							</li>
							<li>
								<a href="">답변 내역</a>
							</li>
						</ul>
					</li>
					<li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-95">
						<a href="" style="margin-right: 100px;">마이페이지</a>
						<ul class="sub-menu">
							<li>
								<a href="">나의 정보</a>
							</li>
							<li>
								<a href="">비밀번호 변경</a>
							</li>
							<li>
								<a href="">개인정보변경</a>
							</li>
							<li>
								<a href="">회원탈퇴</a>
							</li>
							<li>
								<a href="">주문 현황(내역)</a>
							</li>
						</ul>
					</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</header>