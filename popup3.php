
<?php ?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Securities and Exchange Commission</title>
<style>
    /* Style for the popup */
    .popup-container {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 999;
    }

    .popup-content {
        position: absolute;
        top: 50%;
        left: 50%;
	transform: translate(-50%, -50%);
       max-width:80%;
	max-height:90%;
	overflow:auto;
	 background-color: white;
        padding: 25px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        text-align: center;
	margin-bottom: 25px;
	z-index:1000;
    }

    #privacy-checkbox {
        margin-bottom: 10px;
    }
</style>
</head>
<body>

<!-- Privacy Policy Popup -->
<div id="popup-container" class="popup-container">
    <div class="popup-content" style="text-align: justify;">
        <h2>Privacy Policy</h2>
        <p>By using this facility and by providing your personal data, you hereby authorize the Securities and Exchange Commission to collect and store the said data, Data  such as but not limited to full names, email addresses and mobile numbers with the use of electronic or automated means, shall be stored within the period allowed under applicable laws, rules and regulations, for the purpose of processing your request. You also acknowledge and consent to the collection and processing of your personal data as part of the processing of your request submitted through iMessage in accordance with our <a target="_blank" href="https://www.sec.gov.ph/privacy-policy-3/sec-imessage/#gsc.tab=0">Privacy Policy</a>.</p>
        <label for="privacy-checkbox">
            <input type="checkbox" id="privacy-checkbox">
            I agree to the Privacy Policy
        </label>
        <br>
        <button onclick="closePopup()">Continue</button>
    </div>
</div>

<script>
    // Function to show the popup
    function showPopup() {
        document.getElementById('popup-container').style.display = 'block';
    }

    // Function to close the popup
    function closePopup() {
        var checkbox = document.getElementById('privacy-checkbox');
        if (checkbox.checked) {
            document.getElementById('popup-container').style.display = 'none';
        } else {
            alert('Please agree to the Privacy Policy.');
        }
    }

    // Show the popup when the page loads
    window.onload = showPopup;
</script>

</body>
</html>
