<?php
	session_start();
	//require_once("../conexio.php");
	//Incluimos la libreria de graficos
	
		$conexion = mysqli_connect('localhost', 'root', '', 'bd_l2f');
		$acentos = mysqli_query($conexion, "SET NAMES 'utf8'");
	$select_weight_sql = "SELECT * FROM `tbl_historial_peso` WHERE id_usuario = ".$_SESSION['id_usuario'];
	$select_weight_query = mysqli_query($conexion,$select_weight_sql);

	$weight_array=array();
	$data_array = array();
	while($weight = mysqli_fetch_array($select_weight_query))
	{
		array_push($weight_array,$weight['peso']);
		array_push($data_array,$weight['fecha_his_pes']);
	}
	require_once ('../libs/jpgraph/src/jpgraph.php');
	require_once ('../libs/jpgraph/src/jpgraph_line.php');
		
		// Creamos el grafico
		$grafico = new Graph(500,250,"auto");
		$grafico->SetScale('textlin');
		$grafico->img->SetAntiAliasing();
		$grafico->xgrid->Show(); 
		// Ajustamos los margenes del grafico
		$grafico->SetMargin(40,30,30,40);
		 
		// Creamos barras de datos a partir del array de datos
		$bplot = new LinePlot($weight_array);
		//Días
		$lineplot=new LinePlot($data_array);
		$lineplot->SetColor("black");
		$lineplot->SetWeight(2);
		// Configuramos color de las barras 
		$bplot->SetColor('#479CC9');

		// Queremos mostrar el valor numerico de la barra
		$bplot->value->Show();

		//Añadimos barra de datos al grafico
		$grafico->Add($bplot);
		$grafico->Add($lineplot);
		// Configuracion de los titulos
		$grafico->title->Set('Evolución de peso');
		$grafico->xaxis->title->Set('Fecha');
		//$grafico->xaxis->hide();
		$grafico->yaxis->title->Set('Peso');
		 
		$grafico->title->SetFont(FF_FONT1,FS_BOLD);
		$grafico->yaxis->title->SetFont(FF_FONT1,FS_BOLD);
		$grafico->xaxis->title->SetFont(FF_FONT1,FS_BOLD);
		 
		// Se muestra el grafico
		$grafico->Stroke();
		?>