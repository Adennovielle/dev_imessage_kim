<?php
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

?>
<h1><?php echo Format::display($title); ?></h1>
<p><?php echo Format::display($body); ?></p>
</br>
<form action="view.php">
<div class="col-md-12">
     <button id="includeButton" class="btn btn-lg btn-block btn-primary" 
            type="submit"><i class="fa fa-lock me-2"></i> Sign in with eSecure</button>
</div>
</form>
