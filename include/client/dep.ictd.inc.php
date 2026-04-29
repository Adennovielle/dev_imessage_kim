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

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/templatemo-chain-app-dev.css">
    <link rel="stylesheet" href="assets/css/animated.css">
    <link rel="stylesheet" href="assets/css/owl.css">

  </head>
<?php
$dpt = $_GET['dpt'] ?? '';
if ($dpt == 'ictd') {
    $title = 'Information and Communications Technology Department';
    $dep_id = [6,7,8,10];

} else if ($dpt == 'ocs') {
    $title = 'Office of the Commission Secretary';
    $dep_id = [42,43,44];

} else if ($dpt == 'oga') {
    $title = 'Office of the General Accountant';
    $dep_id = [45,46,47,48];

} else if ($dpt == 'crmd') {
    $title = 'Company Registration and Monitoring Department';
    $dep_id = [52,53,54,55,56,57,58];

} else if ($dpt == 'msrd') {
    $title = 'Markets and Securities Regulation Department';
    $dep_id = [59,60,61,62,63,64];

} else if ($dpt == 'cgfd') {
    $title = 'Corporate Governance and Finance Department';
    $dep_id = [32,33,34,35,36];

} else if ($dpt == 'eipd') {
    $title = 'Enforcement and Investor Protection Department';
    $dep_id = [24,25,26,27,28,29,30];

} else if ($dpt == 'ertd') {
    $title = 'Economic Research and Training Department';
    $dep_id = [3,69,70,71,72,73];

} else if ($dpt == 'hrd') {
    $title = 'Human Resource Department';
    $dep_id = [74,75,76,77,78,79];

} else if ($dpt == 'flcd') {
    $title = 'Financing and Lending Companies Department';
    $dep_id = [67,68,100,101];

} else if ($dpt == 'fmd') {
    $title = 'Financial Management Department';
    $dep_id = [85,86,87,88,89];

} else if ($dpt == 'faad') {
    $title = 'Financial Analysis and Audit Department';
    $dep_id = [49,50,51];

} else if ($dpt == 'ead') {
    $title = 'External Affairs Department';
    $dep_id = [90,91,92,93,94];

} else if ($dpt == 'msd') {
    $title = 'Management Services Department';
    $dep_id = [80,81,82,83,84];

} else if ($dpt == 'ogc') {
    $title = 'Office of the General Counsel';
    $dep_id = [37,38,39,40,41];
} else if ($dpt == 'laeo') {
    $title = 'Laoag Extension Office';
    $dep_id = [99];
} else if ($dpt == 'beo') {
    $title = 'Baguio Extension Office';
    $dep_id = [13];
} else if ($dpt == 'teo') {
    $title = 'Tarlac Extension Office';
    $dep_id = [14];
} else if ($dpt == 'ileo') {
    $title = 'Ilagan Extension Office';
    $dep_id = [98];
} else if ($dpt == 'lieo') {
    $title = 'Lipa Extension Office';
    $dep_id = [97];
} else if ($dpt == 'leo') {
    $title = 'Legazpi Extension Office';
    $dep_id = [15];
} else if ($dpt == 'ieo') {
    $title = 'Iloilo Extension Office';
    $dep_id = [16];
} else if ($dpt == 'bcoeo') {
    $title = 'Bacolod Extension Office';
    $dep_id = [17];
} else if ($dpt == 'ceo') {
    $title = 'Cebu Extension Office';
    $dep_id = [18];
} else if ($dpt == 'tceo') {
    $title = 'Tacloban Extension Office';
    $dep_id = [19];
} else if ($dpt == 'zeo') {
    $title = 'Zamboanga Extension Office';
    $dep_id = [20];
} else if ($dpt == 'cdoeo') {
    $title = 'Cagayan De Oro Extension Office';
    $dep_id = [21];
} else if ($dpt == 'bueo') {
    $title = 'Butuan Extension Office';
    $dep_id = [22];
} else if ($dpt == 'deo') {
    $title = 'Davao Extension Office';
    $dep_id = [12];
} else if ($dpt == 'keo') {
    $title = 'Koronodal Extension Office';
    $dep_id = [96];
} else {
    $title = 'Securities and Exchange Commission';
    $dep_id = [0];
}

?>
 <div id="services" class="services section">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <div class="section-heading  wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s" >
            <h4 style="margin-top:25px"><?= $title ?></h4>
            <img src="assets/images/heading-line-dec.png" alt="" style="-25px">
            <p><b><i>Please feel free to reach out to the department most relevant to your inquiry. Our team will respond as promptly as possible to resolve your issue or provide the assistance you need.</b></i></p>
          </div>
        </div>
      </div>
    </div>
    <?php
if (!defined('OSTCLIENTINC')) die('Access Denied!');

// Department IDs you want to include
$department_ids = $dep_id; // example: ICTD, MIS, HR

// Build the IN() part safely
$in = implode(',', array_map('intval', $department_ids));

// Run SQL — note: use ost_help_topic and check isactive=1 instead of flags=2
$sql = "
    SELECT t.topic_id, t.topic
    FROM ost_help_topic t
    LEFT JOIN ost_department d ON t.dept_id = d.id
    WHERE t.dept_id IN ($in) AND t.flags = 2 AND t.ispublic = 1
    ORDER BY t.dept_id, t.topic
";

//echo $sql;
$res = db_query($sql);
$topics_by_dept = [];

// Fill the array properly
while ($row = db_fetch_array($res)) {
    $dept_name = $row['dept_name'] ?: '';
    $topics_by_dept[$dept_name][] = $row;
}

// Render
if (!empty($topics_by_dept)) {
    foreach ($topics_by_dept as $dept_name => $topics) {
        echo '<h3 style="margin-top:30px;">' . Format::htmlchars($dept_name) . '</h3>';
        echo '<div class="row">';
        foreach ($topics as $topic) {
            $topic_id = $topic['topic_id'];
            $topic_name = Format::htmlchars($topic['topic']);
            echo '
            <div class="col-lg-3">
              <div class="service-item second-service">
                <div class="icon"></div>
                <h4>' . $topic_name . '</h4>
                <div class="text-button">
                  <a style="color:#0dd990" href="/open.php?topicId=' . $topic_id . '">
                    Create Ticket <i class="fa fa-arrow-right"></i>
                  </a>
                </div>
              </div>
            </div>';
        }
        echo '</div>';
    }
} else {
    echo '<p>No help topics found for the selected departments.</p>';
}

?>
  </div>


