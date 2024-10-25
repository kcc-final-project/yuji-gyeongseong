$(document).ready(function () {
  $(".truncate-text").each(function () {
    var $this = $(this);
    var text = $this.val();
    var maxLength = 40;
    if (text.length > maxLength) {
      $this.data("full-text", text);
      $this.val(text.substring(0, maxLength) + "...");
    }
  });
  $(".truncate-text").on("click", function () {
    var $this = $(this);
    var fullText = $this.data("full-text");
    if ($this.val().includes("...")) {
      $this.val(fullText);
    } else {
      var maxLength = 40;
      $this.val(fullText.substring(0, maxLength) + "...");
    }
  });
});

$(document).ready(function () {
  $("#startDate, #endDate").datepicker({
    format: "yyyy-mm-dd",
    autoclose: true,
  });

  function fetchData(startDate, endDate) {
    $.ajax({
      url: "fetch_data.php",
      type: "GET",
      data: { start_date: startDate, end_date: endDate },
      dataType: "json",
      success: function (data) {},
    });
  }

  $("#startDate, #endDate").on("change", function () {
    var startDate = $("#startDate").val();
    var endDate = $("#endDate").val();
    if (startDate && endDate) {
      fetchData(startDate, endDate);
    }
  });
});
