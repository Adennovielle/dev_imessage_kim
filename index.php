<?php
/*********************************************************************
    index.php

    Helpdesk landing page. Please customize it to fit your needs.

    Peter Rotich <peter@osticket.com>
    Copyright (c)  2006-2013 osTicket
    http://www.osticket.com

    Released under the GNU General Public License WITHOUT ANY WARRANTY.
    See LICENSE.TXT for details.

    vim: expandtab sw=4 ts=4 sts=4:
**********************************************************************/
// require('client.inc.php');
require('popup.php');
// require_once INCLUDE_DIR . 'class.page.php';

$section = 'home';
// require(CLIENTINC_DIR.'header.inc.php');
// session_start();

define('ROOT_PATH', 'http://localhost/dev_imessage_kim_2/');
?>


<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">

    <title>Securities and Exchange Commission</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!--

TemplateMo 570 Chain App Dev

https://templatemo.com/tm-570-chain-app-dev

-->

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="assets/css/adolf-css.css">
    <link rel="stylesheet" href="assets/css/animated.css">
    <link rel="stylesheet" href="assets/css/owl.css">

  </head>

<body>

  <!-- ***** Preloader Start ***** -->
  <!-- <div id="js-preloader" class="js-preloader">
    <div class="preloader-inner">
      <span class="dot"></span>
      <div class="dots">
        <span></span>
        <span></span>
        <span></span>
      </div>
    </div>
  </div> -->
  <!-- ***** Preloader End ***** -->

  <!-- ***** Header Area Start ***** -->

 <?php 
 /* 
  <header id="client-index" class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
    <div class="container">
      <div class="row">
        <div class="col-12">
          <nav class="main-nav">
            <!-- ***** Logo Start ***** -->
            <a href="index.html" class="logo">
              <img src="assets/images/logo.png" alt="Securities and Exchange Commission">
            </a>
            <!-- ***** Logo End ***** -->
            <!-- ***** Menu Start ***** -->
            <ul class="nav">
              <li class="scroll-to-section"> <a href="<?php echo ROOT_PATH; ?>open.php">Open New ticket</a></li>
              <li class="scroll-to-section"><a href="<?php echo ROOT_PATH; ?>tickets.php">Tickets</a></li>
	      <li class="scroll-to-section"><a href="<?php echo ROOT_PATH; ?>bydepartment.php">Services By Department</a></li>
	     <li class="scroll-to-section"><a href="/assets/images/iMessageUsersManual-Public.pdf" target="_blank">
<i class="fa fa-file-pdf"></i> User Manual
    </a></li>
            
 <?php
		//  if ($thisclient && is_object($thisclient) && $thisclient->isValid() && !$thisclient->isGuest()) {
    //             echo '<li><a href="'.ROOT_PATH.'bydepartment.php">Services By Department</a></li>';
    //             echo '<li><div class="gradient-button"><a href="'.$signout_url.'">Sign Out</a></div></li>';
    //         } elseif ($thisclient && $thisclient->isValid() && $thisclient->isGuest()) {
    //             echo '<li><div class="gradient-button"><a href="'.$signout_url.'">Sign Out</a></div></li>';
    //         } elseif ($cfg->getClientRegistrationMode() != 'disabled') {
    //             echo '<li><div class="gradient-button"><a href=view.php><i class="fa fa-sign-in-alt"></i> Sign In</a></div></li>';
    //         }
// echo '<li><a href="'.ROOT_PATH.'bydepartment.php">Services By Department</a></li>';
// echo '<li><div class="gradient-button"><a href="#">Sign Out</a></div></li>';
// echo '<li><div class="gradient-button"><a href="view.php"><i class="fa fa-sign-in-alt"></i> Sign In</a></div></li>';
?> 
            </ul>        
            <a class='menu-trigger'>
                <span>Menu</span>
            </a>
            <!-- ***** Menu End ***** -->
          </nav>
        </div>
      </div>
    </div>
  </header>
  <!-- ***** Header Area End ***** -->
 */
 ?> 

 
  
  <div id="modal" class="popupContainer" style="display:none;">
    <div class="popupHeader">
        <span class="header_title">Login</span>
        <span class="modal_close"><i class="fa fa-times"></i></span>
    </div>

    <section class="popupBody">
        <!-- Social Login -->
<div class="col-md-12">
<form action="view.php">
     <button id="includeButton" class="btn btn-lg btn-block btn-primary"
              type="submit"><i class="fa fa-lock me-2"></i> Sign in with eSecure</button>
