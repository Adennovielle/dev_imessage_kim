<?php /*
// echo "test"; exit;
$title=($cfg && is_object($cfg) && $cfg->getTitle())
    ? $cfg->getTitle() : 'iMessage :: '.__('Ticket System');
$signin_url = ROOT_PATH . "view.php"
    . ($thisclient ? "?e=".urlencode($thisclient->getEmail()) : "");
$signout_url = ROOT_PATH . "logout.php?auth=".$ost->getLinkToken();

header("Content-Type: text/html; charset=UTF-8");
header("Content-Security-Policy: frame-ancestors ".$cfg->getAllowIframes().";");

if (($lang = Internationalization::getCurrentLanguage())) {
    $langs = array_unique(array($lang, $cfg->getPrimaryLanguage()));
    $langs = Internationalization::rfc1766($langs);
    header("Content-Language: ".implode(', ', $langs));
}
?>
<!DOCTYPE html>
<html<?php
if ($lang
        && ($info = Internationalization::getLanguageInfo($lang))
        && (@$info['direction'] == 'rtl'))
    echo ' dir="rtl" class="rtl"';
if ($lang) {
    echo ' lang="' . $lang . '"';
}
// Dropped IE Support Warning
if (osTicket::is_ie())
    $ost->setWarning(__('osTicket no longer supports Internet Explorer.'));
?>>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><?php echo Format::htmlchars($title); ?></title>
    <meta name="description" content="customer support platform">
    <meta name="keywords" content="osTicket, Customer support system, support ticket system">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<?php echo ASSETS_PATH; ?>css/bootstrap.min.css?39ab0c5" media="screen"/>
	<link rel="stylesheet" href="<?php echo ROOT_PATH; ?>css/osticket.css?39ab0c5" media="screen"/>
    <link rel="stylesheet" href="<?php echo ASSETS_PATH; ?>css/print.css?39ab0c5" media="print"/>
    <link rel="stylesheet" href="<?php echo ROOT_PATH; ?>scp/css/typeahead.css?39ab0c5"
         media="screen" />
    <link type="text/css" href="<?php echo ROOT_PATH; ?>css/ui-lightness/jquery-ui-1.10.3.custom.min.css?39ab0c5"
        rel="stylesheet" media="screen" />
       <link rel="stylesheet" href="<?php echo ROOT_PATH ?>css/jquery-ui-timepicker-addon.css?39ab0c5" media="all"/>
    <link rel="stylesheet" href="<?php echo ROOT_PATH; ?>css/thread.css?39ab0c5" media="screen"/>
    <link rel="stylesheet" href="<?php echo ROOT_PATH; ?>css/redactor.css?39ab0c5" media="screen"/>
    <link type="text/css" rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/default/fontawesome/css/fontawesome-all.min.css?39ab0c5"/>
    <link type="text/css" rel="stylesheet" href="<?php echo ROOT_PATH; ?>css/flags.css?39ab0c5"/>
    <link type="text/css" rel="stylesheet" href="<?php echo ROOT_PATH; ?>css/rtl.css?39ab0c5"/>
    <link type="text/css" rel="stylesheet" href="<?php echo ROOT_PATH; ?>css/select2.min.css?39ab0c5"/>
    <!-- Favicons -->
    <link rel="icon" type="image/png" href="<?php echo ROOT_PATH ?>images/oscar-favicon-32x32.png" sizes="32x32" />
    <link rel="icon" type="image/png" href="<?php echo ROOT_PATH ?>images/oscar-favicon-16x16.png" sizes="16x16" />
    <script type="text/javascript" src="<?php echo ROOT_PATH; ?>js/jquery-3.5.1.min.js?39ab0c5"></script>
    <script type="text/javascript" src="<?php echo ROOT_PATH; ?>js/jquery-ui-1.12.1.custom.min.js?39ab0c5"></script>
    <script type="text/javascript" src="<?php echo ROOT_PATH; ?>js/jquery-ui-timepicker-addon.js?39ab0c5"></script>
    <script src="<?php echo ROOT_PATH; ?>js/osticket.js?39ab0c5"></script>
    <script type="text/javascript" src="<?php echo ROOT_PATH; ?>js/filedrop.field.js?39ab0c5"></script>
    <script src="<?php echo ROOT_PATH; ?>scp/js/bootstrap-typeahead.js?39ab0c5"></script>
    <script type="text/javascript" src="<?php echo ROOT_PATH; ?>js/redactor.min.js?39ab0c5"></script>
    <script type="text/javascript" src="<?php echo ROOT_PATH; ?>js/redactor-plugins.js?39ab0c5"></script>
    <script type="text/javascript" src="<?php echo ROOT_PATH; ?>js/redactor-osticket.js?39ab0c5"></script>
    <script type="text/javascript" src="<?php echo ROOT_PATH; ?>js/select2.min.js?39ab0c5"></script>
    <script type="text/javascript" src="<?php echo ROOT_PATH; ?>js/fabric.min.js?39ab0c5"></script>
    <link rel="stylesheet" href="<?php echo ASSETS_PATH; ?>css/mtheme.css?39ab0c5" media="screen"/>
     <script type="text/javascript" src="<?php echo ASSETS_PATH; ?>js/bootstrap.min.js?39ab0c5"></script>
     <script type="text/javascript" src="<?php echo ASSETS_PATH; ?>js/custom.js?39ab0c5"></script>

     
    <!-- Additional CSS Files -->
   <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<?php echo ASSETS_PATH; ?>css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="<?php echo ASSETS_PATH; ?>css/animated.css">
    <link rel="stylesheet" href="<?php echo ASSETS_PATH; ?>css/owl.css"> 

    <?php
    if($ost && ($headers=$ost->getExtraHeaders())) {
        echo "\n\t".implode("\n\t", $headers)."\n";
    }

    // Offer alternate links for search engines
    // @see https://support.google.com/webmasters/answer/189077?hl=en
    if (($all_langs = Internationalization::getConfiguredSystemLanguages())
        && (count($all_langs) > 1)
    ) {
        $langs = Internationalization::rfc1766(array_keys($all_langs));
        $qs = array();
        parse_str($_SERVER['QUERY_STRING'], $qs);
        foreach ($langs as $L) {
            $qs['lang'] = $L; ?>
        <link rel="alternate" href="//<?php echo $_SERVER['HTTP_HOST'] . htmlspecialchars($_SERVER['REQUEST_URI']); ?>?<?php
            echo http_build_query($qs); ?>" hreflang="<?php echo $L; ?>" />
<?php
        } ?>
        <link rel="alternate" href="//<?php echo $_SERVER['HTTP_HOST'] . htmlspecialchars($_SERVER['REQUEST_URI']); ?>"
            hreflang="x-default" />
<?php
    }
    ?>
</head>
<body>
    
  <nav role="navigation" class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">

    <div class="container">
                <?php
        if($ost->getError())
            echo sprintf('<div class="error_bar">%s</div>', $ost->getError());
        elseif($ost->getWarning())
            echo sprintf('<div class="warning_bar">%s</div>', $ost->getWarning());
        elseif($ost->getNotice())
            echo sprintf('<div class="notice_bar">%s</div>', $ost->getNotice());
        ?>
    <!---->
<header class="header-area header-sticky wow slideInDown" data-wow-duration="0.75s" data-wow-delay="0s">
  <div class="container">
    <?php
      if($ost->getError())
          echo sprintf('<div class="error_bar">%s</div>', $ost->getError());
      elseif($ost->getWarning())
          echo sprintf('<div class="warning_bar">%s</div>', $ost->getWarning());
      elseif($ost->getNotice())
          echo sprintf('<div class="notice_bar">%s</div>', $ost->getNotice());
    ?>
   
     
        <nav class="main-nav">
          <!-- ***** Logo ***** -->
          <a href="index.php" class="logo">
            <img src="assets/images/logo.png" alt="Securities and Exchange Commission">
          </a>

          <!-- ***** Dynamic Menu ***** -->
          <ul class="nav">
            <?php
            // Welcome label
           // if ($thisclient && is_object($thisclient) && $thisclient->isValid() && !$thisclient->isGuest()) {
           //     echo '<li><span class="welcome-user">Welcome '.Format::htmlchars($thisclient->getName()).'</span></li>';
          //  } else {
          //      echo '<li><span class="welcome-user">Welcome Guest</span></li>';
          //  }

            // Language switcher
            if (($all_langs = Internationalization::getConfiguredSystemLanguages()) && count($all_langs) > 1) {
                $qs = array();
                parse_str($_SERVER['QUERY_STRING'], $qs);
                foreach ($all_langs as $code=>$info) {
                    list($lang, $locale) = explode('_', $code);
                    $qs['lang'] = $code;
                    echo sprintf(
                        '<li><a class="flag flag-%s" href="?%s" title="%s">&nbsp;</a></li>',
                        strtolower($info['flag'] ?: $locale ?: $lang),
                        http_build_query($qs),
                        Internationalization::getLanguageDescription($code)
                    );
                }
            }

            // Navigation items (Tickets, Open, etc.)
            if ($nav && ($navs=$nav->getNavLinks()) && is_array($navs)) {
                foreach($navs as $name =>$nav_item) {
                    echo sprintf(
                        '<li><a class="%s %s" href="%s">%s</a></li>',
                        $nav_item['active'] ? 'active' : '',
                        $name,
                        ROOT_PATH.$nav_item['href'],
                        $nav_item['desc']
                    );
                }
            }

            // Auth buttons
            if ($thisclient && is_object($thisclient) && $thisclient->isValid() && !$thisclient->isGuest()) {
                echo '<li><a href="'.ROOT_PATH.'bydepartment.php">Services By Department</a></li>';
               //echo  '<li class="scroll-to-section"><a href="/assets/images/iMessageUsersManual-Public.pdf" target="_blank"><i class="fa fa-file-pdf"></i> User Manual</a></li>';
		 echo '<li><div class="gradient-button"><a href="'.$signout_url.'">Sign Out</a></div></li>';
            } elseif ($thisclient && $thisclient->isValid() && $thisclient->isGuest()) {
                echo '<li><div class="gradient-button"><a href="'.$signout_url.'">Sign Out</a></div></li>';
            } elseif ($cfg->getClientRegistrationMode() != 'disabled') {
                echo '<li><div class="gradient-button"><a href="'.$signin_url.'"><i class="fa fa-sign-in-alt"></i> Sign In</a></div></li>';
            }
            ?>
          </ul>

          <!-- Mobile Menu Trigger -->
          <a class="menu-trigger">
            <span>Menu</span>
          </a>
        </nav>
     
  
</header>

<div class="container">
<div class="row">
            <div class="col-sm-6">
            <a id="logo" href="<?php echo ROOT_PATH; ?>index.php"
            title="<?php echo __('i-Message Mo'); ?>">
                <span class="valign-helper"></span>
                <img src="<?php echo ASSETS_PATH; ?>logo.php" border=0 alt="<?php
                //echo $ost->getConfig()->getTitle(); ?>">
            </a>
            </div> <div class="col-sm-6">
                
                <?php
if ($cfg && $cfg->isKnowledgebaseEnabled()) { ?>
<div class="search">
    <form method="get" action="/kb/faq.php">
    <input type="hidden" name="a" value="search"/>
    <input type="text" class="form-control input-sm" name="q" class="search" placeholder="<?php echo __('Search our knowledge base'); ?>"/>
    <button type="submit" class="btn btn-primary btn-sm"><?php echo __('Search'); ?></button>
    </form>
</div>

<?php
} ?>

            </div>
        </div>
        
         <?php if($errors['err']) { ?>
            <div class="alert alert-danger"><?php echo $errors['err']; ?></div>
         <?php }elseif($msg) { ?>
            <div class="alert alert-info"><?php echo $msg; ?></div>
         <?php }elseif($warn) { ?>
            <div class="alert alert-warning"><?php echo $warn; ?></div>
         <?php } */ ?>


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

