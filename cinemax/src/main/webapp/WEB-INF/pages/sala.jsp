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
					
					<p class="movie_title">${show.film.name}<span style="color:#8786c6; font-weight:normal"> |</span> <span style="color:#ffcc1c">Piątek / ${show.date}</p>
					
					<hr />
					
					<h3>SALA: <span style="color:#ffcc1c; font-weight:bold'">2</span></h3>
					
						<div id="screen">EKRAN</div>
						
					
					<form action="/cinemax/sala/add/process">
						<table class="sala" align="center">
						<tbody>
						<tr>
						<th scope="row">A</th>
						<td><input type="checkbox" name="1s" id="1s" value="1s" />
		<label id="labelus" for="1s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '1s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">1</label></td>
						<td><input type="checkbox" name="2s" id="2s" value="2s" />
		<label id="labelus" for="2s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '2s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">2</label></td>
						<td><input type="checkbox" name="3s" id="3s" value="3s" />
		<label id="labelus" for="3s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '3s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">3</label></td>
						<td><input type="checkbox" name="4s" id="4s" value="4s" /><label id="labelus" for="4s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '4s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">4</label></td>
<td><input type="checkbox" name="5s" id="5s" value="5s" /><label id="labelus" for="5s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '5s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">5</label></td>
<td><input type="checkbox" name="6s" id="6s" value="6s" /><label id="labelus" for="6s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '6s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">6</label></td>
<td><input type="checkbox" name="7s" id="7s" value="7s" /><label id="labelus" for="7s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '7s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">7</label></td>
<td><input type="checkbox" name="8s" id="8s" value="8s" /><label id="labelus" for="8s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '8s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">8</label></td>
<td><input type="checkbox" name="9s" id="9s" value="9s" /><label id="labelus" for="9s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '9s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">9</label></td>
<td><input type="checkbox" name="10s" id="10s" value="10s" /><label id="labelus" for="10s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '10s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">10</label></td>
<td><input type="checkbox" name="11s" id="11s" value="11s" /><label id="labelus" for="11s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '11s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">11</label></td>
<td><input type="checkbox" name="12s" id="12s" value="12s" /><label id="labelus" for="12s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '12s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">12</label></td>
<td><input type="checkbox" name="13s" id="13s" value="13s" /><label id="labelus" for="13s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '13s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">13</label></td>
<td><input type="checkbox" name="14s" id="14s" value="14s" /><label id="labelus" for="14s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '14s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">14</label></td>
<td><input type="checkbox" name="15s" id="15s" value="15s" /><label id="labelus" for="15s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '15s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">15</label></td>
<td><input type="checkbox" name="16s" id="16s" value="16s" /><label id="labelus" for="16s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '16s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">16</label></td>
<td><input type="checkbox" name="17s" id="17s" value="17s" /><label id="labelus" for="17s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '17s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">17</label></td>

						</tr>
						
						<tr>
						<th scope="row">B</th>
<td><input type="checkbox" name="18s" id="18s" value="18s" /><label id="labelus" for="18s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '18s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">18</label></td>
<td><input type="checkbox" name="19s" id="19s" value="19s" /><label id="labelus" for="19s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '19s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">19</label></td>
<td><input type="checkbox" name="20s" id="20s" value="20s" /><label id="labelus" for="20s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '20s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">20</label></td>
<td><input type="checkbox" name="21s" id="21s" value="21s" /><label id="labelus" for="21s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '21s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">21</label></td>
<td><input type="checkbox" name="22s" id="22s" value="22s" /><label id="labelus" for="22s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '22s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">22</label></td>
<td><input type="checkbox" name="23s" id="23s" value="23s" /><label id="labelus" for="23s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '23s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">23</label></td>
<td><input type="checkbox" name="24s" id="24s" value="24s" /><label id="labelus" for="24s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '24s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">24</label></td>
<td><input type="checkbox" name="25s" id="25s" value="25s" /><label id="labelus" for="25s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '25s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">25</label></td>
<td><input type="checkbox" name="26s" id="26s" value="26s" /><label id="labelus" for="26s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '26s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">26</label></td>
<td><input type="checkbox" name="27s" id="27s" value="27s" /><label id="labelus" for="27s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '27s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">27</label></td>
<td><input type="checkbox" name="28s" id="28s" value="28s" /><label id="labelus" for="28s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '28s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">28</label></td>
<td><input type="checkbox" name="29s" id="29s" value="29s" /><label id="labelus" for="29s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '29s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">29</label></td>
<td><input type="checkbox" name="30s" id="30s" value="30s" /><label id="labelus" for="30s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '30s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">30</label></td>
<td><input type="checkbox" name="31s" id="31s" value="31s" /><label id="labelus" for="31s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '31s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">31</label></td>
<td><input type="checkbox" name="32s" id="32s" value="32s" /><label id="labelus" for="32s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '32s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">32</label></td>
<td><input type="checkbox" name="33s" id="33s" value="33s" /><label id="labelus" for="33s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '33s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">33</label></td>
<td><input type="checkbox" name="34s" id="34s" value="34s" /><label id="labelus" for="34s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '34s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">34</label></td>

						</tr>
						
						<tr>
						<th scope="row">C</th>
