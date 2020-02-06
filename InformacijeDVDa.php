<!DOCTYPE html>
<html>
<?php
Include("misljenjeDB.php")
?>
<?php
	if (isset ($_GET["Spremi"])){
		$Ime = $_GET["Ime"];
		$Prezime = $_GET["Prezime"];
		$Opis = $_GET["Opis"];
		$Ocjena = $_GET["Ocjena"];
		$res = InformacijeDVDa($Ime, $Prezime, $Opis, $Ocjena);
	}
?>

  <head>
    <title>DVD Ravna Gora</title>
	<meta charset="utf-8">
    <link href="style.css" rel="stylesheet" type="text/css" />
	<script>
            function boja1(){
				var x = document.getElementById("txt1");
				x.style.color = 'white';
				}
		
			function boja2(){
				var x = document.getElementById("txt1")
				x.style.color= 'yellow';
				}
			function boja3(){
				var x = document.getElementById("txt2");
				x.style.color = 'white';
				}
		
			function boja4(){
				var x = document.getElementById("txt2")
				x.style.color= 'yellow';
				}	
			function boja5(){
				var x = document.getElementById("txt3");
				x.style.color = 'white';
				}
		
			function boja6(){
				var x = document.getElementById("txt3")
				x.style.color= 'yellow';
				}
			function boja7(){
				var x = document.getElementById("txt4");
				x.style.color = 'white';
				}
		
			function boja8(){
				var x = document.getElementById("txt4")
				x.style.color= 'yellow';
				}	
			function boja9(){
				var x = document.getElementById("txt5");
				x.style.color = 'white';
				}
		
			function boja10(){
				var x = document.getElementById("txt5")
				x.style.color= 'yellow';
				}	
			function boja11(){
				var x = document.getElementById("txt6");
				x.style.color = 'white';
				}
		
			function boja12(){
				var x = document.getElementById("txt6")
				x.style.color= 'yellow';
				}	
		</script>
  </head>
  
  <body>
    <div id="container">
    <div id="logo"><img src="images/logo copy.jpg" width="100%" height="72" alt=""/></div>
    <div id="banner"><img src="images/main-image.jpg" width="100%" height="326" alt="" /></div>
    
	<div id="nav">
      <ul>
     
      <li class="nlink"><a href="Naslovna.html" id="txt1" style="color:white;" onmouseover="boja2()"onmouseout="boja1()">Naslovna</a></li>
	  <li class="nlink"><a href="aktivnosti.html" id="txt2" style="color:white;" onmouseover="boja4()"onmouseout="boja3()">Aktivnosti</a></li>
	  <li class="nlink"><a href="Vozni park.html" id="txt3" style="color:white;" onmouseover="boja6()"onmouseout="boja5()">Vozni park</a></li>
	  <li class="nlink"><a href="Tijela.html" id="txt5" style="color:white;" onmouseover="boja10()"onmouseout="boja9()">Tijela</a></li>
	  <li class="nlink"><a href="InformacijeDVDa.php"id="txt6" style="color:white;" onmouseover="boja12()"onmouseout="boja11()">Informacije DVD-a</a></li>
     
     
      </ul>
	</div>
	  
	  <div id="content">
	    <h1> Kontakt i informacije </h1>
		<div id="left">
		  <h2> Grb </h2>
		  <img src="images/Grb.jpg" width="50%" height="50%" alt=""/>
		</div>
		 
		<div id="right">
		  <p>
		     Grb DVD-a Ravna Gora sastoji se od hrvatske sahovnice u gornjem lijevom kutu, u denom gornjem kutu se nalaze
		     vatrogasna kapa i alat crne boje unutar pozadinske boje koja je zelena. Doljni dio grba sacinjava pejzazna slika krajolika Ravne Gore.
		  </p>
		  <h1>Unos misljenja </h1>

	<form action="InformacijeDVDa.php" method="GET">

		<div class="tekst1">
		<label>Ime:</label>
		<input type="text" size="50px" name="Ime"></input>
		</div>
		<div class="tekst1">
		<label>Prezime</label>
		<input type="text" size="50px" name="Prezime"></input>
		</div>
		<div class="tekst1">
		<label>Mišljenje:</label>
		<input width="50px" name="Opis"></input>
		</div>
		<div class="tekst1">
		<label>Ocijena:</label>
		<input type="numeric" name="Ocjena"></input>
		</div>
		<div>
		<input type="submit" value="Spremi" name="Spremi"></input>
		</div>

	</form>
		</div>
	   
	  </div>
	
	<div id="content">
	
	<?php
	pregled_misljenja();
	?>
	</div>

	<div id="footer"> 
      
      <p> Izradili: Matija Oršulic i Bruno Svetlicic</p>
    </div>
    
  </body>
  
</html>