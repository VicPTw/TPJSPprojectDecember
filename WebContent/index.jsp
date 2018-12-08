<%@page import="java.util.List"%>
<%@page import="bean.Partner"%>
<%@page import="dao.DaoManager"%>
<%@page import="bean.MainPage"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
<head>
<title>TAIWAN IMMIGRATION &amp; RELOCATION CO.</title>
<meta name="keywords" content="">
<meta name="description" content="">
<link rel="stylesheet" href="style.css" />
<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery.parallax-1.1.3.js"></script>
<script>
	$(function() {
		$('a[href*=#]:not([href=#])').click(
				function() {
					if (location.pathname.replace(/^\//, '') === this.pathname
							.replace(/^\//, '')
							|| location.hostname === this.hostname) {

						var target = $(this.hash);
						target = target.length ? target : $('[name='
								+ this.hash.slice(1) + ']');
						if (target.length) {
							$('html,body').stop().animate({
								scrollTop : target.offset().top
							}, 1000);
							return false;
						}
					}
				});
	});
</script>
</head>

<body>
	<div class="container">
		<!-- TOP Start -->
		<div class="wrapper">
			<header>
				<h2>TAIWAN IMMIGRATION &amp; RELOCATION CO.LTD</h2>
				<p>professional. Trustworthy. Honest</p>
			</header>
			<nav>
				<div class="menu">
					<ul>
						<li><a href="#About">About</a></li>
						<li><a href="#Services">Services</a></li>
						<li><a href="#Taiwan">Taiwan</a></li>
						<li><a href="#Partners">Partners</a></li>
						<li><a href="#Contact">Contact</a></li>
						<li><a href="#Top">Top</a></li>
						<li><a href="login/login.jsp"><i>S</i></a></li>
					</ul>
				</div>
			</nav>
		</div>
		<!-- TOP End -->
		<div class="banner" id="Top">
			<h3>WELCOMES TO TAIWAN</h3>
			<p>Your Total support Immigration &amp; Relocation solutions</p>
		</div>
		<!-- About Start -->
		<%
			// Read resource from databases
			MainPage about = DaoManager.getInstance().getMainPageDaoImp().getRecordById("about");
		%>
		<div class="content">
			<div class="about" id="About">
				<h4>ABOUT US</h4>
				<p><%=about.getMainContent()%></p>
				<h6>TAIWAN IMMIGRATION &amp; RELOCATION CO.(TIRC) provide</h6>
			</div>
			<!-- About End -->
			<!-- Service Start -->

			<jsp:include page="services/serviceFragment.jsp" />
			<!-- Services End -->
			<!-- Country Brief Start -->
			<%
				// Read resources from database
				MainPage cBrief = DaoManager.getInstance().getMainPageDaoImp().getRecordById("cbrief");
			%>
			<div class="cbrief" id="Taiwan">
				<div class="pic">
					<img src="img/CountryBrief2.jpg" alt="" />
				</div>
				<div class="text">
					<h4>COUNTRY BRIEF</h4>
					<p><%=cBrief.getMainContent()%></p>
				</div>
			</div>
			<!-- Country Brief End -->
			<!-- Partners Start -->
			<%
				// Read resources from database
				List<Partner> pList = DaoManager.getInstance().getPartnerDaoImp().getAllRecords();
				request.setAttribute("plist", pList);
			%>
			<div class="partners" id="Partners">
				<h4>OUR PARTNERS &amp; MEMBERSHIPS</h4>
				<c:forEach items="${plist}" var="p">
					<div class="partner">
						<div class="pic">
							<img src="${p.getpImg()}" alt="" />
						</div>
						<div class="text">
							<h4>${p.getpTitle()}</h4>
						</div>
					</div>
				</c:forEach>
				<a class="partnerRM" href="partners/Partners.jsp">Read More >></a>
			</div>
			<!-- Partners End -->
			<!-- Contact Start -->
			<div class="contact" id="Contact">
				<h4>CONTACT US</h4>
				<div class="textbox">
					<!-- Contact Inner -->
					<div class="inner contact">
						<!-- Form Area -->
						<div class="contact-form">
							<!-- Form -->
							<form id="contact-us" method="post" action="contactus/mail.jsp">
								<!-- Left Inputs -->
								<div class="col-xs-6 col-xs-12 animated"
									data-animation="fadeInLeft" data-animation-delay="300">
									<!-- Name -->
									<input type="text" name="name" id="name" required="required"
										class="form" placeholder="Name" />
									<!-- Email -->
									<input type="email" name="mail" id="mail" required="required"
										class="form" placeholder="Email" />
									<!-- Subject -->
									<input type="text" name="subject" id="subject"
										required="required" class="form" placeholder="Subject" />
								</div>
								<!-- End Left Inputs -->
								<!-- Right Inputs -->
								<div class="col-xs-6 col-xs-12 animated"
									data-animation="fadeInRight" data-animation-delay="400">
									<!-- Message -->
									<textarea name="message" id="message" class="form textarea"
										placeholder="Message"></textarea>
								</div>
								<!-- End Right Inputs -->
								<!-- Bottom Submit -->
								<div class="relative fullwidth col-xs-12">
									<!-- Send Button -->
									<button type="submit" id="submit" name="submit"
										class="form-btn semibold">Send Message</button>
								</div>
								<!-- End Bottom Submit -->
								<!-- Clear -->
								<div class="clear"></div>
							</form>
						</div>
						<!-- End Contact Form Area -->
					</div>
					<!-- End Inner -->
				</div>
				<div class="pic">
					<img src="img/contact_us.jpg" alt="" />
				</div>
			</div>
			<!-- Contact End -->
		</div>
		<footer></footer>
	</div>
</body>
</html>