<?php 
	session_start();
	session_destroy();
	echo "<script type='text/javascript'>alert('Hasta pronto');
			location.href='login.php';</script>";