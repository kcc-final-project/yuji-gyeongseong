$(document).ready(function() {
    $('#composeButton').on('click', function() {
        $("#committee-standby").hide();
        $("#committee-info").show();
        $(".committee-summary").show();
    });
});