<?php
extract($_REQUEST);
include 'includes/header_index.php';
?>

<!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h1>Hello, world!</h1>
        <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
        <h5><a class="btn btn-primary btn-lg" href="registro.php" role="button">Registrate &raquo;</a> o si ya tienes cuenta haz <a href="login.php">login</a></h5>
      </div>
    </div>

 <!-- Header Carousel -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill" style="background-image:url('media/slider/1.jpg');"></div>
                <div class="carousel-caption">
                    <h2>Haz ejercicio</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('media/slider/2.jpg');"></div>
                <div class="carousel-caption">
                    <h2>Come sano</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('media/slider/3.jpg');"></div>
                <div class="carousel-caption">
                    <h2>Obten resultados</h2>
                </div>
            </div>
        </div>

     <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header>
  <div class="container">
            <div class="row">
                <div class="col-xs-18 col-lg-12 text-center">
                    <h2 class="section-heading">Nuestro equipo</h2>
                    <h3 class="section-subheading text-muted">......</h3>
                </div>
            </div>
 <!-- Service List -->
 <!-- Service List -->
        <!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->    
                   <div class="col-md-4">
                <div class="media">
                    <div class="pull-left">
                        <span class="fa-stack fa-2x">
                             <img src="media/img/icon/mancuerna.png" class="img-responsive img-circle" alt="" width="56px" height="56px">
                        </span> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Service One</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo itaque ipsum sit harum.</p>
                    </div>
                </div>
                <div class="media">
                    <div class="pull-left">
                        <span class="fa-stack fa-2x">
                               <img src="media/img/icon/peso.png" class="img-responsive img-circle" alt="" width="56px" height="56px">
                        </span> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Service Two</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo itaque ipsum sit harum.</p>
                    </div>
                </div>
                <div class="media">
                    <div class="pull-left">
                        <span class="fa-stack fa-2x">
                               <img src="media/img/icon/dieta.png" class="img-responsive img-circle" alt="" width="56px" height="56px">
                        </span> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Service Three</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo itaque ipsum sit harum.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="media">
                    <div class="pull-left">
                        <span class="fa-stack fa-2x">
                               <img src="media/img/icon/metas.png" class="img-responsive img-circle" alt="" width="56px" height="56px"></i>
                        </span> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Service Four</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo itaque ipsum sit harum.</p>
                    </div>
                </div>
                <div class="media">
                    <div class="pull-left">
                        <span class="fa-stack fa-2x">
                              <img src="media/img/icon/servicio.png" class="img-responsive img-circle" alt="" width="56px" height="56px">
                        </span> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Service Five</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo itaque ipsum sit harum.</p>
                    </div>
                </div>
                <div class="media">
                    <div class="pull-left">
                        <span class="fa-stack fa-2x">
                              <img src="media/img/icon/resultados.png" class="img-responsive img-circle" alt="" width="56px" height="56px">
                        </span> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Service Six</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo itaque ipsum sit harum.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="media">
                    <div class="pull-left">
                        <span class="fa-stack fa-2x">
                              <img src="media/img/icon/mesura.png" class="img-responsive img-circle" alt="" width="56px" height="56px">
                        </span> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Service Seven</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo itaque ipsum sit harum.</p>
                    </div>
                </div>
                <div class="media">
                    <div class="pull-left">
                        <span class="fa-stack fa-2x">
                              <img src="media/img/icon/progreso.png" class="img-responsive img-circle" alt="" width="56px" height="56px">
                        </span> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Service Eight</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo itaque ipsum sit harum.</p>
                    </div>
                </div>
                <div class="media">
                    <div class="pull-left">
                        <span class="fa-stack fa-2x">
                              <img src="media/img/icon/free.png" class="img-responsive img-circle" alt="" width="56px" height="56px">
                        </span> 
                    </div>
                    <div class="media-body">
                        <h4 class="media-heading">Service Nine</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo itaque ipsum sit harum.</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
          <!-- Team Section -->
    <section id="team" >
        <div class="container">
            <div class="row">
                <div class="col-xs-18 col-lg-12 text-center">
                    <h2 class="section-heading">Nuestro equipo</h2>
                    <h3 class="section-subheading text-muted">......</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-18 col-sm-4">
                    <div class="team-member">
                        <img src="media/team/marc.jpg" class="img-responsive img-circle" alt="" >
                        <h4>Marc Petit</h4>
                        <p class="text-muted">Progamador</p>
                        <ul class="list-inline social-buttons">
                     <li><a href=""><img src="media/img/social/twitter.png" width="42px" align="42px" ></a></li>
                     <li><a href=""><img src="media/img/social/face.png" width="42px" align="42px"></i></a></li>
                     <li><a href=""><img src="media/img/social/insta.png" width="42px" align="42px"></i></a></li>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-18 col-sm-4">
                    <div class="team-member">
                        <img src="media/team/eric.jpg" class="img-responsive img-circle" alt="">
                        <h4>Eric Petit</h4>
                        <p class="text-muted">Diseñador</p>
                        <ul class="list-inline social-buttons">
                            <li><a href=""><img src="media/img/social/twitter.png" width="42px" align="42px" ></a></li>
                            <li><a href=""><img src="media/img/social/face.png" width="42px" align="42px"></i></a></li>
                            <li><a href=""><img src="media/img/social/insta.png" width="42px" align="42px"></i></a></li>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-xs-18 col-sm-4">
                    <div class="team-member">
                        <img src="media/team/miguel.jpg" class="img-responsive img-circle" alt="">
                        <h4>Miguel López</h4>
                        <p class="text-muted">Progamador</p>
                        <ul class="list-inline social-buttons">
                            <li><a href=""><img src="media/img/social/twitter.png" width="42px" align="42px" ></a></li>
                            <li><a href=""><img src="media/img/social/face.png" width="42px" align="42px"></i></a></li>
                            <li><a href=""><img src="media/img/social/insta.png" width="42px" align="42px"></i></a></li>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <p class="large text-muted">Nuestro equipo esta lleno de ganas de seguir creciendo y mejorando. Somos un grupo joven que intenta hacerse un hueco en la programación.</p>
                </div>
            </div>
           
                
            
        </div>
      </div>  
    </section>
    <div class="container">
     <!-- Content Row -->
        <div class="row">
            <!-- Map Column -->
            <div class="col-sm-8">
                <!-- Embedded Google Map -->
                <iframe width="100%" height="400px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2995.117796239807!2d2.1053296150804974!3d41.34979327926755!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12a498d64bd023fd%3A0x26089fc39cb352a3!2sJesu%C3%AFtes+Bellvitge.+Centre+d&#39;Estudis+Joan+XXIII!5e0!3m2!1ses!2ses!4v1494264988995"></iframe>
            </div>
            <!-- Contact Details Column -->
            <div class="col-sm-4">
                <h3>Contact Details</h3>
                <p>
                    3481 Melrose Place<br>Beverly Hills, CA 90210<br>
                </p>
                <p><i class="fa fa-phone"></i> 
                    <abbr title="Phone">P</abbr>: (123) 456-7890</p>
                <p><i class="fa fa-envelope-o"></i> 
                    <abbr title="Email">E</abbr>: <a href="mailto:name@example.com">name@example.com</a>
                </p>
                <p><i class="fa fa-clock-o"></i> 
                    <abbr title="Hours">H</abbr>: Monday - Friday: 9:00 AM to 5:00 PM</p>
                <ul class="list-unstyled list-inline list-social-icons">
                    <li>
                        <a href="#"><i class="fa fa-facebook-square fa-2x"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-linkedin-square fa-2x"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-twitter-square fa-2x"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-google-plus-square fa-2x"></i></a>
                    </li>
                </ul>
            </div>
        </div>
      </div>
        <!-- /.row -->


      <hr>

<?php 
		include 'includes/footer_azul.php'
?>
