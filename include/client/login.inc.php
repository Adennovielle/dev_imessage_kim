<?php /*
//include_once('keycloak.php');
if (!defined('OSTCLIENTINC'))
    die('Access Denied');

$email = Format::input($_POST['luser'] ?: $_GET['e']);
$passwd = Format::input($_POST['lpasswd'] ?: $_GET['t']);

$content = Page::lookupByType('banner-client');

if ($content) {
    list($title, $body) = $ost->replaceTemplateVariables(
            array($content->getLocalName(), $content->getLocalBody()));
} else {
    $title = __('Sign In');
    $body = __('To better serve you, we encourage our clients to register for an account and verify the email address we have on record.');
}

*/?>
<!-- 
<h1><?php /*echo Format::display($title); */?></h1>
<p><?php /*echo Format::display($body); */?></p>
</br>
<form action="view.php">
<div class="col-md-12">
     <button id="includeButton" class="btn btn-lg btn-block btn-primary" 
            type="submit"><i class="fa fa-lock me-2"></i> Sign in with eSecure</button>
</div>
</form> -->

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  </head>
</head>
<body>
<div class="login-bg">
<section class="container wrapper login">

  <div class="login-card">

    <div class="icon-circle">
      <i class="bi bi-lock fs-3 text-success"></i>
    </div>

    <h4 class="fw-bold">Secure Sign In</h4>

    <p class="text-muted">
      Sign in securely using your eSecure account to access our client portal.
    </p>

    <hr>

    <button class="btn-secure">
      <i class="bi bi-lock "></i> Sign in with eSecure
    </button>

    <div class="secure-text d-flex align-items-center justify-content-center ">
      <i class="bi bi-shield-check text-success me-2 text-bg-success fs-5"></i>
      Your information is protected with industry-standard security and encryption.
    </div>

  </div>

</section>
</div>
</body>
</html>
