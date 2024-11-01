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
