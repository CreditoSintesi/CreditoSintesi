--  |||||||||||||||||||||Insert de ejercicios||||||||||||||||||||||||

-- tipo pecho---

INSERT INTO `tbl_ejercicio` (`id_ejercicio`, `nombre_ejercicio`, `id_tipo_ejercicio`, `img_ejercicio`, `descripcion_ejercicio`) 

VALUES ('1', 'Prensa de Pecho en Banco', '1', '\\Media\\rutinas\\1.gif', 'Recuéstate de espalda sobre un banco y sujeta 2 mancuernas al nivel del pecho, a los lados del cuerpo, con las palmas apuntando hacia tus pies. Eleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa. Exhala al levantar las mancuernas e inhala al bajarlas.');

VALUES ('2', 'Prensa de Pecho en Banco (Empuñadura Neutral)', '1', '\\Media\\rutinas\\2.gif', 'Recuéstate de espalda sobre un banco y sujeta 2 mancuernas al nivel del pecho, a los lados del cuerpo, con las palmas apuntando una hacia otra. Eleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa. Exhala al levantar las mancuernas e inhala al bajarlas.');

VALUES ('3', 'Prensa de Pecho en Banco - Inclinada', '1', '\\Media\\rutinas\\3.gif','Recuéstate de espalda sobre un banco inclinado y sujeta 2 mancuernas al nivel del pecho, a los lados del cuerpo, con las palmas apuntando hacia adelante. Eleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa. Exhala al levantar las mancuernas e inhala al bajarlas.');

VALUES ('4', 'Prensa de Pecho en Banco - Inclinada (Empuñadura Neutral)', '1', '\\Media\\rutinas\\4.gif','Recuéstate de espalda sobre un banco inclinado y sujeta 2 mancuernas al nivel del pecho, a los lados del cuerpo, con las palmas apuntando una hacia otra. Eleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa. Exhala al levantar las mancuernas e inhala al bajarlas.');

VALUES ('5', 'Prensa de Pecho en Banco - Declinada', '1', '\\Media\\rutinas\\5.gif','Recuéstate de espalda sobre un banco declinado y sujeta 2 mancuernas al nivel del pecho, con las palmas apuntando hacia adelante. Eleva las mancuernas en forma recta hacia arriba hasta que tus codos se encuentren cerca de trabarse y bájalas lentamente luego de una breve pausa. Exhala al levantar las mancuernas e inhala al bajarlas.');

VALUES ('6', 'Apertura - Recostado', '1', '\\Media\\rutinas\\6.gif', 'Recuéstate de espalda sobre el banco y coge una mancuerna con cada mano a la altura del cuerpo, con tus codos ligeramente arqueados. Eleva las mancuernas hasta que estén lado a lado por encima de tu cuerpo y luego de una breve pausa bájalas lentamente. Intenta mantener el mismo ángulo en tus codos durante todo el movimiento.');

VALUES ('7', 'Apertura - Inclinada', '1', '\\Media\\rutinas\\7.gif', 'Recuéstate de espalda sobre un banco inclinado y coge una mancuerna con cada mano a la altura del cuerpo, con tus codos ligeramente arqueados. Eleva las mancuernas hasta que estén lado a lado por encima de tu cuerpo y luego de una breve pausa bájalas lentamente. Intenta mantener el mismo ángulo en tus codos durante todo el movimiento.');

VALUES ('8', 'Pullover – Brazos Rectos', '1', '\\Media\\rutinas\\8.gif', 'Recuéstate de espalda sobre uno de los extremos del banco y sujeta una mancuerna con ambas manos por sobre el área de tu pecho, con los brazos extendidos. Eleva la mancuerna hacia arriba en forma recta, hasta que tus brazos estén perpendiculares al suelo y bájala nuevamente luego de una breve pausa. Mantén tus brazos extendidos a lo largo de todo el movimiento, conservando el ángulo de tus codos.');

VALUES ('9', 'Pullover – Brazos Flexionados', '1', '\\Media\\rutinas\\9.gif', 'Recuéstate de espalda sobre uno de los extremos del banco y sujeta 2 mancuernas por debajo del nivel de tu cabeza, con los codos formando un ángulo de 90 grados. Eleva ambas mancuernas hasta que estén próximas a tu pecho, mientras mantienes un ángulo de 90 grados en tus codos, y luego de una breve pausa bájalas nuevamente. Exhala al levantar las mancuernas e inhala al bajarlas.');

-- tipo abdominal --

VALUES ('10', 'Encogimientos - Con Carga', '1', '\\Media\\rutinas\\10.gif', 'Recuéstate de espalda sobre un banco y sujeta una mancuerna por encima de tu pecho. Eleva la parte superior de tu cuerpo hasta que tus omóplatos dejen de tocar el banco y luego de una breve pausa vuelve a bajarlo. Para evitar tirar de tu cuello con tus manos, mira recto hacia adelante en lugar de mirar a tus rodillas.');

VALUES ('11', 'Elevaciones de Piernas - Con Carga', '1', '\\Media\\rutinas\\11.gif', 'Recuéstate de espalda sobre el banco, con tus manos agarrando los costados del mismo y sujeta una mancuerna entre tus pies. Eleva tus piernas hacia arriba hasta que estén perpendiculares al suelo, y luego de una breve pausa bájalas. Intenta mantener tus piernas extendidas conservando tus rodillas con el mismo ángulo.');

VALUES ('12', 'Encogimientos - Con Carga', '1', '\\Media\\rutinas\\12.gif', 'Sujeta una mancuerna con una mano, al costado de tu cuerpo.Inclina la parte superior de tu cuerpo hacia el costado en el que sostienes la mancuerna, y luego de una breve pausa, vuelve a la posición inicial. Completa tu serie y cambia de lado. Ten cuidado de no inclinar demasiado profundamente tu cuerpo hacia los costados, desde donde puede resultar dificultoso volver a enderezarte.');

-- tipo 







INSERT INTO `tbl_rutina` (`id_rutina`, `nombre_rutina`, `duracion_rutina`, `id_objetivo`, `descripcion`, `sesiones_semana_rutina`, `id_especialista`)
 VALUES ('1', 'Rutinas de Entrenamiento con Mancuernas', '4', '5', 'Las rutinas de entrenamiento que son presentadas aquí pueden ser desarrolladas utilizando ejercicios con mancuernas, y te permitirán alcanzar los músculos de una región específica de tu cuerpo. Son presentados aquí para resaltar cuán efectivo puede resultar un entrenamiento basado en ejercicios con mancuernas. ', '3', NULL);

