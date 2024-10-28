$(document).ready(function () {
    $(".truncate-text").each(function () {
        var $this = $(this);
        var text = $this.text();
        var maxLength = 70;
        if (text.length > maxLength) {
            $this.data("full-text", text);
            $this.text(text.substring(0, maxLength) + "...");
        }
    });

    $(".truncate-text").on("click", function () {
        var $this = $(this);
        var fullText = $this.data("full-text");
        if ($this.hasClass("full-text")) {
            var maxLength = 70;
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
        var maxLength = 80;
        if (text.length > maxLength) {
            $this.data("full-text", text);
            $this.text(text.substring(0, maxLength) + "...");
        }
    });

    $(".truncate-text1").on("click", function () {
        var $this = $(this);
        var fullText = $this.data("full-text");
        if ($this.hasClass("full-text")) {
            var maxLength = 80;
            $this.removeClass("full-text");
            $this.text(fullText.substring(0, maxLength) + "...");
        } else {
            $this.addClass("full-text");
            $this.text(fullText);
        }
    });

    updateDivClasses();
});

function updateDivClasses() {
    const divs = document.querySelectorAll(".div-class");
    divs.forEach((div) => {
        const text = div.textContent.trim();
        switch (text) {
            case "접수중":
                div.className = "div-class badge text-bg-success";
                break;
            case "접수마감":
                div.className = "div-class badge text-bg-danger";
                break;
            case "몰루":
                div.className = "div-class badge text-bg-warning";
                break;
            case "접수예정":
                div.className = "div-class badge text-bg-primary";
                break;
            default:
                break;
        }
    });
}


