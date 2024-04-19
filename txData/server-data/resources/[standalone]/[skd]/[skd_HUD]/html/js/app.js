window.addEventListener("message", function (event) {
  eFunc = event.data;
  if (event.data.action == "show") {
    $(".speedometer").html(Number(eFunc.speed));
    $(".fuelmeter").html(Number(eFunc.fuelLevel));
    $(".streetname").html(eFunc.laststreet);
    $(".compasstext").html("  | " + eFunc.degree + "  |");

    if (Number(eFunc.speed) >= 60 && Number(eFunc.speed) <= 100) {
      $(".speedometer").attr("style", "color:orange !important; display: block !important;");
    } else if (Number(eFunc.speed) >= 100) {
      $(".speedometer").attr("style", "color:red !important; display: block !important;");
    } else {
      $(".speedometer").attr("style", "color:white !important; display: block !important;");
    }

    if (Number(eFunc.damagelevel) >= 25 && Number(eFunc.damagelevel) <= 50) {
      $(".damagemeter").attr("style", "color:orange !important; display: block !important;");
    } else if (Number(eFunc.damagelevel) <= 25) {
      $(".damagemeter").attr("style", "color:red !important; display: block !important;");
    } else {
      $(".damagemeter").attr("style", "color:white !important; display: block !important;");
    }

    if (Number(eFunc.fuelLevel) >= 25 && Number(eFunc.fuelLevel) <= 50) {
      $(".fuelmeter").attr("style", "color:orange !important; display: block !important;");
    } else if (Number(eFunc.fuelLevel) <= 25) {
      $(".fuelmeter").attr("style", "color:red !important; display: block !important;");
    } else {
      $(".fuelmeter").attr("style", "color:white !important; display: block !important;");
    }

    if (Number(eFunc.damagelevel) == 0) {
      $(".damagemeter").html(0);
    } else {
      $(".damagemeter").html(Number(eFunc.damagelevel));
    }

    if (eFunc.gearlevel <= 0) {
      $(".gear").html("R");
    } else {
      $(".gear").html(Number(eFunc.gearlevel));
    }

    if (eFunc.isCar) {
      if (eFunc.seatbeltIndc) {
        $(".seatbelt").attr("style", "color:green !important; display: block !important;");
      } else {
        $(".seatbelt").attr("style", "color:yellow !important; display: block !important;");
      }
    } else {
      $(".seatbelt").attr("style", "display: none !important;");
    }

    if (eFunc.isCruised) {
      $(".cruised").html('Cruised');
      $(".cruised").attr("style", "background-color:green !important; display: block !important;");
    } else {
      $(".cruised").html('Not Cruised');
      $(".cruised").attr("style", "background-color:red !important; display: block !important;");
    }

    $(".Container").fadeIn();

    // $(".Container").css({"display":"block"});
    $("body").show();
  } else if (event.data.action == "hide") {
    $(".Container").fadeOut();
  }

  if (event.data.barHP == "show") {
    $(".idPlayer").html("ID: "+event.data.idPlayer);

    if (event.data.isUnderwater) {
      $(".health").attr("style", "width:"+(event.data.health - 100)+"% !important");
      $(".armour").attr("style", "width:"+Math.round(event.data.armour)+"% !important");
      $("#breath_container").attr("class", "col");
      $("#breath_container").html(`<div id="breath" class="breath"></div>`);
      $(".breath").attr("style", "width:"+event.data.oxygen+"% !important");
      $("#breath_container").fadeIn();
    } else {
      $(".health").attr("style", "width:"+(event.data.health - 100)+"% !important");
      $(".armour").attr("style", "width:"+Math.round(event.data.armour)+"% !important");
      $(".breath").attr("style", "width:"+event.data.oxygen+"% !important");
      if (event.data.oxygen == 100) {
        $("#breath_container").fadeOut();
      } 
    }
    $(".healthcontainer").show();
  }

  if (event.data.radialmenu == "show") {
    $(".container_radialmenu").attr("style", "display: block !important");
    /*$(".container_radialmenu").fadeIn();*/
  } else if (event.data.radialmenu == "hide"){
    $(".container_radialmenu").fadeOut();
  }
});

$("#closeRadialmenu").click(function () {
	$.post('http://skd_HUD/closeRadialmenu', JSON.stringify({}));
});