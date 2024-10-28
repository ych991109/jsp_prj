<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    %>
<footer>
<div class="container">
	<div class="in_footer">
		<a class="logo" href=""><img src="/wp-content/themes/paikdabang/assets/images/flogo.png" alt="더본로고"></a>
		<a class="logo light" href=""><img src="/wp-content/themes/paikdabang/assets/images/flogo-2.png" alt="더본로고"></a>
		<div class="company_info">
			<ul><li><a href="https://www.theborn.co.kr/agreement/" target="_blank" style="font-weight:800;">개인정보처리방침</a></li></ul>
			<ul>
				<li>(주)더본코리아</li>
				<li>사업자등록번호 211-86-00870</li>
				<li>대표이사 백종원</li>
			</ul>
			<ul>
				<li>주소: 서울시 강남구 봉은사로 1길 39 유성빌딩 5~6층</li>
				<li>팩스: 02-511-3864</li>
			</ul>
			<ul>
				<li>본사 대표전화: 02-549-3864</li>
				<li>가맹상담전화: 02-3447-0410</li>
				<li>고객센터: 1544-2360</li>
			</ul>
			<p class="copyright">COPYRIGHTⓒ 2018 THEBORN KOREA INC. ALL RIGHTS RESERVED</p>
		</div>
	</div>

	<div class="to_top">
		<span></span>
	</div>
</div>
</footer>
<script type="text/javascript">
//MOBILE MENU
jQuery("header .nav .nav-icon").click(function() {
	jQuery(this).toggleClass("active");
	jQuery("header .navbar").toggleClass("active");

	jQuery(".overlay").fadeToggle();
	jQuery(".overlay").css("z-index","1");
});
jQuery(document).on("click","header .navbar.active .menu-item-has-children>a",function() {
	jQuery(this).removeAttr("href");
	jQuery(this).toggleClass("on");
	jQuery(this).next(".sub-menu").slideToggle().parents().siblings().children(".sub-menu").slideUp();
});

//PC MENU
jQuery(".in_header .nav .navbar>.menu-item-has-children").on("mouseenter",function(){
	jQuery(".sub-bg").addClass("on");
});
jQuery(".in_header .nav .navbar>.menu-item-has-children").on("mouseleave",function(){
	jQuery(".sub-bg").removeClass("on");
});

//TOP button
$(window).scroll(function(){
	if($(this).scrollTop() > 1){
		$('.to_top').fadeIn();
	}else{
		$('.to_top').fadeOut();
	}
});
jQuery('.to_top').click(function() {
	jQuery('html, body').animate({
		scrollTop: 0
	}, 400);
	return false;
});
</script>