<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Cinemax</title>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="shortcut icon" href="" type="image/x-icon" />
		<link href='http://fonts.googleapis.com/css?family=Titillium+Web:400italic' rel='stylesheet' type='text/css' />
		<link href='resources/style.css' rel='stylesheet' type='text/css' />
		
		
    </head>
    <body onload='document.loginForm.username.focus();'>
	<div id="wrap">
		<div id="wrap2">
			<div id="logo"></div>
			<div id="like_it"><a href="login.xhtml"><img alt="" src="resources/images/zaloguj.png" /></a></div>
			<div class="clear"></div>
			<div id="content_top"></div>
			<div id="content">
				<!--<div id="menu">
					<ul>
						<li><a href=""><img alt="Strona G____wna" src="images/menu/1.png" /></a></li>
											<li><img alt="" src="images/menu/l.png" /></li>
					</ul>
				</div>-->

			
				<div id="center2">
					<h2 class="login_h2">Panel logowania</h2>
					<div id="login">
						
					   <div class="login_box">
					   
				   	   <c:if test="${not empty error}">
							<div class="error">${error}</div>
						</c:if>
						<c:if test="${not empty msg}">
							<div class="msg">${msg}</div>
						</c:if>
											
											
						<form name='loginForm'	action="<c:url value='/login' />" method='post'>
									<div>
												<input name="username" class="field" id="user_login" type="text" value="Login..." onclick="if (this.defaultValue==this.value) this.value=''" onblur="if (this.value=='') this.value=this.defaultValue"/>
												<input name="password" class="field" id="user_pass" type="password" value="Hasło..." onclick="if (this.defaultValue==this.value) this.value=''" onblur="if (this.value=='') this.value=this.defaultValue"/>
												<input type="hidden" name="testcookie" value="1" />
												<input type="submit" name="submit" class="login" value="submit" />
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /></div>
						</form>
						</div>
						<ul class="list">
							<li><a href="">Zarejestruj się</a></li>
						</ul>
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