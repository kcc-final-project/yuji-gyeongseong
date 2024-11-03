$(document).ready(function () {
    $(".truncate-text").each(function () {
        var $this = $(this);
        var text = $this.text();
        var maxLength = 19;
        if (text.length > maxLength) {
            $this.data("full-text", text);
            $this.text(text.substring(0, maxLength) + "...");
        }
    });

    $(".truncate-text").on("click", function () {
        var $this = $(this);
        var fullText = $this.data("full-text");
        if ($this.hasClass("full-text")) {
            var maxLength = 19;
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

// 날짜 지날시 변경용
document.addEventListener("DOMContentLoaded", function() {
    const currentDate = new Date();
    const rows = document.querySelectorAll("tbody tr");

    rows.forEach(row => {
        const closedAtText = row.cells[4].innerText;
        const closedAtDate = new Date(closedAtText);

        if (closedAtDate < currentDate) {

            const editButton = row.querySelector(".btn-edit");
            const cancelButton = row.querySelector(".btn-cancel");

            if (editButton) {
                editButton.classList.add("ctm-btn-gray");
                editButton.disabled = true;
            }

            if (cancelButton) {
                cancelButton.classList.add("ctm-btn-gray");
                cancelButton.disabled = true;
            }
        }
    });
});

// 의견공유용
document.addEventListener("DOMContentLoaded", function() {
    const currentDate = new Date();
    const rows = document.querySelectorAll("tbody tr");

    rows.forEach(row => {
        const closedAtText = row.cells[4].innerText;
        const closedAtDate = new Date(closedAtText);

        if (closedAtDate +11 > currentDate) {

            const opinionButton = row.querySelector(".btn-opinion");

            if (opinionButton) {
                opinionButton.classList.add("ctm-btn-orange");
                opinionButton.disabled = true;
            }
        }
    });
});
