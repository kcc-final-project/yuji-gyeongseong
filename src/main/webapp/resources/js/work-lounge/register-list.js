$(document).ready(function () {
    $(".truncate-text").each(function () {
        var $this = $(this);
        var text = $this.text();
        var maxLength = 20;
        if (text.length > maxLength) {
            $this.data("full-text", text);
            $this.text(text.substring(0, maxLength) + "...");
        }
    });

    $(".truncate-text").on("click", function () {
        var $this = $(this);
        var fullText = $this.data("full-text");
        if ($this.hasClass("full-text")) {
            var maxLength = 20;
            $this.removeClass("full-text");
            $this.text(fullText.substring(0, maxLength) + "...");
        } else {
            $this.addClass("full-text");
            $this.text(fullText);
        }
    });

    $(".truncate-text1").each(function () {
        var $this = $(this);
        var text = $this.text();
        var maxLength = 15;
        if (text.length > maxLength) {
            $this.data("full-text", text);
            $this.text(text.substring(0, maxLength) + "...");
        }
    });

    $(".truncate-text1").on("click", function () {
        var $this = $(this);
        var fullText = $this.data("full-text");
        if ($this.hasClass("full-text")) {
            var maxLength = 15;
            $this.removeClass("full-text");
            $this.text(fullText.substring(0, maxLength) + "...");
        } else {
            $this.addClass("full-text");
            $this.text(fullText);
        }
    });

});