<td><input type="checkbox" name="35s" id="35s" value="35s" /><label id="labelus" for="35s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '35s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">35</label></td>
<td><input type="checkbox" name="36s" id="36s" value="36s" /><label id="labelus" for="36s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '36s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">36</label></td>
<td><input type="checkbox" name="37s" id="37s" value="37s" /><label id="labelus" for="37s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '37s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">37</label></td>
<td><input type="checkbox" name="38s" id="38s" value="38s" /><label id="labelus" for="38s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '38s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">38</label></td>
<td><input type="checkbox" name="39s" id="39s" value="39s" /><label id="labelus" for="39s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '39s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">39</label></td>
<td><input type="checkbox" name="40s" id="40s" value="40s" /><label id="labelus" for="40s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '40s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">40</label></td>
<td><input type="checkbox" name="41s" id="41s" value="41s" /><label id="labelus" for="41s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '41s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">41</label></td>
<td><input type="checkbox" name="42s" id="42s" value="42s" /><label id="labelus" for="42s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '42s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">42</label></td>
<td><input type="checkbox" name="43s" id="43s" value="43s" /><label id="labelus" for="43s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '43s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">43</label></td>
<td><input type="checkbox" name="44s" id="44s" value="44s" /><label id="labelus" for="44s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '44s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">44</label></td>
<td><input type="checkbox" name="45s" id="45s" value="45s" /><label id="labelus" for="45s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '45s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">45</label></td>
<td><input type="checkbox" name="46s" id="46s" value="46s" /><label id="labelus" for="46s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '46s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">46</label></td>
<td><input type="checkbox" name="47s" id="47s" value="47s" /><label id="labelus" for="47s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '47s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">47</label></td>
<td><input type="checkbox" name="48s" id="48s" value="48s" /><label id="labelus" for="48s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '48s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">48</label></td>
<td><input type="checkbox" name="49s" id="49s" value="49s" /><label id="labelus" for="49s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '49s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">49</label></td>
<td><input type="checkbox" name="50s" id="50s" value="50s" /><label id="labelus" for="50s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '50s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">50</label></td>
<td><input type="checkbox" name="51s" id="51s" value="51s" /><label id="labelus" for="51s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '51s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">51</label></td>

						</tr>
						
						<tr>
						<th scope="row">D</th>
						<td><input type="checkbox" name="52s" id="52s" value="52s" /><label id="labelus" for="52s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '52s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">52</label></td>
<td><input type="checkbox" name="53s" id="53s" value="53s" /><label id="labelus" for="53s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '53s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">53</label></td>
<td><input type="checkbox" name="54s" id="54s" value="54s" /><label id="labelus" for="54s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '54s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">54</label></td>
<td><input type="checkbox" name="55s" id="55s" value="55s" /><label id="labelus" for="55s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '55s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">55</label></td>
<td><input type="checkbox" name="56s" id="56s" value="56s" /><label id="labelus" for="56s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '56s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">56</label></td>
<td><input type="checkbox" name="57s" id="57s" value="57s" /><label id="labelus" for="57s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '57s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">57</label></td>
<td><input type="checkbox" name="58s" id="58s" value="58s" /><label id="labelus" for="58s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '58s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">58</label></td>
<td><input type="checkbox" name="59s" id="59s" value="59s" /><label id="labelus" for="59s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '59s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">59</label></td>
<td><input type="checkbox" name="60s" id="60s" value="60s" /><label id="labelus" for="60s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '60s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">60</label></td>
<td><input type="checkbox" name="61s" id="61s" value="61s" /><label id="labelus" for="61s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '61s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">61</label></td>
<td><input type="checkbox" name="62s" id="62s" value="62s" /><label id="labelus" for="62s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '62s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">62</label></td>
<td><input type="checkbox" name="63s" id="63s" value="63s" /><label id="labelus" for="63s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '63s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">63</label></td>

						<td colspan="5" rowspan="2" class="entry">WEJŚCIE</td>
						</tr>
						
						<tr>
						<th scope="row">E</th>
