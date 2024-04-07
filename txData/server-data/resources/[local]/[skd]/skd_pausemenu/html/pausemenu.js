$(document).ready(function () {
  window.addEventListener("message", function (event) {
    var item = event.data;
    if (item.open == true) {
      $("#main-container").removeClass("hidden");
    } else if (item.open == false) {
      $("#main-container").addClass("hidden");
    }
  });
  $(function () {
    window.addEventListener("keydown", function onEvent(event) {
      // Close menu when key is released
      if (event.key == "Escape" || event.key == "Esc") {
        $("#rules-container").fadeOut(250);
        $("#news-container").fadeOut(250);
        $("#reports-container").fadeOut(250);
        $("#main-container").addClass("hidden");
        $.post("http://skd_pausemenu/Close", JSON.stringify({}));
      }
    });
  });
  $(".content-btn0").click(function () {
    // $.post("http://skd_pausemenu/Close", JSON.stringify({}));
    $("#about-container").removeClass("hidden");
    $("#about-container").fadeIn(250);
    $("#rules-container").fadeOut(250);
    $("#news-container").fadeOut(250);
    $("#reports-container").fadeOut(250);
  });
  $(".content-btn1").click(function () {
    $.post("http://skd_pausemenu/MAP", JSON.stringify({}));
  });
  $(".content-btn2").click(function () {
    $("#news-container").removeClass("hidden");
    $("#news-container").fadeIn(250);
    $("#rules-container").fadeOut(250);
    $("#about-container").fadeOut(250);
    $("#reports-container").fadeOut(250);
  });
  $(".content-btn3").click(function () {
    $("#news-container").fadeOut(250);
    $("#about-container").fadeOut(250);
    $("#reports-container").fadeOut(250);
    $("#rules-container").fadeIn(250);
  });
  $(".content-btn4").click(function () {
    $("#rules-container").fadeOut(250);
    $("#about-container").fadeOut(250);
    $("#news-container").fadeOut(250);
    $("#reports-container").fadeIn(250);
  });
  $(".content-btn5").click(function () {
    $("#rules-container").fadeOut();
    $("#about-container").fadeOut(250);
    $.post("http://skd_pausemenu/Settings", JSON.stringify({}));
  });
  $(".content-btn6").click(function () {
    $("#rules-container").fadeOut();
    $("#about-container").fadeOut(250);
    $.post("http://skd_pausemenu/DropPlayer", JSON.stringify({}));
  });
  $("#form-submit-btn").click(function () {
    if (
      $("#fname").val() === "" ||
      $("#fname").val() === "" ||
      $("#lname").val() === "" ||
      $("#reporttype").val() === "" ||
      $("#subject").val() === "" ||
      $("#description").val() === ""
    ) {
      $(".form-container").fadeOut(250);
      $("#form-alert-container").fadeIn(250);
    } else {
      var fname = $("#fname").val();
      var lname = $("#lname").val();
      var reporttype = $("#reporttype").val();
      var subject = $("#subject").val();
      var description = $("#description").val();
      $.post(
        "https://skd_pausemenu/NewReport",
        JSON.stringify({
          fname: fname,
          lname: lname,
          reporttype: reporttype,
          subject: subject,
          description: description,
        })
      );
      ClearForm();
      $("#reports-container").fadeOut();
    }
  });
  $(".form-failed-btn").click(function () {
    $("#form-alert-container").fadeOut(250);
    $(".form-container").fadeIn(250);
  });
});

function ClearForm() {
  $("#fname").val("");
  $("#lname").val("");
  $("#reporttype").val("");
  $("#subject").val("");
  $("#description").val("");
}
