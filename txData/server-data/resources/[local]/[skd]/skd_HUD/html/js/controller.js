/** @format */
const formatMoney = (x) => {
  return Intl.NumberFormat("id-ID", { style: "currency", currency: "IDR" }).format(x);
};

const Meter = function Meter($elm, config) {
  // DOM
  let $needle, $value;

  // Others

  let steps = (config.valueMax - config.valueMin) / config.valueStep,
    angleStep = (config.angleMax - config.angleMin) / steps;

  let margin = 10; // in %
  let angle = 0; // in degrees

  let value2angle = function (value) {
    let angle = (value / (config.valueMax - config.valueMin)) * (config.angleMax - config.angleMin) + config.angleMin;

    return angle;
  };

  this.setValue = function (v) {
    // $needle.style.transform = 'translate3d(-50%, 0, 0) rotate(' + Math.round(value2angle(v)) + 'deg)';
    $value.innerHTML = config.needleFormat(v);
  };

  let switchLabel = function (e) {
    e.target.closest(".meter").classList.toggle("meter--big-label");
  };

  let makeElement = function (parent, className, innerHtml, style) {
    let e = document.createElement("div");
    e.className = className;

    if (innerHtml) {
      e.innerHTML = innerHtml;
    }

    if (style) {
      for (var prop in style) {
        e.style[prop] = style[prop];
      }
    }

    parent.appendChild(e);

    return e;
  };

  // Label unit
  makeElement($elm, "label label-unit", config.valueUnit);

  for (let n = 0; n < steps + 1; n++) {
    let value = config.valueMin + n * config.valueStep;
    angle = config.angleMin + n * angleStep;

    // Graduation numbers

    // Red zone
    let redzoneClass = "";
    if (value > config.valueRed) {
      redzoneClass = " redzone";
    }

    makeElement($elm, "grad grad--" + n + redzoneClass, config.labelFormat(value), {
      left: 50 - (50 - margin) * Math.sin(angle * (Math.PI / 180)) + "%",
      top: 50 + (50 - margin) * Math.cos(angle * (Math.PI / 180)) + "%",
    });

    // Tick
    makeElement($elm, "grad-tick grad-tick--" + n + redzoneClass, "", {
      left: 50 - 50 * Math.sin(angle * (Math.PI / 180)) + "%",
      top: 50 + 50 * Math.cos(angle * (Math.PI / 180)) + "%",
      // transform: 'translate3d(-50%, 0, 0) rotate(' + (angle + 180) + 'deg)',
    });

    // Half ticks
    angle += angleStep / 2;

    if (angle < config.angleMax) {
      makeElement($elm, "grad-tick grad-tick--half grad-tick--" + n + redzoneClass, "", {
        left: 50 - 50 * Math.sin(angle * (Math.PI / 180)) + "%",
        top: 50 + 50 * Math.cos(angle * (Math.PI / 180)) + "%",
        transform: "translate3d(-50%, 0, 0) rotate(" + (angle + 180) + "deg)",
      });
    }

    // Quarter ticks
    angle += angleStep / 4;

    if (angle < config.angleMax) {
      makeElement($elm, "grad-tick grad-tick--quarter grad-tick--" + n + redzoneClass, "", {
        left: 50 - 50 * Math.sin(angle * (Math.PI / 180)) + "%",
        top: 50 + 50 * Math.cos(angle * (Math.PI / 180)) + "%",
        transform: "translate3d(-50%, 0, 0) rotate(" + (angle + 180) + "deg)",
      });
    }

    angle -= angleStep / 2;

    if (angle < config.angleMax) {
      makeElement($elm, "grad-tick grad-tick--quarter grad-tick--" + n + redzoneClass, "", {
        left: 50 - 50 * Math.sin(angle * (Math.PI / 180)) + "%",
        top: 50 + 50 * Math.cos(angle * (Math.PI / 180)) + "%",
        transform: "translate3d(-50%, 0, 0) rotate(" + (angle + 180) + "deg)",
      });
    }
  }

  // NEEDLE

  angle = value2angle(config.value);

  $needle = makeElement($elm, "needle", "", {
    transform: "translate3d(-50%, 0, 0) rotate(" + angle + "deg)",
  });

  let $axle = makeElement($elm, "needle-axle").addEventListener("click", switchLabel);
  makeElement(
    $elm,
    "label label-value"
    // '<div>' + config.labelFormat(config.value) + '</div>' + '<span>' + config.labelUnit + '</span>'
  ).addEventListener("click", switchLabel);

  $value = $elm.querySelector(".label-value div");
};

// const rpmMeter = new Meter(document.querySelector(".meter--rpm"), {
//   value: 6.3,
//   valueMin: 0,
//   valueMax: 4000,
//   valueStep: 1000,
//   valueUnit: "<div>RPM</div><span>x1000</span>",
//   angleMin: 30,
//   angleMax: 330,
//   labelUnit: "RPM",
//   labelFormat: function (v) {
//     return Math.round(v / 1000);
//   },
//   needleFormat: function (v) {
//     return Math.round(v / 100) * 100;
//   },
//   valueRed: 6500,
// });

const speedMeter = new Meter(document.querySelector(".meter--speed"), {
  value: 203,
  valueMin: 0,
  valueMax: 240,
  valueStep: 20,
  valueUnit: "<span>Speed</span><div>Km/h</div>",
  angleMin: 30,
  angleMax: 330,
  labelUnit: "Km/h",
  labelFormat: function (v) {
    return Math.round(v);
  },
  needleFormat: function (v) {
    return Math.round(v);
  },
});

