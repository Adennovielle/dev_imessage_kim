

<?php /*
if(!defined('OSTCLIENTINC')) die('Access Denied!');
*/
// require_once('include/client.inc.php');
$errors = array();
$info=array();
/*

if($thisclient && $thisclient->isValid()) {
    $info=array('name'=>$thisclient->getName(),
                'email'=>$thisclient->getEmail(),
                'phone'=>$thisclient->getPhoneNumber());
} */
/*
$info=($_POST && $errors)?Format::htmlchars($_POST):$info;

$form = null;
if (!$info['topicId']) {
    if (array_key_exists('topicId',$_GET) && preg_match('/^\d+$/',$_GET['topicId']) && Topic::lookup($_GET['topicId']))
        $info['topicId'] = intval($_GET['topicId']);
    // else
    //     $info['topicId'] = $cfg->getDefaultTopicId();
    else
    $info['topicId'] = 1; // hardcoded for testing
}

$forms = array();
if ($info['topicId'] && ($topic=Topic::lookup($info['topicId']))) {
    var_dump($topic); exit;
    foreach ($topic->getForms() as $F) {
        if (!$F->hasAnyVisibleFields())
            continue;
        if ($_POST) {
            $F = $F->instanciate();
            $F->isValidForClient();
        }
        $forms[] = $F->getForm();
    }
}
    */
?>
    <style>
/* Base look like Google search bar */
.select2-container--default .select2-selection--single {
    background-color: #fff;
    border: 1px solid #dfe1e5;
    border-radius: 24px;
    height: 44px;
    display: flex;
    align-items: center;
    padding-left: 12px;
    box-shadow: 0 1px 3px rgba(60,64,67,0.15);
    transition: all 0.2s ease-in-out;
}

/* On hover or focus */
.select2-container--default .select2-selection--single:hover,
.select2-container--default.select2-container--open .select2-selection--single {
    border-color: #dadce0;
    box-shadow: 0 1px 6px rgba(32,33,36,0.28);
}

/* Arrow icon */
.select2-container--default .select2-selection__arrow {
    height: 100%;
    right: 10px;
    top: 0;
}

/* Placeholder and text */
.select2-container--default .select2-selection__placeholder {
    color: #5f6368;
    font-size: 15px;
}

.select2-container--default .select2-selection__rendered {
    color: #202124;
    font-size: 15px;
    line-height: 44px;
}
.select2-container--default.select2-container--open .select2-selection--single {
    transform: scale(1.02);
}

/* Search box inside dropdown */
.select2-container--default .select2-search--dropdown .select2-search__field {
    border: 1px solid #dfe1e5;
    border-radius: 24px;
    padding: 8px 14px;
    font-size: 15px;
    outline: none;
    transition: all 0.2s ease-in-out;
}

.select2-container--default .select2-search--dropdown .select2-search__field:focus {
    border-color: #4285f4;
    box-shadow: 0 1px 6px rgba(32,33,36,0.28);
}

/* Dropdown panel */
.select2-dropdown {
    border: 1px solid #dfe1e5;
    border-radius: 12px;
    box-shadow: 0 4px 8px rgba(60,64,67,0.15);
    overflow: hidden;
}

/* Result options */
.select2-results__option {
    padding: 8px 14px;
    font-size: 15px;
}

.select2-results__option--highlighted {
    background-color: #e8f0fe;
    color: #1967d2;
}
</style>

<div style="margin-top:120px"></div> 
<div class="row">
<div class="col-md-12">    
<h1><?php /* echo __('Open a New Ticket'); */ ?></h1>
<h1><?php echo 'Open a New Ticket'?></h1>
<p><?php echo 'Please fill in the form below to open a new ticket.'?></p>
<form id="ticketForm" method="post" action="open.php" enctype="multipart/form-data" class="form-horizontal">
  <?php /* csrf_token(); */ ?>
  <input type="hidden" name="a" value="open">
  <table>
<?php /*
        if (!$thisclient) {
            $uform = UserForm::getUserForm()->getForm($_POST);
            if ($_POST) $uform->isValid();
            $uform->render(array('staff' => false, 'mode' => 'create'));
        }
        else { */ ?>
      <div class="form-group">
          <div class="col-sm-1"><label for="email"><?php echo 'Email'?>:</label></div>
          <div class="col-sm-11">   
            <?php echo /* $thisclient->getEmail(); */ "useremail@example.com" ?> 
          </div>
      </div>
        <div class="form-group">
            <div class="col-sm-1"><label for="email"> <?php echo "Name"; ?>:</label></div><div class="col-sm-11"> <?php
            echo /* Format::htmlchars($thisclient->getName()); */ "Username" ?>
        <?php /* } */ ?></div>
       </div>
            <!--<div class="form-group">
            <div class="col-sm-1"><label for="address"> <?php echo 'Address' ?>:</label></div><div class="col-sm-11"><?php?>
            <div></div>-->
<hr/>
            <div class="form-group">
                    <label class="control-label col-sm-2"> <?php echo 'Service*&nbsp;' ?></label>
<div class="col-sm-10">

