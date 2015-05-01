<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Cinemax</title>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/style.css" media="screen" />
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
					|	<a href="<c:url value='/profile/edit' />" style="color:white; padding-right:10px; padding-left:10px">Edytuj profil</a>

					<sec:authorize access="hasRole('ROLE_ADMIN')">|	<a href="<c:url value='/film' />" style="color:white; padding-right:10px; padding-left:10px">Zarządzanie filmami</a>
					|	<a href="<c:url value='/show' />" style="color:white; padding-right:10px; padding-left:10px">Zarządzanie seansami</a>
					|	<a href="<c:url value='/user' />" style="color:white; padding-right:10px; padding-left:10px">Zarządzanie użytkownikami</a>
					</sec:authorize>
					</sec:authorize>
					<sec:authorize ifNotGranted="ROLE_USER">
					Niezalogowany, <a href="<c:url value='/login' />">zaloguj się</a> lub skorzystaj z systemu jednorazowo bez logowania!
					</sec:authorize>
				</div>

			
				<div id="center2">
				
 

				
					<h2>Wybór filmu</h2>
					
						<ul class="tabs">
								<li class="active"><a href="#tab-1" class="active">pt.</a></li>
								<li><a href="#tab-2">sob.</a></li>
								<li><a href="#tab-3">niedz.</a></li>
								<li><a href="#tab-4">pon.</a></li>
								<li><a href="#tab-5">wt.</a></li>
								<li><a href="#tab-6">śr.</a></li>
								<li><a href="#tab-7">czw.</a></li>
						</ul>
						 
						<div id="tab-1" class="tab">
						
						<ul>
						<c:forEach var="film" items="${films}">  
							
								<li>
								<p class="movie_title">${film.name} </p>
								<p class="movie_hours">
								<c:forEach var="show" items="${film.shows}">
								|	<a href="sala/${show.showId}">${show.date}</a>
														</c:forEach>
								</p>
								<hr />
								</li>
								
							
						</c:forEach>
						</ul>
						</div>
					<!-- <div id="tab-2" class="tab">
							<ul>
								<li>
								<p class="movie_title">Harry potter</p>
								<p class="movie_hours"><a href="sala.xhtml">11:00</a>   |   <a href="sala.xhtml">13:30</a>   |   <a href="sala.xhtml">19:00</a></p>
								<hr />
								</li>
							</ul>
						</div>
						<div id="tab-3" class="tab">
								<ul>
								<li>
								<p class="movie_title">Matrix</p>
								<p class="movie_hours"><a href="sala.xhtml">11:00</a>   |   <a href="sala.xhtml">13:30</a>   |   <a href="sala.xhtml">19:00</a></p>
								<hr />
								</li>
							</ul>
						</div>
						<div id="tab-4" class="tab">
								<ul>
								<li>
								<p class="movie_title">Spider-Man</p>
								<p class="movie_hours"><a href="sala.xhtml">11:00</a>   |   <a href="sala.xhtml">13:30</a>   |   <a href="sala.xhtml">19:00</a></p>
								<hr />
								</li>
							</ul>
						</div>
						<div id="tab-5" class="tab">
								<ul>
								<li>
								<p class="movie_title">James Bond</p>
								<p class="movie_hours"><a href="sala.xhtml">11:00</a>   |   <a href="sala.xhtml">13:30</a>   |   <a href="sala.xhtml">19:00</a></p>
								<hr />
								</li>
							</ul>
						</div>
						<div id="tab-6" class="tab">
								<ul>
								<li>
								<p class="movie_title">Labirynt</p>
								<p class="movie_hours"><a href="sala.xhtml">11:00</a>   |   <a href="sala.xhtml">13:30</a>   |   <a href="sala.xhtml">19:00</a></p>
								<hr />
								</li>
							</ul>
						</div>
						<div id="tab-7" class="tab">
								<ul>
								<li>
								<p class="movie_title">Wkręceni 2</p>
								<p class="movie_hours"><a href="sala.xhtml">11:00</a>   |   <a href="sala.xhtml">13:30</a>   |   <a href="sala.xhtml">19:00</a></p>
								<hr />
								</li>
								<li>
								<p class="movie_title">Labirynt</p>
								<p class="movie_hours"><a href="sala.xhtml">11:00</a>   |   <a href="sala.xhtml">13:30</a>   |   <a href="sala.xhtml">19:00</a></p>
								<hr />
								</li>
							</ul>
						</div> -->
					
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