<td><input type="checkbox" name="64s" id="64s" value="64s" /><label id="labelus" for="64s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '64s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">64</label></td>
<td><input type="checkbox" name="65s" id="65s" value="65s" /><label id="labelus" for="65s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '65s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">65</label></td>
<td><input type="checkbox" name="66s" id="66s" value="66s" /><label id="labelus" for="66s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '66s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">66</label></td>
<td><input type="checkbox" name="67s" id="67s" value="67s" /><label id="labelus" for="67s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '67s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">67</label></td>
<td><input type="checkbox" name="68s" id="68s" value="68s" /><label id="labelus" for="68s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '68s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">68</label></td>
<td><input type="checkbox" name="69s" id="69s" value="69s" /><label id="labelus" for="69s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '69s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">69</label></td>
<td><input type="checkbox" name="70s" id="70s" value="70s" /><label id="labelus" for="70s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '70s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">70</label></td>
<td><input type="checkbox" name="71s" id="71s" value="71s" /><label id="labelus" for="71s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '71s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">71</label></td>
<td><input type="checkbox" name="72s" id="72s" value="72s" /><label id="labelus" for="72s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '72s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">72</label></td>
<td><input type="checkbox" name="73s" id="73s" value="73s" /><label id="labelus" for="73s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '73s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">73</label></td>
<td><input type="checkbox" name="74s" id="74s" value="74s" /><label id="labelus" for="74s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '74s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">74</label></td>
<td><input type="checkbox" name="75s" id="75s" value="75s" /><label id="labelus" for="75s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '75s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">75</label></td>

						
						</tr>
						
						<tr>
						<th scope="row">F</th>
<td><input type="checkbox" name="76s" id="76s" value="76s" /><label id="labelus" for="76s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '76s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">76</label></td>
<td><input type="checkbox" name="77s" id="77s" value="77s" /><label id="labelus" for="77s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '77s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">77</label></td>
<td><input type="checkbox" name="78s" id="78s" value="78s" /><label id="labelus" for="78s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '78s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">78</label></td>
<td><input type="checkbox" name="79s" id="79s" value="79s" /><label id="labelus" for="79s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '79s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">79</label></td>
<td><input type="checkbox" name="80s" id="80s" value="80s" /><label id="labelus" for="80s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '80s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">80</label></td>
<td><input type="checkbox" name="81s" id="81s" value="81s" /><label id="labelus" for="81s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '81s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">81</label></td>
<td><input type="checkbox" name="82s" id="82s" value="82s" /><label id="labelus" for="82s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '82s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">82</label></td>
<td><input type="checkbox" name="83s" id="83s" value="83s" /><label id="labelus" for="83s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '83s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">83</label></td>
<td><input type="checkbox" name="84s" id="84s" value="84s" /><label id="labelus" for="84s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '84s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">84</label></td>
<td><input type="checkbox" name="85s" id="85s" value="85s" /><label id="labelus" for="85s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '85s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">85</label></td>
<td><input type="checkbox" name="86s" id="86s" value="86s" /><label id="labelus" for="86s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '86s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">86</label></td>
<td><input type="checkbox" name="87s" id="87s" value="87s" /><label id="labelus" for="87s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '87s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">87</label></td>

						<td rowspan="5" class="entry"></td>
<td><input type="checkbox" name="88s" id="88s" value="88s" /><label id="labelus" for="88s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '88s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">88</label></td>
<td><input type="checkbox" name="89s" id="89s" value="89s" /><label id="labelus" for="89s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '89s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">89</label></td>
<td><input type="checkbox" name="90s" id="90s" value="90s" /><label id="labelus" for="90s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '90s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">90</label></td>
<td><input type="checkbox" name="91s" id="91s" value="91s" /><label id="labelus" for="91s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '91s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">91</label></td>

						</tr>
						
						<tr>
						<th scope="row">G</th>