<select class="form-control" id="topicId" name="topicId"
    onchange="javascript:
        var data = $(':input[name]', '#dynamic-form').serialize();
        $.ajax(
          'ajax.php/form/help-topic/' + this.value,
          {
            data: data,
            dataType: 'json',
            success: function(json) {
              $('#dynamic-form').empty().append(json.html);
              $(document.head).append(json.media);
            }
          });">
    <option value="" selected="selected">&mdash; <?php echo 'Start typing to find your service...'?> &mdash;</option>
    <option value="" selected="selected">&mdash; <?php echo 'Start typing to find your service...'?> &mdash;</option>
    <option value="" selected="selected">&mdash; <?php echo 'Start typing to find your service...'?> &mdash;</option>
    <option value="" selected="selected">&mdash; <?php echo 'Start typing to find your service...'?> &mdash;</option>
    <option value="" selected="selected">&mdash; <?php echo 'Start typing to find your service...'?> &mdash;</option>
    <option value="" selected="selected">&mdash; <?php echo 'Start typing to find your service...'?> &mdash;</option>
    <option value="" selected="selected">&mdash; <?php echo 'Start typing to find your service...'?> &mdash;</option>
    <option value="" selected="selected">&mdash; <?php echo 'Start typing to find your service...'?> &mdash;</option>
    <?php /*
    if ($topics = Topic::getPublicHelpTopics()) {
        foreach ($topics as $id => $name) {
            echo sprintf(
                '<option value="%d" %s>%s</option>',
                $id,
                ($info['topicId'] == $id) ? 'selected="selected"' : '',
                $name
            );
        }
    }
    */ ?>
</select>

<!-- Initialize Select2 -->
<script>
$(document).ready(function() {
    const $select = $('#topicId').select2({
        placeholder: " <?php  /*echo __('Start typing to find your service...'); */ ?>",
        allowClear: true,
        width: '100%',
        minimumResultsForSearch: 0 // keep search input visible
    });

    // Hide result list until user types something
    $select.on('select2:open', function() {
        const $searchBox = $('.select2-search__field');
        const $results = $('.select2-results__options');

        // Initially hide results
        $results.hide();

        // Detect typing
        $searchBox.on('input.select2Filter', function() {
            const val = $(this).val().trim();
            if (val.length === 0) {
                $results.hide();
            } else {
                $results.show(); // show results, Select2 auto-filters them
            }
        });
    });

    // Clean up on close
    $select.on('select2:close', function() {
        $('.select2-search__field').off('.select2Filter');
    });
});
 const $select = $('#topicId').select2({
    placeholder: "<?php /* echo __('Start typing to find your concern topic'); */ ?>",
    allowClear: true,
    width: '100%',
    minimumResultsForSearch: 0
});

</script>
    <!-- <font class="error"><?php echo /* $errors['topicId' */ "test_error"; ?></font></div></div> -->

    <div id="dynamic-form">
        <?php /*
        $options = array('mode' => 'create');
        foreach ($forms as $form) {
            include(CLIENTINC_DIR . 'templates/dynamic-form.tmpl.php');
        } */ ?>
    </div>
<table>
    <tbody>

    <?php /* 
   if($cfg && $cfg->isCaptchaEnabled() && (!$thisclient || !$thisclient->isValid())) {
        if($_POST && $errors && !$errors['captcha'])
            $errors['captcha']=__('Please re-enter the text again');
      */  ?>
    <!-- <div class="captchaRow form-group">
        <label class="col-sm-2 text-right"><?php echo 'CAPTCHA Text'?></label>
        <div class="col-sm-10">
            <span class="captcha"><img src="captcha.php" border="0" align="left"></span>
            &nbsp;&nbsp;
            <input id="captcha" type="text" name="captcha" size="6" autocomplete="off">
            <em><?php /* echo 'Enter the text shown on the image.'*/ ?></em>
            <font class="error">*&nbsp;<?php echo /* $errors['captcha'] */ "test_error"; ?></font>
        </div>
    </div> -->
    <?php /*
    } */?>

<!-- <script>
document.addEventListener('DOMContentLoaded', function () {
  const params = new URLSearchParams(window.location.search);
  const topicId = params.get('topicId');
  if (!topicId) return;

  // Wait until osTicket’s Select2 and form scripts are ready
  const wait = setInterval(() => {
    const dropdown = document.querySelector('select[name="topicId"]');
    if (dropdown && $(dropdown).data('select2')) {
      clearInterval(wait);

      // Set and trigger osTicket’s built-in form loader
      $(dropdown).val(topicId).trigger('change');

      // Hide the dropdown (optional)
      $(dropdown).closest('.form-group, .field, .form-row').hide();

      // Optional: show the selected topic name as a header
      const selected = $(dropdown).find('option:selected').text();
      if (selected) {
        $('<h3>', {
          text: selected,
          css: {marginBottom: '20px', fontWeight: '600', color: '#333'}
        }).prependTo('form#ticketForm');
      }
    }
  }, 400);
});
</script> -->
 
    </tbody>
  </table>
<hr/></br></br>
  <p class="buttons" style="text-align:center;">
        <input class="btn btn-success" type="submit" value="<?php echo 'Create Ticket' ?> ">
        <input class="btn btn-warning" type="reset" name="reset" value="<?php echo 'Reset' ?>">
        <input class="btn btn-danger" type="button" name="cancel" value="<?php echo 'Cancel' ?>" onclick="javascript:
            $('.richtext').each(function() {
                var redactor = $(this).data('redactor');
                if (redactor && redactor.opts.draftDelete)
                    redactor.plugin.draft.deleteDraft();
            });
            window.location.href='index.php';">
  </p>

</form>
   </div>
  </div>