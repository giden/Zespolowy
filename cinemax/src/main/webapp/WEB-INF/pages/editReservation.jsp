﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<div id="like_it"><a href="<c:url value='/login' />"><img alt="" src="<c:url value='/resources/images/zaloguj.png' />" /></a></div>
			<div class="clear"></div>
			<div id="content_top"></div>
			<div id="content">
				<div id="menu">
					<!--<ul>
						<li><a href=""><img alt="Strona G____wna" src="images/menu/1.png" /></a></li>
											<li><img alt="" src="images/menu/l.png" /></li>
					</ul>-->
					Niezalogowany, <a href="<c:url value='/login' />">zaloguj się</a> lub skorzystaj z systemu jednorazowo bez logowania!
				</div>

			
				<div id="center2">
				
 

				
					<h2>Edycja rezerwacji</h2>
					
					
					<hr />
					
					
      				  
      				  <form:form action="process/${reservation.reservationId}.html" commandName="reservation" method="GET" class="dane">
              
               				
               				<ul>
							  <li><label>Imię</label> <form:input type="text" path="name" /></li>
							  <li><label>Nazwisko</label> <form:input type="text" path="surname" /></li>
							  <li><label>E-mail</label> <form:input type="text" path="email" /></li>
							  <li><label>Numer telefonu</label> <form:input type="text" path="phone" /></li>
						</ul>
               				<input type="submit" value="Edytuj" />
               				
               				
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
