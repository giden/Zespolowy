<%@taglib prefix="sec"
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
					<ul>
						<li><a href="<c:url value='/' />"><img alt="Strona G____wna" src="<c:url value='/resources/images/menu/1.png' />" /></a></li>
											
					</ul>
					</sec:authorize>
					<sec:authorize ifNotGranted="ROLE_USER">
					Niezalogowany, <a href="<c:url value='/login' />">zaloguj się</a> lub skorzystaj z systemu jednorazowo bez logowania!
					</sec:authorize>
				</div>

			
				<div id="center2">
					<h2>Dodaj film</h2>
					
					<form:form action="add/process" method="GET" modelAttribute="filmForm" class="dane">
              
               				<form:input path="name" />
               				<input type="submit" value="Add" />
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