<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ODS | Home</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/element.css" rel="stylesheet">
    <link rel="stylesheet" href="../font awesome/css/all.min.css">
    <link href="https://fonts.googleapis.com/css?family=Caveat+Brush" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Source+Serif+Pro" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <script src="js/jquery-2.1.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </head>

<body>
<section id="header">
 <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
      <div class="navbar-header">
        <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.jsp">Organization Of</br><span class="well_1">Disaster Safety</span></a>
      </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-center">
          <li class="active"><a href="index.jsp">Home</a></li>
          <li><a href="inDanger.jsp">In Danger?</a></li>
          <li>
            <a href="news.jsp">News</a>
        </li>
          <li><a href="contacts.jsp">Contacts</a></li>
          <li><a href="weather.html">Weather</a></li>
          <li><a href="../Admin/index.jsp">Admin</a></li>
        </ul>
        <ul class="navbar-right">
          <li class="dropdown"><a class="text_1 pad_1" href="#" data-toggle="dropdown"><span class="fas fa-search"></span></a>
            <ul class="dropdown-menu drop_inner" style="min-width:100%;">
              <li>
                <div class="row_1">
                  <div class="col-sm-12">
                    <form class="navbar-form navbar-left" role="search">
                      <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search">
                        <span class="input-group-btn">
                          <button class="btn btn-primary" type="button">Go!</button>
                        </span>
                      </div>
                    </form>
                  </div>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</section>

<section id="center" class="clearfix">
 <div class="container">
  <div class="row">
   <div class="col-sm-12 padding_all">
    <div class="col-sm-12">
      <div class="center_1">
        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class=""></li>
            <li data-target="#carousel-example-generic" data-slide-to="1" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
          </ol>
          <div class="carousel-inner">
            <div class="item">
              <img src="image/1.jpg" alt="...">
              <div class="carousel-caption">
                <h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</br> Integer nec odionec odio. cursus ante dapibus</h2>
              </div>
            </div>
            <div class="item active">
              <img src="image/1.jpg" alt="...">
              <div class="carousel-caption">
                <h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</br>  Integer nec odionec odio. cursus ante dapibus</h2>
              </div>
            </div>
            <div class="item">
              <img src="image/1.jpg" alt="...">
              <div class="carousel-caption">
                <h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</br>  Integer nec odionec odio. cursus ante dapibus</h2>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="resources">
        <h2>Resources</h2>
        <div class="resource-item">
            <i class="fas fa-fire-extinguisher"></i>
            <p>Fire Safety</p>
        </div>
        <div class="resource-item">
            <i class="fas fa-broadcast-tower"></i>
            <p>Alert Systems</p>
        </div>
        <div class="resource-item">
            <i class="fas fa-first-aid"></i>
            <p>First Aid</p>
        </div>
        <div class="resource-item">
            <i class="fas fa-ambulance"></i>
            <p>Emergency Services</p>
        </div>
        <div class="resource-item">
            <i class="fas fa-hard-hat"></i>
            <p>Safety Training</p>
        </div>
   </div>
  </div>
 </div>
</section>

<section id="footer">
            <div class="col-sm-12 padding_all">
                <div class="footer_inner clearfix">
                    <div class="col-sm-10">
                        <div class="footer_8">
                            <p><b id="year"></b>&#169 All Rights Reserved. Developed by
                                <a href="#">Group III</a>
                            </p>
                        </div>
                    </div>
                    <div class="col-sm-2"></div>
                </div>
            </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
<script src="js/script.js"></script>
<script>
  const year = new Date().getFullYear();
  document.getElementById('year').textContent = year;
</script>

</body>
</html>