<td><input type="checkbox" name="92s" id="92s" value="92s" /><label id="labelus" for="92s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '92s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">92</label></td>
<td><input type="checkbox" name="93s" id="93s" value="93s" /><label id="labelus" for="93s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '93s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">93</label></td>
<td><input type="checkbox" name="94s" id="94s" value="94s" /><label id="labelus" for="94s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '94s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">94</label></td>
<td><input type="checkbox" name="95s" id="95s" value="95s" /><label id="labelus" for="95s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '95s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">95</label></td>
<td><input type="checkbox" name="96s" id="96s" value="96s" /><label id="labelus" for="96s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '96s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">96</label></td>
<td><input type="checkbox" name="97s" id="97s" value="97s" /><label id="labelus" for="97s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '97s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">97</label></td>
<td><input type="checkbox" name="98s" id="98s" value="98s" /><label id="labelus" for="98s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '98s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">98</label></td>
<td><input type="checkbox" name="99s" id="99s" value="99s" /><label id="labelus" for="99s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '99s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">99</label></td>
<td><input type="checkbox" name="100s" id="100s" value="100s" /><label id="labelus" for="100s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '100s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">100</label></td>
<td><input type="checkbox" name="101s" id="101s" value="101s" /><label id="labelus" for="101s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '101s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">101</label></td>
<td><input type="checkbox" name="102s" id="102s" value="102s" /><label id="labelus" for="102s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '102s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">102</label></td>
<td><input type="checkbox" name="103s" id="103s" value="103s" /><label id="labelus" for="103s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '103s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">103</label></td>
<td><input type="checkbox" name="104s" id="104s" value="104s" /><label id="labelus" for="104s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '104s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">104</label></td>
<td><input type="checkbox" name="105s" id="105s" value="105s" /><label id="labelus" for="105s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '105s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">105</label></td>
<td><input type="checkbox" name="106s" id="106s" value="106s" /><label id="labelus" for="106s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '106s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">106</label></td>
<td><input type="checkbox" name="107s" id="107s" value="107s" /><label id="labelus" for="107s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '107s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">107</label></td>

						</tr>
						
						<tr>
						<th scope="row">H</th>
<td><input type="checkbox" name="108s" id="108s" value="108s" /><label id="labelus" for="108s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '108s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">108</label></td>
<td><input type="checkbox" name="109s" id="109s" value="109s" /><label id="labelus" for="109s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '109s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">109</label></td>
<td><input type="checkbox" name="110s" id="110s" value="110s" /><label id="labelus" for="110s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '110s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">110</label></td>
<td><input type="checkbox" name="111s" id="111s" value="111s" /><label id="labelus" for="111s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '111s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">111</label></td>
<td><input type="checkbox" name="112s" id="112s" value="112s" /><label id="labelus" for="112s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '112s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">112</label></td>
<td><input type="checkbox" name="113s" id="113s" value="113s" /><label id="labelus" for="113s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '113s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">113</label></td>
<td><input type="checkbox" name="114s" id="114s" value="114s" /><label id="labelus" for="114s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '114s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">114</label></td>
<td><input type="checkbox" name="115s" id="115s" value="115s" /><label id="labelus" for="115s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '115s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">115</label></td>
<td><input type="checkbox" name="116s" id="116s" value="116s" /><label id="labelus" for="116s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '116s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">116</label></td>
<td><input type="checkbox" name="117s" id="117s" value="117s" /><label id="labelus" for="117s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '117s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">117</label></td>
<td><input type="checkbox" name="118s" id="118s" value="118s" /><label id="labelus" for="118s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '118s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">118</label></td>
<td><input type="checkbox" name="119s" id="119s" value="119s" /><label id="labelus" for="119s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '119s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">119</label></td>
<td><input type="checkbox" name="120s" id="120s" value="120s" /><label id="labelus" for="120s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '120s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">120</label></td>
<td><input type="checkbox" name="121s" id="121s" value="121s" /><label id="labelus" for="121s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '121s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">121</label></td>
<td><input type="checkbox" name="122s" id="122s" value="122s" /><label id="labelus" for="122s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '122s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">122</label></td>
<td><input type="checkbox" name="123s" id="123s" value="123s" /><label id="labelus" for="123s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '123s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">123</label></td>

						</tr>
						
						<tr>
						<th scope="row">I</th>
