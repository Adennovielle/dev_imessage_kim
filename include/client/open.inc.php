<!DOCTYPE html>
<html>
<head>
    <title>Search Autocomplete</title>
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
</head>
<body>
   
    <div class="search-box">
         <div  class="container search-box-content " >
                    
                <h2 class="text-success bg-secondary" style="--bs-bg-opacity: .1;" >Open a New Ticket</h2>
                <div class="user-info d-flex flex-column gap-2 mb-4">
                    <h4>Please fill in the form below to open a new ticket</h4> 
                <p>Email: user@example.com
                    </p> 
                    <p>Name: John Doe</p>
                </div>
                <div class="">
                <div style="display: flex; align-items: center; gap: 10px;" class="input-box" >
                    <label for="searchInput" style="font-weight: bolder; display: flex;">Search <span class="required">*</span></label>
                    <input type="text" id="searchInput" autocomplete="off" placeholder="Start typing to find your service...">
                </div>
                <div class="results" id="results"></div> 
                </div>

                <div class="d-flex justify-content-center">
                <p class="buttons">
                    <input class="btn btn-success" type="submit" value="Create Ticket">
                    <input class="btn btn-warning" type="reset" name="reset" value="Reset">
                    <input class="btn btn-danger" type="button" name="cancel" value="Cancel" onclick="javascript:window.location.href='index.php';">
                </p>
                </div>
        </div>
    </div>
   

<script>
document.addEventListener("DOMContentLoaded", function () {

    const data = [
        "Technical Support",
        "Billing Issue",
        "Account Login Problem",
        "Password Reset",
        "Website Error",
        "Mobile App Issue",
        "Refund Request",
        "Subscription Inquiry",
        "Network Problem",
        "Email Not Working"
    ];

    const input = document.getElementById("searchInput");
    const results = document.getElementById("results");

    input.addEventListener("input", function() {
        const value = this.value.trim().toLowerCase();
        results.innerHTML = "";

        if (value.length === 0) {
            results.style.display = "none";
            return;
        }

        const filtered = data.filter(item =>
            item.toLowerCase().includes(value)
        );

        if (filtered.length === 0) {
            results.style.display = "none";
            return;
        }

        filtered.forEach(item => {
            const div = document.createElement("div");
            div.classList.add("item");
            div.textContent = item;

            div.addEventListener("click", function(e) {
                e.stopPropagation(); // ✅ important
                input.value = item;
                results.style.display = "none";
            });

            results.appendChild(div);
        });

        results.style.display = "block";
    });

    // ✅ Hide when clicking outside
    document.addEventListener("click", function(e) {
        if (!e.target.closest(".input-box")) {
            results.style.display = "none";
        }
    });

});
</script>

</body>
</html>