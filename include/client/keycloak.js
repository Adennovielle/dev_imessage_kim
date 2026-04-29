$(document).ready(function(){
    $('#includeButton').click(function(){
        // Make an AJAX request to include the PHP file
        $.ajax({
            url: 'include_file.php',
            type: 'GET',
            success: function(response){
                // Handle the response from the server
                $('#result').html(response);
            },
            error: function(xhr, status, error){
                // Handle errors
                console.error(xhr.responseText);
            }
        });
    });
});
