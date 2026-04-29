<?php
date_default_timezone_set('Asia/Manila');
ini_set( 'session.cookie_httponly', 1 );
error_reporting(E_ERROR | E_PARSE);
header_remove("X-Powered-By");
session_start();
$client_id = 'imessage_intern';
$client_secret = '14xw3keeXAfnm53zq018KaAYUM1AChku';
// $redirect_uri = 'https://imessage.sec.gov.ph/';
$redirect_uri = 'http://localhost/dev_imessage_kim_2/keycloak.php';
$metadata_url = 'https://deviam.sec.gov.ph:8443/realms/SEC-Development/.well-known/openid-configuration';
// $actual_link = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
$actual_link = "http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
$metadata = http($metadata_url);

    // var_dump(!isset($_GET['code'])); exit;

if(!isset($_GET['code'])) 
{

  $_SESSION['state'] = bin2hex(random_bytes(5));
  $_SESSION['code_verifier'] = bin2hex(random_bytes(50));
  $code_challenge = base64_urlencode(hash('sha256', $_SESSION['code_verifier'], true));



  $authorize_url = $metadata->authorization_endpoint.'?'.http_build_query([
    'response_type' => 'code',
    'client_id' => $client_id,
    // 'redirect_uri' => strtok($actual_link,'?'),
    'redirect_uri' => $redirect_uri,
    'state' => $_SESSION['state'],
    'scope' => 'openid profile',
    'code_challenge' => $code_challenge,
    'code_challenge_method' => 'S256',
  ]);
    // var_dump(!isset($_SESSION['sub'])); exit;
  
    if(!isset($_SESSION['sub'])) 
    {     

	    header('Location: '.$authorize_url);
      
    }

    var_dump($authorize_url); exit;


// if (isset($_SESSION['sub']) && $_SESSION['sub'] === true) {
//   //  User is logged in
// header('Location:index.php');
//    echo 'User is logged in.';
// } else {
//     // User is not logged in
// header('Location:index.php');   
// echo 'User is not logged in.';
// }
} else {

  if($_SESSION['state'] != $_GET['state']) {
    die('Authorization server returned an invalid state parameter');
  }

  if(isset($_GET['error'])) {
    die('Authorization server returned an error: '.htmlspecialchars($_GET['error']));
  }
  
//   var_dump([
//     'SESSION code_verifier' => $_SESSION['code_verifier'],
//     'GET code' => $_GET['code'],
// ]);
// exit;

  $response = http($metadata->token_endpoint, [
    'grant_type' => 'authorization_code',
    'code' => $_GET['code'],
    'redirect_uri' => strtok($actual_link,'?'),
    // 'redirect_uri' => 'http://localhost/dev_imessage_kim_2/',
    'client_id' => $client_id,
    'client_secret' => $client_secret,
    'code_verifier' => $_SESSION['code_verifier'],
  ]);

  $redirect_uri = 'http://localhost/dev_imessage_kim_2/keycloak.php';
// var_dump($response); exit;
  var_dump([
    'reponse' => $response,
    'grant_type' => 'authorization_code',
    'code' => $_GET['code'],
    'redirect_uri' => strtok($actual_link,'?'),
    'client_id' => $client_id,
    'client_secret' => $client_secret,
    'code_verifier' => $_SESSION['code_verifier'],
  ]);
//  var_dump($response); exit;
    // var_dump($response->access_token); exit;


    // var_dump(!isset($response->access_token)) ; exit;
  if(!isset($response->access_token)) {
    die('Error fetching access tokenz');
  }

  $userinfo = http($metadata->userinfo_endpoint, [
    'access_token' => $response->access_token,
  ]);

  if($userinfo->sub) 
  {
    $_SESSION['sub'] = $userinfo->sub;
    $_SESSION['username'] = $userinfo->preferred_username;
    $_SESSION['email'] = $userinfo->email;
    $date_format = date("Y-m-d H:i:s");
    //testing insert;
    date_default_timezone_set('Asia/Manila');
    $conn = new mysqli('localhost', 'root', 'root', 'dev_imessage_kim');
    if (mysqli_connect_errno()) 
      {
        die('Unable to connect to database' . mysqli_connect_error());
      }
    $stmt = $conn->prepare("CALL AutoRegister(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
    $stmt->bind_param("ssssssssssssssssssss", 
	$userinfo->email,
	$userinfo->name,
	$date_format,
	$userinfo->preferred_username,
	$userinfo->birthdate,
	$userinfo->building_name,
	$userinfo->gender,
	$userinfo->unit_room_floor_building,
	$userinfo->mobile,
	$userinfo->middlename,
	$userinfo->zip_code,
	$userinfo->street_name,
	$userinfo->cityMunicipality,
	$userinfo->province,
	$userinfo->lot_block_phase_houseno,
	$userinfo->town_district,
	$userinfo->region,
	$userinfo->barangay,
	$userinfo->subdivision_village_zone,
	$userinfo->tin
	);
    $stmt->execute();
    header("Location:open.php");
  }
  else
  {
    session_destroy();
    unset($_SESSION['username']);
    unset($_SESSION['email']);
    unset($_SESSION['sub']);
    unset($_SESSION['start']);
    unset($_SESSION['token']);
    unset($_SESSION['state']);
    unset($_SESSION['code_verifier']);
    header('Location: https://imessage.sec.gov.ph/');
  }

}



// Base64-urlencoding is a simple variation on base64-encoding
// Instead of +/ we use -_, and the trailing = are removed.
function base64_urlencode($string) {
  return rtrim(strtr(base64_encode($string), '+/', '-_'), '=');
}


// function http($url, $params=false) 
// {
//   $ch = curl_init($url);
//   curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
//   curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0); // On dev server only!
//   if($params)
//     curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($params));
//   return json_decode(curl_exec($ch));
// }
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


//Start Get User Details --------------------------------------------->
if (isset($_SESSION['username'])) 
{
 
}
//End Get User Details --------------------------------------------->


