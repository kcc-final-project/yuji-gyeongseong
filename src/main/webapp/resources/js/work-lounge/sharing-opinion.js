$(function () {
  var cloneObj = $(".uploadDiv").clone();
  $("#uploadBtn").on("click", function (e) {
    var formData = new FormData();
    var inputFile = $("input[name='uploadFile']");
    var files = inputFile[0].files;

    console.log(files);

    for (var i = 0; i < files.length; i++) {
      if (!checkExtension(files[i].name, files[i].size)) {
        return false;
      }

      formData.append("uploadFile", files[i]);
    }

    $.ajax({
      url: "/uploadAjaxAction",
      processData: false,
      contentType: false,
      data: formData,
      type: "POST",
      success: function (result) {
        showUploadedFile(result);
        $(".uploadDiv").html(cloneObj.html());
      },
    });
  });

  var uploadResult = $(".uploadResult ul");

  function showUploadedFile(uploadResultArr) {
    var str = "";

    $(uploadResultArr).each(function (i, obj) {
      if (!obj.image) {
        var fileCallPath = encodeURIComponent(
          obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName,
        );

        var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");

        str +=
          "<li><div><a href='/download?fileName=" +
          fileCallPath +
          "'>" +
          "<img src='/resources/img/attach.png'>" +
          obj.fileName +
          "</a>" +
          "<span data-file='" +
          fileCallPath +
          "' data-type='file'> x </span>" +
          "<div></li>";
      } else {
        var fileCallPath = encodeURIComponent(
          obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName,
        );

        var originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;

        originPath = originPath.replace(new RegExp(/\\/g), "/");

        str +=
          "<li><a href=\"javascript:showImage('" +
          originPath +
          "')\">" +
          "<img src='display?fileName=" +
          fileCallPath +
          "'></a>" +
          "<span data-file='" +
          fileCallPath +
          "' data-type='image'> x </span>" +
          "<li>";
      }
    });

    uploadResult.append(str);
  }
});

function showImage(fileCallPath) {
  $(".bigPictureWrapper").css("display", "flex").show();

  $(".bigPicture")
    .html("<img src='/display?fileName=" + fileCallPath + "'>")
    .animate({ width: "100%", height: "100%" }, 1000);
}

$(".bigPictureWrapper").on("click", function (e) {
  $(".bigPicture").animate({ width: "0%", height: "0%" }, 1000);
  setTimeout(() => {
    $(this).hide();
  }, 1000);
});

$(".uploadResult").on("click", "span", function (e) {
  var targetFile = $(this).data("file");
  var type = $(this).data("type");
  console.log(targetFile);

  $.ajax({
    url: "/deleteFile",
    data: { fileName: targetFile, type: type },
    dataType: "text",
    type: "POST",
    success: function (result) {
      alert(result);
    },
  });
});

var regex = new RegExp("(.*?).(exe|sh|zip|alz)$");
var maxSize = 5242880;
function checkExtension(fileName, fileSize) {
  if (fileSize >= maxSize) {
    alert("파일 사이즈 초과");
    return false;
  }

  if (regex.test(fileName)) {
    alert("해당 종류의 파일은 업로드할 수 없습니다.");
    return false;
  }
  return true;
}

$(".file_btn").click(function () {
  let uploadDiv = $(this).parents("td").find(".uploadDiv_area");
  let textareaDiv = $(this).parents("td").find(".text_area_div");

  if (uploadDiv.hasClass("d-none")) {
    uploadDiv.removeClass("d-none");
    textareaDiv.css("width", "50%");
    $(this).text("X");
  } else {
    uploadDiv.addClass("d-none");
    textareaDiv.css("width", "100%");
    $(this).text("첨부파일");
  }
});

$(".submit_btn").click(function () {
  let title = $(this).parents("td").find(".title_area").val();
  let content = $(this).parents("td").find(".content_area").val();

  var formData = new FormData();
  formData.append("title", title);
  formData.append("content", content);

  $.ajax({
    url: "/savePost",
    method: "POST",
    data: formData,
    processData: false,
    contentType: false,
    success: function (response) {
      alert("게시물이 성공적으로 저장되었습니다!");
    },
    error: function (error) {
      alert("게시물을 저장하는 동안 오류가 발생했습니다.");
    },
  });
});

$(document).ready(function () {
  $("#commentsSection").collapse("hide");
  $("#commentsSection1").collapse("hide");

  $('.btn[data-toggle="collapse"]').click(function () {
    var clickedButtonId = $(this).attr("id");

    $('.btn[data-toggle="collapse"]')
      .not("#" + clickedButtonId)
      .each(function () {
        $($(this).data("target")).collapse("hide");
      });
  });
});