</form>
</div>
           
        </div>

        <!-- Username & Password Login form -->
        <div class="user_login">
           <form action="view.php">

     		<button id="includeButton" class="btn btn-lg btn-block btn-primary"
              type="submit"><i class="fa fa-lock me-2"></i> Sign in with eSecure</button>
	    </form>
        </div>

        <!-- Register Form -->
        <div class="user_register">
            <form>
                <label>Full Name</label>
                <input type="text" />
                <br />

                <label>Email Address</label>
                <input type="email" />
                <br />

                <label>Password</label>
                <input type="password" />
                <br />

                <div class="checkbox">
                    <input id="send_updates" type="checkbox" />
                    <label for="send_updates">Send me occasional email updates</label>
                </div>

                <div class="action_btns">
                    <div class="one_half"><a href="#" class="btn back_btn"><i class="fa fa-angle-double-left"></i> Back</a></div>
                    <div class="one_half last"><a href="#" class="btn btn_red">Register</a></div>
                </div>
            </form>
        </div>
    </section>
</div>

  <div id="client-index-hero">
    <div class="container" id="left-content">
      <div>
        <div >
          <div >
            <div >
              <div >
                <div >
                  <div >
                <img src="assets/images/slider-dec.png" alt="">
              </div>
                  <div id="hero-text">
                    <h2>Your voice matters to us!</h2>
                    <p>Whether you're sharing feedback, reporting an issue, or submitting a complaint, we’re here to <br> listen and help resolve it quickly. We take every ticket seriously and are committed to improving <br> your experience.</p>
                  </div>
                  <div id="hero-buttons">
                    <div >
                      <a href="<?php echo ROOT_PATH; ?>open.php">Open a New Ticket </a>
                    </div>
                    <div >
                      <a href="<?php echo ROOT_PATH; ?>tickets.php">Check Ticket Status </i></a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div >
              
            </div>
          </div>
        </div>
      </div>
    </div>

    <div id="right-content" >
      <div class="">
         <div >
        <img src="assets/images/sec-logo.png" alt="">
      </div>

    <div id="text">
      <h2>Welcome to iMessage</h2>
      <p><b class="bold-text">iMessage</b> is a secure messaging platform designed for communication within the SEC <br> ecosystem.</p>
    </div>
    <hr>
<div class="login-btn-box">
<button id="login-btn">LOGIN WITH ESECURE <img src="assets/images/login.png" alt=""></button>
</div>

      </div>
     
    </div>
  </div>

   </div>
  

  <div id="footer">
    <div class="grid-box">
           <div class="gov-seal-img-box col" >
              <img src="assets/images/gov-ph-seal-footer.png" alt="">
          </div>
          <div class=" col" >
              <h6>Republic of the Philippines</h6>
              <p>All content is in the public domain unless <br>
otherwise stated.</p>
          </div>
          <div class=" col" >
              <h6>About SEC-EASE</h6>
              <p>Exceptional and Alternative Submissions Environment (EASE)</p>
               <ul>
                  <li><a href="https://www.sec.gov.ph/">SEC Website</a></li>
                  <li><a href="https://www.gov.ph/">GOVPH</a></li>
                  <li><a href="#">Open Data Portal</a></li>
                  <li><a href="https://www.officialgazette.gov.ph/">Official Gazette</a></li>
              </ul>
          </div>
          <div class="col" >
              <h6>SEC Online Services</h6>
              <ul>
              <li><a href="https://www.sec.gov.ph/sec-esecure/">eSECURE</a></li>
              <li><a href="https://esparc.sec.gov.ph/">eSPARC</a></li>
              <li><a href="https://secexpress.ph">eFAST</a></li>
              <li><a href="https://esearch.sec.gov.ph/user/login">eSEARCH</a></li>
              <li><a href="https://espaysec.sec.gov.ph/payment-portal/home">eSPAYSEC</a></li>
              <li><a href="https://mc28.sec.gov.ph/mc28-list-temp/SecuritiesandExchangeCommission">MC28 Submission</a></li>
            </ul>
          </div>
        </div>
      <div class="col copyright">
        Securities and Exchange Commission @ 2026
      </div>
    </div>


  <!-- Scripts -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/js/owl-carousel.js"></script>
  <script src="assets/js/animation.js"></script>
  <script src="assets/js/imagesloaded.js"></script>
  <script src="assets/js/popup.js"></script>
  <script src="assets/js/custom.js"></script>
</body>
</html>
