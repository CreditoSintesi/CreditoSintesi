<?php 
	session_start();
 ?>

            <div class="col-sm-8" id ="sh_peso" name="sh_peso">
            <form input type="proc/add_peso.proc.php" method="POST">
               <table class="table table-striped" border>
                <thead>
                  <tr>
                    <th colspan="4">Añadir peso</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td >Ingrese su peso</td>
                    <td colspan="2"><input type="number" id="height" name="height" value="75"></td>
                    <td>KG</td>
                  </tr>
                  <tr>
                    <td colspan="2"><button class="btn btn-info" onclick="add_height()">+</button></td>
                    <td colspan="2"><button class="btn btn-info" onclick="rest_height()">-</button></td>
                  </tr>
                  <tr>
                    <td><input type="submit" value="Enviar"/></td>
                  </tr>
                </tbody>
              </table>
            </form>
          </div>