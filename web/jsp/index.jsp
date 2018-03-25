<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.net.URLEncoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
	<head>
	<meta charset="utf-8">
	<title>Qazgidromet</title>
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/style.css">
        
	</head>
	<body>
	<header><%
                    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                    LocalDate localDate = LocalDate.now();
                %>
		<div class="container text-center">
			<div class="fh5co-navbar-brand">
				<a class="fh5co-logo" href="">Qazgidromet</a>
			</div>
			<nav id="fh5co-main-nav" role="navigation">
				<ul>
                                        <li><a href="" class="active">Главная</a></li>
					<li><a href="jsp/pnzdata.jsp?pnzId=1&pnzName=ПНЗ1&month=1">Заполнения</a></li>
					<li><a href="jsp/datamonth.jsp?month=1&name=<%=URLEncoder.encode("Январь", "UTF-8")%>">Q ср.м</a></li>
					<li><a href="jsp/qaverage.jsp?month=1">Прогноз q ср.м</a></li>
                                        <li><a href="jsp/pprognoz.jsp?date=<%=dtf.format(localDate)%>">Прогностический P</a></li>
                                        <li><a href="jsp/pfact.jsp?date=<%=dtf.format(localDate)%>">Фактический P</a></li>
				</ul>
			</nav>
		</div>
	</header>
	<div class="heading-section text-center">
            <h2>Наблюдения за загрязнением атмосферного воздуха</h2>
        </div>
        <div class="row about">
            <div class="col-md-10 col-md-offset-1">
                    <div class="col-md-6 col-sm-6 services-num services-num-text-right">
                            <span class="number-holder">01</span>
                            <div class="desc">
                                    <h3>Параметр Р </h3>
                                    <p>– это интегральный показатель загрязнения воздуха в городе, который является частотной характеристикой и представляет собой отношение числа существенно повышенных концентраций примесей в воздухе, измеренных в течение дня, к общему числу измерений в течение этого же дня. </p>
                            </div>
                    </div>
                    <div class="col-md-6 col-sm-6 services-num">
                            <span class="number-holder">02</span>
                            <div class="desc">
                                    <h3>Ручные пункты наблюдения в Алматы:</h3>
                                    <p>№1 – ул. Амангельды, угол ул. Сатпаева <br>№12 – проспект Райымбека, угол ул. Наурызбай батыра<br>№16 – микрорайон Айнабулак-3<br>№25 – микрорайон Аксай-3, ул. Маргулана, угол ул. Момышулы<br>№26 – микрорайон Тастак-1, ГУ «Городская детская поликлиника №8»</p>
                            </div>
                    </div>
            </div>
        </div>

	<footer>
		<div id="footer" class="fh5co-border-line">
			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 text-center">
						<p>Copyright 2016 Free Html5 <a href="#">Neos</a>. All Rights Reserved. <br>Made with <i class="icon-heart3 love"></i> by <a href="http://freehtml5.co/" target="_blank">Freehtml5.co</a> / Demo Images: <a href="https://www.pexels.com/" target="_blank">Pexels</a> &amp; <a href="http://plmd.me/" target="_blank">PLMD</a> 
					</div>
				</div>
			</div>
		</div>
	</footer>

	</body>
</html>


