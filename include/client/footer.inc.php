<?php 
/* 
</div>
 <footer id="newsletter">
    <div class="container">
      <div class="row">
         <div class="col-lg-3">
          <div class="footer-widget">
            <img src="assets/images/gov-ph-seal-footer.png" alt="">
          </div>
        </div>
        <div class="col-lg-3">
          <div class="footer-widget">
            <h4>The SEC Headquarters</h4>
            <p>7907 Makati Avenue, Salcedo Village, Bel-Air, Makati City, 1209</p>
            <p>(02) 5322-7696</p>
            <p><a href="#"></a></p>
          </div>
        </div>
       
        <div class="col-lg-3">
          <div class="footer-widget">
            <h4>Online Services</h4>
            <ul>
              <li><a href="https://www.sec.gov.ph/sec-esecure/">eSECURE</a></li>
              <li><a href="https://esparc.sec.gov.ph/">eSPARC</a></li>
              <li><a href="https://eramp.sec.gov.ph/">eRAMP</a></li>
              <li><a href="https://eamend.sec.gov.ph/login">eAMEND</a></li>
              <li><a href="https://espaysec.sec.gov.ph/">eSPAYSEC</a></li>
              
            </ul>
            <ul>
            <li><a href="https://esearch.sec.gov.ph/">eSEARCH</a></li>
              <li><a href="https://portal.sec.gov.ph/">API Maketplace</a></li>
              <li><a href="https://checkwithsec.sec.gov.ph/">Chec with SEC</a></li>
              <li><a href="https://efast.sec.gov.ph">SEC Electronic Filing and Submission Tool</a></li>
              <li><a href="https://mc28.sec.gov.ph">MC28 Submission Portal</a></li>
              <li><a href="https://eramp.sec.gov.ph/">eRAMP</a></li>
            </ul>
          </div>
        </div>
        <div class="col-lg-3">
          <div class="footer-widget">
            <h4>About Our Company</h4>
            <div class="logo">
              <img src="assets/images/logo-white.png" alt="">
            </div>
            <ul>
            <li><a href="https://www.sec.gov.ph/">SEC Website</a></li>
              <li><a href="https://www.gov.ph/">GOVPH</a></li>
              <li><a href="https://www.officialgazette.gov.ph/">Official Gazette</a></li>
            </ul>
          </div>
        </div>
        <div class="col-lg-12">
          <div class="copyright-text">
            <p>Copyright © 2025 Securities and Exchange Commission. All Rights Reserved. 
          </div>
        </div>
      </div>
    </div>
  </footer>

<!-- Scripts -->


  <!-- Scripts -->
<div id="overlay"></div>
<div id="loading">
    <h4><?php echo __('Please Wait!');?></h4>
    <p><?php echo __('Please wait... it will take a second!');?></p>
</div>
<?php
if (($lang = Internationalization::getCurrentLanguage()) && $lang != 'en_US') { ?>
    <script type="text/javascript" src="<?php echo ROOT_PATH; ?>ajax.php/i18n/<?php
        echo $lang; ?>/js"></script>
<?php } ?>
<script type="text/javascript">
    getConfig().resolve(<?php
        include INCLUDE_DIR . 'ajax.config.php';
        $api = new ConfigAjaxAPI();
        print $api->client(false);
    ?>);
</script>
</body>
</html>

*/
// echo "This is footer.inc.php";

?> 
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