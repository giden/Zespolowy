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
        <link rel="shortcut icon" href="" type="resources/image/x-icon" />
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
				
 

				
					<h2>Wybór miejsca</h2>
					
					<p class="movie_title">${show.film.name}<span style="color:#8786c6; font-weight:normal">|</span> <span style="color:#ffcc1c">Piątek / ${show.date} / <span style="font-weight:normal">Godzina:</span> 19:00</span></p>
					
					<hr />
					
					<h3>SALA: <span style="color:#ffcc1c; font-weight:bold'">2</span></h3>
					
						<div id="screen">EKRAN</div>
					
					
						<table class="sala" align="center">
						<tbody>
						<tr>
						<th scope="row">A</th>
						<td class="noactive" onclick="location.href='/cinemax/sala/add/process/1'">1</td>
						<td class="noactive" onclick="location.href='/cinemax/sala/add/process/2'">2</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/3'">3</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/4'">4</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/5'">5</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/6'">6</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/7'">7</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/8'">8</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/9'">9</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/10'">10</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/11'">11</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/12'">12</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/13'">13</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/14'">14</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/15'">15</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/16'">16</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/17'">17</td>
						</tr>
						
						<tr>
						<th scope="row">B</th>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/18'">1</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/19'">2</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/20'">3</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/21'">4</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/22'">5</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/23'">6</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/24'">7</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/25'">8</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/26'">9</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/27'">10</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/28'">11</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/29'">12</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/30'">13</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/31'">14</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/32'">15</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/33'">16</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/34'">17</td>
						</tr>
						
						<tr>
						<th scope="row">C</th>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/35'">1</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/36'">2</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/37'">3</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/38'">4</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/39'">5</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/40'">6</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/41'">7</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/42'">8</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/43'">9</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/44'">10</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/45'">11</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/46'">12</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/47'">13</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/48'">14</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/49'">15</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/50'">16</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/51'">17</td>
						</tr>
						
						<tr>
						<th scope="row">D</th>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/52'">1</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/53'">2</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/54'">3</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/55'">4</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/56'">5</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/57'">6</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/58'">7</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/59'">8</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/60'">9</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/61'">10</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/62'">11</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/63'">12</td>
						<td colspan="5" rowspan="2" class="entry">WEJŚCIE</td>
						</tr>
						
						<tr>
						<th scope="row">E</th>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/64'">1</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/65'">2</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/66'">3</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/67'">4</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/68'">5</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/69'">6</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/70'">7</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/71'">8</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/72'">9</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/73'">10</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/74'">11</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/75'">12</td>
						
						</tr>
						
						<tr>
						<th scope="row">F</th>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/76'">1</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/77'">2</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/78'">3</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/79'">4</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/80'">5</td>
						<td class="unactive">6</td>
						<td class="unactive">7</td>
						<td class="unactive">8</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/81'">9</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/82'">10</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/83'">11</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/84'">12</td>
						<td rowspan="5" class="entry"></td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/85'">14</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/86'">15</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/87'">16</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/88'">17</td>
						</tr>
						
						<tr>
						<th scope="row">G</th>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/89'">1</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/90'">2</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/91'">3</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/92'">4</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/93'">5</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/94'">6</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/95'">7</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/96'">8</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/97'">9</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/98'">10</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/99'">11</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/100'">12</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/101'">14</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/102'">15</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/103'">16</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/104'">17</td>
						</tr>
						
						<tr>
						<th scope="row">H</th>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/105'">1</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/106'">2</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/107'">3</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/108'">4</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/109'">5</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/110'">6</td>
						<td class="unactive">7</td>
						<td class="unactive">8</td>
						<td class="unactive">9</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/111'">10</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/112'">11</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/113'">12</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/114'">14</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/115'">15</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/116'">16</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/117'">17</td>
						</tr>
						
						<tr>
						<th scope="row">I</th>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/118'">1</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/119'">2</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/120'">3</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/121'">4</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/122'">5</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/123'">6</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/124'">7</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/125'">8</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/126'">9</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/127'">10</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/128'">11</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/129'">12</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/130'">14</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/131'">15</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/132'">16</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/133'">17</td>
						</tr>
						
						<tr>
						<th scope="row">J</th>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/134'">1</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/135'">2</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/136'">3</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/137'">4</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/138'">5</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/139'">6</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/140'">7</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/141'">8</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/142'">9</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/143'">10</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/144'">11</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/145'">12</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/146'">14</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/147'">15</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/148'">16</td>
						<td class="noactive" onclick="location.href='/cinemax/reservation/add/process/149'">17</td>
						</tr>
						</tbody>
						</table>
						
						<div id="seats"><div id="seat" class="noactive"></div>miejsce wolne <div id="seat" class="active"></div>miejsce wybrane <div id="seat" class="unactive"></div>miejsce zajęte</div>
					
						<!-- <div id="navigation">
							<div id="previous"><a href="filmy.xhtml"><img alt="" src="resources/images/previous.png" /></a></div>
							<div id="next"><a href="dane.xhtml"><img alt="" src="resources/images/next.png" /></a></div>
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