<body style="padding-top: 100px;">

<!-- ================= HEADER UI ONLY ================= -->
<header class="mt-0 d-flex"  id="header" >

    <div class="container">

        <!-- LOGO -->
        <nav>

            <a href="index.php" class="logo">
                <img src="assets/images/logo.png" alt="Logo" height="100" width="150">
            </a>

            <!-- NAVIGATION (STATIC) -->
            <ul class="nav "  >

                <li><a href="index.php" class="active">Home</a></li>
                <li><a href="#">Open A New Ticket</a></li>
                <li><a href="#">Ticket (0)</a></li>
                <li><a href="#">Services By Department</a></li>

                <!-- AUTH BUTTONS (STATIC) -->
                <li class="last-child">
                    <a href="#" class="signin-btn" > 
                        <i class="fa fa-sign-in-alt"  ></i> Sign In
                    </a>
                </li>
            <img style="display: none;" class="hamburger-close-menu hamburger-menu" src="./assets/images/close-menu.png" alt="Hamburger Menu">

            </ul>

            <div class="hamburger-menu-box">
                <img class="hamburger-menu" src="./assets/images/hamburger-menu.png" alt="Hamburger Menu">
            </div>
        </nav>

    </div>
</header>
</body>
</html>
<script>
function updateMenuIcon() {
    const hamburgerIcon = document.querySelector(".hamburger-menu-box");
    const hamburgerCloseMenu = document.querySelector(".hamburger-close-menu");
    const nav = document.querySelector(".nav");

    if (window.innerWidth > 1000) {
        hamburgerIcon.style.display = "none";
        hamburgerCloseMenu.style.display = "none";
        nav.classList.remove("open");
    } else {
        hamburgerIcon.style.display = "flex";

         hamburgerIcon.style.display = "flex";
        hamburgerCloseMenu.style.display = "flex";
    }
}
function toggleMenu() {
    const hamburgerIcon = document.querySelector(".hamburger-menu-box");
    const hamburgerCloseMenu = document.querySelector(".hamburger-close-menu");


    hamburgerIcon.addEventListener("click", () => {
        const nav = document.querySelector(".nav");
        nav.classList.toggle("open");
        if (nav.classList.contains("open")) {
            hamburgerIcon.src = "./assets/images/close-menu.png";
        } else {
            hamburgerIcon.src = "./assets/images/hamburger-menu.png";
        }
         hamburgerCloseMenu.style.display = "block";
    });

    hamburgerCloseMenu.addEventListener("click", () => {

        const nav = document.querySelector(".nav");
        nav.classList.toggle("open");

    });
}

// run on load
toggleMenu();
// run on resize
window.addEventListener("resize", updateMenuIcon);
</script>

