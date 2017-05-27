<?php
	session_start();
	//require_once("../conexio.php");

	

		$conexion = mysqli_connect('localhost', 'root', '', 'bd_l2f');
		$acentos = mysqli_query($conexion, "SET NAMES 'utf8'");
		//Consultas
		//ID CUERPO
		//Obtenemos los ID de la part del cuerpo
		  $part_body_id_sql = "SELECT * FROM tbl_parte_cuerpo";
		  $part_body_id_query = mysqli_query($conexion, $part_body_id_sql);
		  while($part_body_id = mysqli_fetch_array($part_body_id_query))
		  {
		    //Segun el valor del nombre, le asignaremos el id correspondiente 
		    switch ($part_body_id['nombre_parte_cuerpo']) {
		      case 'Brazo':
		        $id_brazo = $part_body_id['id_parte_cuerpo'];
		        break;
		      case 'Antebrazo':
		        $id_antebrazo = $part_body_id['id_parte_cuerpo'];
		        break;
		      case 'Pectoral':
		        $id_pectoral = $part_body_id['id_parte_cuerpo'];
		        break;
		      case 'Cintura':
		        $id_cintura = $part_body_id['id_parte_cuerpo'];
		        break;
		      case 'Cadera':
		        $id_cadera = $part_body_id['id_parte_cuerpo'];
		        break;
		      case 'Cuadricep':
		        $id_cuadricep = $part_body_id['id_parte_cuerpo'];
		        break;
		      case 'Gemelo':
		        $id_gemelo = $part_body_id['id_parte_cuerpo'];
		        break;
		      default:
		        # code...
		        break;
		    }
		  }
    //END ID parte cuerpo         
		//END ID CUERPO
		//Querys
		 //brazo
            $select_brazo_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=".$id_brazo;
            //echo $select_brazo_sql;die;
        //Antebrazo
             $select_antebrazo_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=".$id_antebrazo;
        //Pectoral
             $select_pectoral_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=".$id_pectoral;
        //Cintura
             $select_cintura_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=".$id_cintura;
        //Cadera
              $select_cadera_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=".$id_cadera;
        //Cuadricep
               $select_cuadricep_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=".$id_cuadricep;
        //Gemela
               $select_gemelo_sql = "SELECT * FROM `tbl_historial_medidas` WHERE `id_usuario`=".$_SESSION['id_usuario']." AND `id_parte_cuerpo`=".$id_gemelo;
        //Querys
               $select_brazo_query=mysqli_query($conexion,$select_brazo_sql);
               $select_antebrazo_query=mysqli_query($conexion,$select_antebrazo_sql);
               $select_pectoral_query=mysqli_query($conexion,$select_pectoral_sql);
               $select_cintura_query=mysqli_query($conexion,$select_cintura_sql);
               $select_cadera_query=mysqli_query($conexion,$select_cadera_sql);
               $select_cuadricep_query=mysqli_query($conexion,$select_cuadricep_sql);
               $select_gemelo_query = mysqli_query($conexion,$select_gemelo_sql);
    //Inicializamos los Arrays
	$bicep_array=array();
	$antebrazo_array=array();
	$pectoral_array=array();
	$cintura_array=array();
	$cadera_array=array();
	$cuadricep_array=array();
	$gemelo_array=array();
	//Rellenamos los Arrays
	while($brazo_data = mysqli_fetch_array($select_brazo_query))
                {
                 array_push($bicep_array,$brazo_data['cm']);
                }
	while($antebrazo_data = mysqli_fetch_array($select_antebrazo_query))
                {
                 array_push($antebrazo_array,$antebrazo_data['cm']);
                }
    while($pectoral_data = mysqli_fetch_array($select_pectoral_query))
                {
                 array_push($pectoral_array,$pectoral_data['cm']);
                }
    while($cintura_data = mysqli_fetch_array($select_cintura_query))
                {
                 array_push($cintura_array,$cintura_data['cm']);
                }
    while($cadera_data = mysqli_fetch_array($select_cadera_query))
			    {
			     array_push($cadera_array,$cadera_data['cm']);
			    }
    while($cuadricep_data = mysqli_fetch_array($select_cuadricep_query))
			    {
			     array_push($cuadricep_array,$cuadricep_data['cm']);
			    }
    while($gemelo_data = mysqli_fetch_array($select_gemelo_query))
			    {
			     array_push($gemelo_array,$gemelo_data['cm']);
			    }
	//Incluimos la libreria de graficos
	require_once ('../libs/jpgraph/src/jpgraph.php');
	require_once ('../libs/jpgraph/src/jpgraph_line.php');
		
		// Creamos el grafico
		$grafico = new Graph(1000,500,"auto");
		$grafico->SetScale('textlin');
		$grafico->img->SetAntiAliasing();
		$grafico->xgrid->Show(); 
		// Ajustamos los margenes del grafico
		$grafico->SetMargin(40,30,30,40);
		 
		// Creamos barras de datos a partir del array de datos
		$bplot = new LinePlot($bicep_array); //Medidas de bicep
		$aplot = new LinePlot($antebrazo_array);//Medidas de antebrazo
		$pplot = new LinePlot($pectoral_array);//Medidas de Pectoral
		$cplot = new LinePlot($cintura_array); //Medidas Cintura
		$caplot = new LinePlot($cadera_array); //Medidas Cadera
		$cuplot = new LinePlot($cuadricep_array); //Medidas Cuadriceps
		$geplot = new LinePlot($gemelo_array); //Medidas Gemelo
		//leyendas
		$bplot->SetLegend("Bicep");
		$aplot->SetLegend("Antebrazo");
		$pplot->SetLegend("Pectoral");
		$cplot->SetLegend("Cintura");
		$caplot->SetLegend("Cadera");
		$cuplot->SetLegend("Cuadricep");
		$geplot->SetLegend("Gemelo");
		//$lineplot=new LinePlot($data_array);
		//$lineplot->SetColor("black");
		//$lineplot->SetWeight(2);
		// Configuramos color de las barras 
		$bplot->SetColor('#479CC9');

		// Queremos mostrar el valor numerico de la barra
		$bplot->value->Show();

		//Añadimos barra de datos al grafico
		$grafico->Add($bplot);
		$grafico->Add($aplot);
		$grafico->Add($pplot);
		$grafico->Add($cplot);
		$grafico->Add($caplot);
		$grafico->Add($cuplot);
		$grafico->Add($geplot);
		//$grafico->Add($lineplot);
		// Configuracion de los titulos
		$grafico->title->Set('Evolucion');
		$grafico->xaxis->title->Set('Medicion');
		//$grafico->xaxis->hide();
		$grafico->yaxis->title->Set('cm');
		 
		$grafico->title->SetFont(FF_FONT1,FS_BOLD);
		$grafico->yaxis->title->SetFont(FF_FONT1,FS_BOLD);
		$grafico->xaxis->title->SetFont(FF_FONT1,FS_BOLD);
		 
		// Se muestra el grafico
		$grafico->Stroke();
		?>