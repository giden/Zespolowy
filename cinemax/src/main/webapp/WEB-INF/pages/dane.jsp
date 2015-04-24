<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@page session="true"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Cinemax</title>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" type="text/css" href="/cinemax/resources/style.css" media="screen" />
        <link rel="shortcut icon" href="" type="image/x-icon" />
		<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400italic' rel='stylesheet' type='text/css' />
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
  </head>
    <body>
	
	<div id="wrap">
		<div id="wrap2">
			<div id="logo"></div>
			<div id="like_it"><sec:authorize access="hasRole('ROLE_USER')">
		<!-- For login user -->
		<c:url value="/logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
		<div>
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
				</div>
		</form>
		<script>
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
		</script>
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			
				User : ${pageContext.request.userPrincipal.name} | <a
					href="javascript:formSubmit()"> Wyloguj</a>
			
		</c:if>

	</sec:authorize>
	<sec:authorize ifNotGranted="ROLE_USER">
		<a href="<c:url value='/login' />"><img alt="" src="<c:url value='/resources/images/zaloguj.png' />" /></a>
	</sec:authorize></div>
			<div class="clear"></div>
			<div id="content_top"></div>
			<div id="content">
				<div id="menu">
					<sec:authorize access="hasRole('ROLE_USER')">
					<a href="<c:url value='/' />" style="color:white; padding-right:10px; padding-left:10px">Strona główna</a>
					<sec:authorize access="hasRole('ROLE_ADMIN')">|	<a href="<c:url value='/film' />" style="color:white; padding-right:10px; padding-left:10px">Zarządzanie filmami</a>
					|	<a href="<c:url value='/show' />" style="color:white; padding-right:10px; padding-left:10px">Zarządzanie seansami</a>
					</sec:authorize>
					</sec:authorize>
					<sec:authorize ifNotGranted="ROLE_USER">
					Niezalogowany, <a href="<c:url value='/login' />">zaloguj się</a> lub skorzystaj z systemu jednorazowo bez logowania!
					</sec:authorize>
				</div>

			
				<div id="center2">
				
 

				
					<h2>Dane rezerwacji</h2>
					
					<p class="movie_title">${show.film.name}<span style="color:#8786c6; font-weight:normal">|</span> <span style="color:#ffcc1c">Piątek / ${show.date} / <span style="font-weight:normal">Godzina:</span> 19:00</span></p>
					
					<hr />
					
					
      				  
      				  <form:form action="/cinemax/sala/add/process/next" method="GET" modelAttribute="reservationFormNext" class="dane">
              
               				
               				<ul>
               				
							  <li><label>Imię</label> <form:input type="text" path="name" value="${pageContext.request.userPrincipal.name}" /></li>
							  <li><label>Nazwisko</label> <form:input type="text" path="surname" value="${surname}" /></li>
							  <li><label>E-mail</label> <form:input type="text" path="email" value="${email}" /></li>
							  <!--<li><label>Powtórz e-mail</label> <form:input type="text" path="email" /></li>-->
							  <li><label>Numer telefonu</label> <form:input type="text" path="phone" value="${phone}" /></li>
							
						</ul>
               				<input type="submit" value="Dodaj" />
               				
               				<!--  <div id="navigation">
							<div id="previous"><a href="/cinemax/reservation/add"><img alt="" src="/cinemax/resources/images/previous.png" /></a></div>
							<div id="next"><a href="rezerwacje.xhtml"><img alt="" src="/cinemax/resources/images/end.png" /></a></div>
						</div>-->
      				  </form:form>
					
				</div>

			<div style="clear:both;"></div>
			</div>
                        <div id="content_bot"></div>
                        <div id="footer">

                            <div id="footer_stripe"></div>
							<hr />
                            <div id="copyright">Wszelkie prawa zastrzeżone &copy; 2015 <a href="">Cinemax</a></div>
                            <div id="footer_menu">
                               

                            </div>
                            <div style="clear:both;"></div>
                            <div id="footer_banner"><a href="#">NA GÓRĘ</a></div>
							
                        </div>
                </div>
        </div>

    </body>
</html>
