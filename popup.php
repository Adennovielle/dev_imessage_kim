<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Securities and Exchange Commission</title>
<style>
.popup-container {
    display: none; /* hidden by default */
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background: rgba(0,0,0,0.5);
    z-index: 9999;
}

.popup-content {
    background: #fff;
    margin: 10% auto;
    padding: 20px;
    width: 750px;
    border-radius: 8px;
    text-align: justify;
    box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    font-size: 16px;    /* increased text size */
    line-height: 1.6;   /* makes it easier to read */

}

.popup-btn {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 25px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    display: inline-block;
    margin-top: 15px;
}

.popup-btn:hover {
    background-color: #0056b3;
}

.popup-content label {
    display: block;
    margin-top: 15px;
}

.popup-content .button-container {
    text-align: center;
}
</style>
</head>
<body>

<!-- Privacy Policy Popup -->
<div id="popup1" class="popup-container">
    <div class="popup-content">
        <h2>Privacy Policy</h2>
        <p>By using this facility and by providing your personal data, you hereby authorize the Securities and Exchange Commission to collect and store the said data, Data  such as but not limited to full names, email addresses and mobile numbers with the use of electronic or automated means, shall be stored within the period allowed under applicable laws, rules and regulations, for the purpose of processing your request. </br></br>You also acknowledge and consent to the collection and processing of your personal data as part of the processing of your request submitted through iMessage in accordance with our <a target="_blank" href="https://www.sec.gov.ph/privacy-policy-3/sec-imessage/#gsc.tab=0">Privacy Policy</a>.</p>
        <label>
            <input type="checkbox" id="privacy-checkbox"> I agree to the Privacy Policy
        </label>
        <div class="button-container">
            <button class="popup-btn" onclick="closePopup1()">Continue</button>
        </div>
    </div>
</div>

<!-- Terms of Service Popup -->
<div id="popup2" class="popup-container">
    <div class="popup-content">
         <h2> <a href="https://ewatch.sec.gov.ph/">eWATCH is Now Available – Submit Monitoring Clearance Applications Online</a></h2>
       <br> <p>We are pleased to inform you that the Company Monitoring System is already available. All applications for monitoring clearance for all types of corporation must now be submitted through this dedicated system: <a href="https://ewatch.sec.gov.ph/"><stong><i><u>Monitoring Clearance</u></i></strong></a>.<br>Applications for monitoring clearance submitted via the IMessage Portal prior to the availability of the Company Monitoring System will continue to be processed and completed in the iMessage portal.</br>Thank you.</p>
        <label>
            <input type="checkbox" id="tos-checkbox"> I understand
        </label>
        <div class="button-container">
            <button class="popup-btn" onclick="closePopup2()">Continue</button>
        </div>
    </div>
</div>

<script>
// Only show popups if not already accepted
if (!localStorage.getItem('popupsAccepted')) {
    document.getElementById('popup1').style.display = 'block';
}

// Close first popup and open second
function closePopup1() {
    if (document.getElementById('privacy-checkbox').checked) {
        document.getElementById('popup1').style.display = 'none';
        document.getElementById('popup2').style.display = 'block';
    } else {
        alert('Please agree to the Privacy Policy.');
    }
}

// Close second popup and mark as accepted
function closePopup2() {
    if (document.getElementById('tos-checkbox').checked) {
        document.getElementById('popup2').style.display = 'none';
        localStorage.setItem('popupsAccepted', 'true'); // mark as accepted
    } else {
        alert('Please agree to the Terms of Service.');
    }
}
</script>

</body>
</html>
