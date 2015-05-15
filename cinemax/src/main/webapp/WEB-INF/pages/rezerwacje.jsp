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
		<script>$(document).ready(function() {
        //dla każdego miejsca z tabami
        $('.tabs').each(function() {
            var $ul = $(this);
            var $li = $ul.children('li');
            //przy wejsciu na strone ukrywamy tresc tabow i pokazujemy tylko aktywny...
            $li.each(function() { //pętla po wszystkich tabach
                var $trescTaba = $($(this).children('a').attr('href')); //pobieramy blok o id pobranym z linka-taba
                if ($(this).hasClass('active')) { //jeżeli ten tab ma klasę aktywną
                    $trescTaba.show(); //to pobrany przed chwilą blok pokazujemy
                } else {
                    $trescTaba.hide(); //jeżeli takiej klasy nie ma to blok ukrywamy
                }
            });
                     
            //mały trik - gdy klikamy na tab, wtedy wykonujemy zdarzenie dla linka, który się w nim znajduje (dzieki temu możemy kliknąć na cały tab, a nie tylko na linka)
            $li.click(function() {$(this).children('a').click()});
            //po kliknięciu na link...
            $li.children('a').click(function() {
                //usuwamy z tabów klasę active
                $li.removeClass('active');
                //ukrywamy wszystkie taby               
                $li.each(function() {
                    $($(this).children('a').attr('href')).hide();
                });
                //ustawiamy klikniętemu tabowi klasę aktywną
                $(this).parent().addClass('active');
                $($(this).attr('href')).show();
                //nie chcemy wykonać domyślnej akcji dla linka
                return false;
            });
        });
}); </script>
  </head>
    <body>
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
					<!--<ul>
						<li><a href=""><img alt="Strona G____wna" src="images/menu/1.png" /></a></li>
											<li><img alt="" src="images/menu/l.png" /></li>
					</ul>-->
					<a href="<c:url value='/' />" style="color:white; padding-right:10px; padding-left:10px">Strona główna</a>
					|	<a href="<c:url value='/reservation/list' />" style="color:white; padding-right:10px; padding-left:10px">Rezerwacje</a>
					   |   <a href="<c:url value='/' />" style="color:white; padding-right:10px; padding-left:10px">Dodaj rezerwację</a>
					      |   <a href="<c:url value='/user' />" style="color:white; padding-right:10px; padding-left:10px">Klienci</a>
					         |   <a href="<c:url value='/user/add' />" style="color:white; padding-right:10px; padding-left:10px">Dodaj klienta</a></div>

			
				<div id="center2">
				
 
 <c:if test="${not empty message2}">
							<div class="msg">${message2}</div>
						</c:if>
						
				
					<h2>Rezerwacje</h2>
					
						<ul class="tabs" style="float: left; display:block">
								<li class="active"><a href="#tab-1" class="active">wszystkie</a></li>
								<li><a href="#tab-2">pt.</a></li>
								<li><a href="#tab-3">sob.</a></li>
								<li><a href="#tab-4">niedz.</a></li>
								<li><a href="#tab-5">pon.</a></li>
								<li><a href="#tab-6">wt.</a></li>
								<li><a href="#tab-7">śr.</a></li>
								<li><a href="#tab-8">czw.</a></li>
						</ul>
						
						<form:form action="search" class="szukaj" style="float:right; display:block" method="GET" modelAttribute="reservation">
						<ul>
							  <li><label>Szukaj</label> <form:input path="surname"/></li>
						</ul>
						</form:form>
						
						<div style="clear:both"></div>
						
						<hr />
						 
						<div id="tab-1" class="tab">
							
							<table class="rezerwacje" align="center">
								<tr>
									<th>Film</th>
									<th>Data</th>
									<th>Imię i Nazwisko</th>
									<th>Data rezerwacji</th>
									<th style="text-align:right">Ustawienia</th>
								</tr>
								<c:forEach var="reservation" items="${reservations}">  
								
									<tr>
									<td>${reservation.show.film.name}</td>
									<td>${reservation.show.date}</td>
									<td>${reservation.name} ${reservation.surname}</td>
									<td>${reservation.date}</td>
									<td style="color:#9493d8; text-align:right" class="ustawienia"><a href="#">Szczegóły</a>   |   <a href="${pageContext.request.contextPath}/reservation/edit/${reservation.reservationId}.html">Edytuj</a>   |   <a href="${pageContext.request.contextPath}/reservation/delete/${reservation.reservationId}.html">Usuń</a>   |   <a href="#" style="color:#ffcb2a; font-weight:bold; text-decoration:underline;">Potwierdź</a></td>
									</tr>
									
								
								</c:forEach>
							</table>
						</div>
						
						
					<div id="navigation_reservation">
							<div id="previous"><a href="#"><img alt="" src="/cinemax/resources/images/previous.png" /></a></div>
							<div id="next"><a href="#"><img alt="" src="/cinemax/resources/images/next.png" /></a></div>
					</div>	
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
