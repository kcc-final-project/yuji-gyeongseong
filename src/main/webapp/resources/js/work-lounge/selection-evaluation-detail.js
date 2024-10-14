$(document).ready(function () {
  $(".truncate-text").each(function () {
    var $this = $(this);
    var text = $this.text();
    var maxLength = 68;
    if (text.length > maxLength) {
      $this.data("full-text", text);
      $this.text(text.substring(0, maxLength) + "...");
    }
  });

  $(".truncate-text").on("click", function () {
    var $this = $(this);
    var fullText = $this.data("full-text");
    if ($this.text().includes("...")) {
      $this.text(fullText);
    } else {
      var maxLength = 68;
      $this.text(fullText.substring(0, maxLength) + "...");
    }
  });
});
