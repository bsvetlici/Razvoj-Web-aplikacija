
<?php
	require_once("connection.php");
	function pregled_misljenja(){
		$conn=connection();
		$sql="SELECT Ime,Prezime, Ocjena, Opis FROM Misljenje,Korisnik, Ocjena WHERE ".
			" Misljenje.Sifra_korisnika=Korisnik.Sifra_korisnika AND Ocjena.Sifra_ocjene=Misljenje.Sifra_ocjene;";
		$conn = connection();			
		$res = mysqli_query($conn, $sql);
		while ($row=mysqli_fetch_array($res)){
		echo "<div>".$row['Ime']."</div>";
		echo "<div>".$row['Prezime']."</div>";
		echo "<div>".$row['Opis']."</div>";
		echo "<div>".$row['Ocjena']."</div>";
		}
		mysqli_close($conn);
	}
	
	function InformacijeDVDa($Ime, $Prezime, $Opis, $Ocjena){
		$conn = connection();
		
		$sql1 = "INSERT INTO Korisnik(Ime,Prezime) VALUES ('$Ime','$Prezime');";
		$res = mysqli_query($conn, $sql1);	
		$sql_Sifra_korisnika = "SELECT max(Sifra_korisnika) from Korisnik";
		$res_Sifra_korisnika = mysqli_query($conn, $sql_Sifra_korisnika);
		$row = mysqli_fetch_array($res_Sifra_korisnika);
		$Sifra_korisnika=$row[0];
		
		$sql2 = "INSERT INTO Ocjena(Ocjena) VALUES ('$Ocjena');";
		$res = mysqli_query($conn, $sql2);	
		$sql_Sifra_ocjene = "SELECT max(Sifra_ocjene) from Ocjena";
		$res_Sifra_Ocjene = mysqli_query($conn, $sql_Sifra_ocjene);
		$row = mysqli_fetch_array($res_Sifra_korisnika);
		$Sifra_ocjene=$row[0];
		
		
		$sql3 = "INSERT INTO Misljenje(Opis) VALUES ('$Opis');";
		$res = mysqli_query($conn, $sql3);	
		$sql_Sifra_misljenja = "SELECT max(Sifra_misljenja) from Misljenje";
		$res_Sifra_misljenja = mysqli_query($conn, $sql_Sifra_ocjene);
		$row = mysqli_fetch_array($res_Sifra_misljenja);
		$Sifra_misljenja=$row[0];
		
		
		
		if ($res){
			echo "Spremanje je uspješno ...";
			mysqli_close($conn);
			return true;
		} else { 
			echo mysqli_error($conn);
			mysqli_close($conn);
			return false;
		}
	}
	
?>
