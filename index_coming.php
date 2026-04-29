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
require('client.inc.php');

require_once INCLUDE_DIR . 'class.page.php';

$section = 'home';
require(CLIENTINC_DIR.'header.inc.php');
session_start();
?>
</div>
<div class="container-fluid">
<div class="row support-image">
    
      <img src="<?php echo ASSETS_PATH; ?>images/support.jpg" alt="Quick and Efficient Support" style="width:100%;">
      <div class="centered">
<?php

    if($cfg && ($page = $cfg->getLandingPage()))
        echo $page->getBodyWithImages();
    else
        echo  '<h1>'.__('Quick and Efficient Support').'</h1>';
    ?></div></div>
</div>
<div class="container">
<div class="row front-boxes">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="outer_box_green">
                        <div class="triangle triangle-green">
               
                        </div>
                        <div class="box-body">
                            <h1><b><?php echo __('We are coming soon!') ?></b></h1>
                            <p><?php echo __('We are coming soon! We are working hard to give you the best experience!') ?></p>
                            <br><br>
                        </div>
                    </div>
                </div> 
</div>
    
<?php require(CLIENTINC_DIR.'footer.inc.php'); ?>
