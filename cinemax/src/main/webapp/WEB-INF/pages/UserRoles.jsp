﻿<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page session="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Cinemax</title>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="shortcut icon" href="" type="image/x-icon" />
		<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400italic' rel='stylesheet' type='text/css' />
		<link href='${pageContext.request.contextPath}/resources/style.css' rel='stylesheet' type='text/css' />
		
		
    </head>
    <body onload='document.loginForm.username.focus();'>
	<div id="wrap">
		<div id="wrap2">
			<div id="logo"></div>
			<div id="like_it">
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
			</div>
			<div class="clear"></div>
			<div id="content_top"></div>
			<div id="content">
				<div id="menu">
					
					<a href="<c:url value='/' />" style="color:white; padding-right:10px; padding-left:10px">Strona główna</a>
					|	<a href="<c:url value='/user/list' />" style="color:white; padding-right:10px; padding-left:10px">Lista userów</a>
					   |   <a href="<c:url value='/user/add' />" style="color:white; padding-right:10px; padding-left:10px">Dodaj usera</a>
					      
				</div>
				
				<div id="center2">
				<br></br>
				<br></br>
					<div class="tabs3">
						<a class="active"
							href="${pageContext.request.contextPath}/user/roles/add/${user.username}">
							DODAJ ROLĘ </a>
					</div>
					<br></br>
					<p>
						<strong>${user.username}</strong>
					</p>
					<p>Imię: ${user.name}</p>
					<p>Nazwisko: ${user.surname}</p>
					<p>Email: ${user.email}</p>
					<p>Telefon: ${user.phone}</p>
					<p>
						<table class="rezerwacje" align="center">
							<tr>
								<th>Username</th>
								<th>Role</th>
								<th>Ustawienia</th>
							</tr>
							<c:forEach var="role" items="${roles}">

								<tr>
									<td>${role.user.username}</td>
									<td>${role.role}</td>

									<td style="color: #9493d8; text-align: right"
										class="ustawienia"><a
										href="${pageContext.request.contextPath}/user/roles/delete/${user.username}/${role.role}">Usuń</a></td>
								</tr>


							</c:forEach>
						</table>

					</p>
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