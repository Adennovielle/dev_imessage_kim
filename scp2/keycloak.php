<?php
session_start();
$client_id = 'osticket_agent';
$client_secret = 'ThicBeEWsi1yZ8cFuiNev5ZmWnOa6Z5E';
$redirect_uri = 'http://localhost/wordpress/osticket/scp/';
$metadata_url = 'https://localhost:8443/auth/realms/SEC/.well-known/openid-configuration';
$actual_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";

//Start Logout ------------------------------------------------------------->
/*if(!isset($_SESSION['appname']))
{

  session_destroy();
  unset($_SESSION['username']);
  unset($_SESSION['email']);
  unset($_SESSION['sub']);
  unset($_SESSION['start']);
  unset($_SESSION['token']);
  unset($_SESSION['state']);
  unset($_SESSION['code_verifier']);
  header('Location: http://localhost/wordpress/wp-admin');

}*/
//End Logout ------------------------------------------------------------->

//Start Keycloak ------------------------------------------------->
$metadata = http($metadata_url);

if(!isset($_GET['code'])) 
{

  $_SESSION['state'] = bin2hex(random_bytes(5));
  $_SESSION['code_verifier'] = bin2hex(random_bytes(50));
  $code_challenge = base64_urlencode(hash('sha256', $_SESSION['code_verifier'], true));

  $authorize_url = $metadata->authorization_endpoint.'?'.http_build_query([
    'response_type' => 'code',
    'client_id' => $client_id,
    'redirect_uri' => strtok($actual_link,'?'),
    'state' => $_SESSION['state'],
    'scope' => 'openid profile',
    'code_challenge' => $code_challenge,
    'code_challenge_method' => 'S256',
  ]);


  if(!isset($_SESSION['sub'])) 
    {
      header('Location: '.$authorize_url);
      die();
    }


} else {

  if($_SESSION['state'] != $_GET['state']) {
    die('Authorization server returned an invssalid state parameter');
  }

  if(isset($_GET['error'])) {
    die('Authorization server returned an error: '.htmlspecialchars($_GET['error']));
  }

  $response = http($metadata->token_endpoint, [
    'grant_type' => 'authorization_code',
    'code' => $_GET['code'],
    'redirect_uri' => strtok($actual_link,'?'),
    'client_id' => $client_id,
    'client_secret' => $client_secret,
    'code_verifier' => $_SESSION['code_verifier'],
  ]);

  if(!isset($response->access_token)) {

    die('Error fetching access token');
  }

  $userinfo = http($metadata->userinfo_endpoint, [
    'access_token' => $response->access_token,
  ]);

  if($userinfo->sub) 
  {
    $_SESSION['sub'] = $userinfo->sub;
    $_SESSION['username'] = $userinfo->preferred_username;
    $_SESSION['email'] = $userinfo->email;
/*    header("Location:index.php");*/
  }
  else
  {
    die();
  }

}



// Base64-urlencoding is a simple variation on base64-encoding
// Instead of +/ we use -_, and the trailing = are removed.
function base64_urlencode($string) {
  return rtrim(strtr(base64_encode($string), '+/', '-_'), '=');
}


function http($url, $params=false) 
{
  $ch = curl_init($url);
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
  curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0); // On dev server only!
  if($params)
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($params));
  return json_decode(curl_exec($ch));
}
//End Keycloak ------------------------------------------------------>


