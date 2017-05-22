<?php 
require_once ('jpgraph/src/jpgraph.php');
require_once ('jpgraph/src/jpgraph_bar.php');

	// Se define el array de datos
	$datosy=array(25,16,24,5,8,31);
	 
	// Creamos el grafico
	$grafico = new Graph(500,250);
	$grafico->SetScale('textlin');
	 
	// Ajustamos los margenes del grafico-----    (left,right,top,bottom)
	$grafico->SetMargin(40,30,30,40);
	 
	// Creamos barras de datos a partir del array de datos
	$bplot = new BarPlot($datosy);

	// Configuramos color de las barras 
	$bplot->SetFillColor('#479CC9');

	// Queremos mostrar el valor numerico de la barra
	$bplot->value->Show();

	//Añadimos barra de datos al grafico
	$grafico->Add($bplot);
	 
	// Configuracion de los titulos
	$grafico->title->Set('Mi primer grafico de barras');
	$grafico->xaxis->title->Set('Titulo eje X');
	$grafico->yaxis->title->Set('Titulo eje Y');
	 
	$grafico->title->SetFont(FF_FONT1,FS_BOLD);
	$grafico->yaxis->title->SetFont(FF_FONT1,FS_BOLD);
	$grafico->xaxis->title->SetFont(FF_FONT1,FS_BOLD);
	 
	// Se muestra el grafico
	$grafico->Stroke();
	?>