<td><input type="checkbox" name="124s" id="124s" value="124s" /><label id="labelus" for="124s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '124s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">124</label></td>
<td><input type="checkbox" name="125s" id="125s" value="125s" /><label id="labelus" for="125s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '125s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">125</label></td>
<td><input type="checkbox" name="126s" id="126s" value="126s" /><label id="labelus" for="126s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '126s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">126</label></td>
<td><input type="checkbox" name="127s" id="127s" value="127s" /><label id="labelus" for="127s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '127s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">127</label></td>
<td><input type="checkbox" name="128s" id="128s" value="128s" /><label id="labelus" for="128s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '128s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">128</label></td>
<td><input type="checkbox" name="129s" id="129s" value="129s" /><label id="labelus" for="129s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '129s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">129</label></td>
<td><input type="checkbox" name="130s" id="130s" value="130s" /><label id="labelus" for="130s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '130s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">130</label></td>
<td><input type="checkbox" name="131s" id="131s" value="131s" /><label id="labelus" for="131s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '131s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">131</label></td>
<td><input type="checkbox" name="132s" id="132s" value="132s" /><label id="labelus" for="132s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '132s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">132</label></td>
<td><input type="checkbox" name="133s" id="133s" value="133s" /><label id="labelus" for="133s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '133s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">133</label></td>
<td><input type="checkbox" name="134s" id="134s" value="134s" /><label id="labelus" for="134s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '134s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">134</label></td>
<td><input type="checkbox" name="135s" id="135s" value="135s" /><label id="labelus" for="135s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '135s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">135</label></td>
<td><input type="checkbox" name="136s" id="136s" value="136s" /><label id="labelus" for="136s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '136s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">136</label></td>
<td><input type="checkbox" name="137s" id="137s" value="137s" /><label id="labelus" for="137s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '137s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">137</label></td>
<td><input type="checkbox" name="138s" id="138s" value="138s" /><label id="labelus" for="138s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '138s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">138</label></td>
<td><input type="checkbox" name="139s" id="139s" value="139s" /><label id="labelus" for="139s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '139s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">139</label></td>

						</tr>
						
						<tr>
						<th scope="row">J</th>
<td><input type="checkbox" name="140s" id="140s" value="140s" /><label id="labelus" for="140s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '140s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">140</label></td>
<td><input type="checkbox" name="141s" id="141s" value="141s" /><label id="labelus" for="141s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '141s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">141</label></td>
<td><input type="checkbox" name="142s" id="142s" value="142s" /><label id="labelus" for="142s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '142s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">142</label></td>
<td><input type="checkbox" name="143s" id="143s" value="143s" /><label id="labelus" for="143s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '143s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">143</label></td>
<td><input type="checkbox" name="144s" id="144s" value="144s" /><label id="labelus" for="144s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '144s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">144</label></td>
<td><input type="checkbox" name="145s" id="145s" value="145s" /><label id="labelus" for="145s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '145s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">145</label></td>
<td><input type="checkbox" name="146s" id="146s" value="146s" /><label id="labelus" for="146s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '146s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">146</label></td>
<td><input type="checkbox" name="147s" id="147s" value="147s" /><label id="labelus" for="147s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '147s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">147</label></td>
<td><input type="checkbox" name="148s" id="148s" value="148s" /><label id="labelus" for="148s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '148s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">148</label></td>
<td><input type="checkbox" name="149s" id="149s" value="149s" /><label id="labelus" for="149s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '149s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">149</label></td>
<td><input type="checkbox" name="150s" id="150s" value="150s" /><label id="labelus" for="150s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '150s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">150</label></td>
<td><input type="checkbox" name="151s" id="151s" value="151s" /><label id="labelus" for="151s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '151s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">151</label></td>
<td><input type="checkbox" name="152s" id="152s" value="152s" /><label id="labelus" for="152s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '152s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">152</label></td>
<td><input type="checkbox" name="153s" id="153s" value="153s" /><label id="labelus" for="153s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '153s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">153</label></td>
<td><input type="checkbox" name="154s" id="154s" value="154s" /><label id="labelus" for="154s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '154s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">154</label></td>
<td><input type="checkbox" name="155s" id="155s" value="155s" /><label id="labelus" for="155s" class="<c:forEach items="${lista}" var="miejsce"><c:if test="${miejsce.getSeatName() == '155s'}">no</c:if></c:forEach>noactive" onclick="javascript:$(this).toggleClass('active').toggleClass('noactive');">155</label></td>

						</tr>
						</tbody>
						</table>
						
						<div id="seats"><div id="seat" class="noactive"></div>miejsce wolne <div id="seat" class="active"></div>miejsce wybrane <div id="seat" class="unactive"></div>miejsce zajęte</div>
						
						<input type="submit" value="Dalej" style="float:right;" id="sala"></input>
		</form>
					
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