// const valueRPM = function (value) {
//   let angle = (value / (4000 - 0)) * (330 - 30) + 30;

//   return angle;
// };
const valueSpeedMeter = function (value) {
  let angle = (value / (240 - 30)) * (330 - 30) + 30;

  return angle;
};

window.addEventListener("message", function (event) {
  const isPanelOpen = event.data.isPanelOpen;
  if (isPanelOpen) {
    $(`#container-panel`).css("display", "flex");
    $(`#background-grid-line`).css({
      "background-image": "linear-gradient(45deg, whitesmoke, 0.1px, transparent)",
      "background-size": "10px 10px",
      "background-position": "-1px -1px",
    });
    // $(`body`).css({
    //   'background-color': 'whitesmoke',
    // });
  } else {
    $(`#container-panel`).css("display", "none");
    $(`#background-grid-line`).removeAttr("style");
    $(`body`).css("background-color", "transparent");
  }

  const isPauseMenuOpen = event.data.isPauseMenuOpen;
  if (isPauseMenuOpen) {
    $(`#container-skd_HUD`).css("display", "none");
  } else {
    $(`#container-skd_HUD`).css("display", "block");
  }

  const reqVehicles = event.data;
  if (reqVehicles.isInVehicles) {
    $(`#container-speedmeter`).css("display", "flex");

    if (reqVehicles.isSeatbeltOn) {
      $("#seatbelt-text").css({
        color: "#008000",
        fill: "#008000",
      });
      $("div#icon span#seatbelt-icon").css({
        color: "#008000",
        fill: "#008000",
      });
    } else {
      $("div#icon span#seatbelt-icon").css({
        color: "#FF5733",
        fill: "#FF5733",
      });
      $("#seatbelt-text").css({
        color: "#FF5733",
        fill: "#FF5733",
      });
    }

    if (reqVehicles.isCruiseControllOn) {
      $("#cruise-controll-text").css({
        color: "#008000",
        fill: "#008000",
      });
      $("div#icon i.fa-gauge").css({
        color: "#008000",
        fill: "#008000",
      });
    } else {
      $("div#icon i.fa-gauge").css({
        color: "#FF5733",
        fill: "#FF5733",
      });
      $("#cruise-controll-text").css({
        color: "#FF5733",
        fill: "#FF5733",
      });
    }

    $("span#fuelmeter-text").html(`${Math.round(reqVehicles.FuelLevel)}%`);
    $(`#fuelmeter-status-bar`).attr("style", "width:" + Math.round(reqVehicles.FuelLevel) + "% !important");
    $("span#oilmeter-text").html(`${Math.round(reqVehicles.OilLevel)}%`);
    $(`#oilmeter-status-bar`).attr("style", "width:" + Math.round(reqVehicles.OilLevel) + "% !important");
    const gearMeter = document.querySelector(".meter--gear div");
    const tempGearLevel = Math.ceil(parseInt(reqVehicles.GearLevel));
    const GearLevel = Number(tempGearLevel);
    if (GearLevel < 1) {
      gearMeter.innerHTML = "R";
    } else {
      gearMeter.innerHTML = GearLevel;
    }

    let speed = reqVehicles.SpeedLevel;
    // let rpm = speed / (60 * 0.17 * GearLevel * ((Math.PI * 0.5) / 1000));

    // let oldSpeed = speed,
    //   rpmRedzone = 6500,
    //   rpmIdle = 1200,
    //   oldRpm = rpm;

    if (speed < 0) {
      speed = 0;
    }

    // Idle
    // if (rpm < rpmIdle) {
    //   rpm = oldRpm;
    //   speed = oldSpeed;
    // }

    // Gear shifter
    // if (rpm > rpmRedzone) {
    //   gearMeter.classList.add("redzone");
    // } else {
    //   gearMeter.classList.remove("redzone");
    // }

    // Update GUI
    // const needle_RPM = document.querySelector(".meter--rpm .needle");
    // needle_RPM.style.transform = "translate3d(-50%, 0, 0) rotate(" + Math.round(valueRPM(rpm)) + "deg)";
    const needle_Speed = document.querySelector(".meter--speed .needle");
    needle_Speed.style.transform = "translate3d(-50%, 0, 0) rotate(" + Math.round(valueSpeedMeter(speed)) + "deg)";
  } else {
    $(`#container-speedmeter`).css("display", "none");
  }

  const Req = event.data;
  $(`#health-status-bar`).attr("style", "width:" + (Req.health - 100) + "% !important");
  $(`#armour-status-bar`).attr("style", "width:" + Math.round(Req.armour) + "% !important");
  $(`#hunger-status-bar`).attr("style", "width:" + Math.round(Req.hunger) + "% !important");
  $(`#thirsty-status-bar`).attr("style", "width:" + Math.round(Req.thristy) + "% !important");

  $(`#draggable-id-player .progress-bar-container`).html(`${Req.idPlayer}`);
  //   $(`#draggable-biodata-player .progress-bar-container`).html(`${Req.playerName}`);
  $(`#draggable-player-job .progress-bar-container`).html(`${Req.job_label} - ${Req.job_grade}`);

  const xPlayerAccount = JSON.parse(Req.accounts);

  let tempMoney = 0;
  let tempBank = 0;
  for (const list of xPlayerAccount) {
    if (list.name == "money") {
      tempMoney = list.money;
    }
    if (list.name == "bank") {
      tempBank = list.money;
    }
  }

  $(`#draggable-player-money .progress-bar-container`).html(`${formatMoney(tempMoney)}`);
  $(`#draggable-player-bank .progress-bar-container`).html(`${formatMoney(tempBank)}`);
});
