/** @format */

$(document).ready(() => {
  $('#rotate-health').change(function () {
    if ($(this).is(':checked')) {
      $('#draggable-health').attr('class', 'rotate-container-progress-bar');
    } else {
      $('#draggable-health').removeClass('rotate-container-progress-bar');
    }
  });
  $('#rotate-armour').change(function () {
    if ($(this).is(':checked')) {
      $('#draggable-armour').attr('class', 'rotate-container-progress-bar');
    } else {
      $('#draggable-armour').removeClass('rotate-container-progress-bar');
    }
  });
  $('#rotate-hunger').change(function () {
    if ($(this).is(':checked')) {
      $('#draggable-hunger').attr('class', 'rotate-container-progress-bar');
    } else {
      $('#draggable-hunger').removeClass('rotate-container-progress-bar');
    }
  });
  $('#rotate-thirsty').change(function () {
    if ($(this).is(':checked')) {
      $('#draggable-thirsty').attr('class', 'rotate-container-progress-bar');
    } else {
      $('#draggable-thirsty').removeClass('rotate-container-progress-bar');
    }
  });

  let isDisplayAll = true;
  let isHealthActive = true;
  $('#display-health').change(function () {
    if ($(this).is(':checked')) {
      if (isDisplayAll) {
        $('#draggable-health').css({ visibility: 'visible' });
      }
      isHealthActive = true;
    } else {
      $('#draggable-health').css({ visibility: 'collapse' });
      isHealthActive = false;
    }
  });

  let isArmourActive = true;
  $('#display-armour').change(function () {
    if ($(this).is(':checked')) {
      if (isDisplayAll) {
        $('#draggable-armour').css({ visibility: 'visible' });
      }
      isArmourActive = true;
    } else {
      $('#draggable-armour').css({ visibility: 'collapse' });
      isArmourActive = false;
    }
  });

  let isHungerActive = true;
  $('#display-hunger').change(function () {
    if ($(this).is(':checked')) {
      if (isDisplayAll) {
        $('#draggable-hunger').css({ visibility: 'visible' });
      }
      isHungerActive = true;
    } else {
      $('#draggable-hunger').css({ visibility: 'collapse' });
      isHungerActive = false;
    }
  });

  let isThirstyActive = true;
  $('#display-thirsty').change(function () {
    if ($(this).is(':checked')) {
      if (isDisplayAll) {
        $('#draggable-thirsty').css({ visibility: 'visible' });
      }
      isThirstyActive = true;
    } else {
      $('#draggable-thirsty').css({ visibility: 'collapse' });
      isThirstyActive = false;
    }
  });

  let isIDActive = true;
  $('#display-id-player').change(function () {
    if ($(this).is(':checked')) {
      if (isDisplayAll) {
        $('#draggable-id-player').css({ visibility: 'visible' });
      }
      isIDActive = true;
    } else {
      $('#draggable-id-player').css({ visibility: 'collapse' });
      isIDActive = false;
    }
  });

  let isBioActive = true;
  $('#display-biodata-player').change(function () {
    if ($(this).is(':checked')) {
      if (isDisplayAll) {
        $('#draggable-biodata-player').css({ visibility: 'visible' });
      }
      isBioActive = true;
    } else {
      $('#draggable-biodata-player').css({ visibility: 'collapse' });
      isBioActive = false;
    }
  });

  let isPLayerJobActive = true;
  $('#display-player-job').change(function () {
    if ($(this).is(':checked')) {
      if (isDisplayAll) {
        $('#draggable-player-job').css({ visibility: 'visible' });
      }
      isPLayerJobActive = true;
    } else {
      $('#draggable-player-job').css({ visibility: 'collapse' });
      isPLayerJobActive = false;
    }
  });

  let isPlayerMoneyActive = true;
  $('#display-player-money').change(function () {
    if ($(this).is(':checked')) {
      if (isDisplayAll) {
        $('#draggable-player-money').css({ visibility: 'visible' });
      }
      isPlayerMoneyActive = true;
    } else {
      $('#draggable-player-money').css({ visibility: 'collapse' });
      isPlayerMoneyActive = false;
    }
  });

  let isBankActive = true;
  $('#display-player-bank').change(function () {
    if ($(this).is(':checked')) {
      if (isDisplayAll) {
        $('#draggable-player-bank').css({ visibility: 'visible' });
      }
      isBankActive = true;
    } else {
      $('#draggable-player-bank').css({ visibility: 'collapse' });
      isBankActive = false;
    }
  });

  $('#display-all').change(function () {
    if ($(this).is(':checked')) {
      if (isHealthActive) {
        $('#draggable-health').css({ visibility: 'visible' });
      }
      if (isArmourActive) {
        $('#draggable-armour').css({ visibility: 'visible' });
      }
      if (isHungerActive) {
        $('#draggable-hunger').css({ visibility: 'visible' });
      }
      if (isThirstyActive) {
        $('#draggable-thirsty').css({ visibility: 'visible' });
      }

      if (isIDActive) {
        $('#draggable-id-player').css({ visibility: 'visible' });
      }
      if (isBioActive) {
        $('#draggable-biodata-player').css({ visibility: 'visible' });
      }
      if (isPLayerJobActive) {
        $('#draggable-player-job').css({ visibility: 'visible' });
      }
      if (isPlayerMoneyActive) {
        $('#draggable-player-money').css({ visibility: 'visible' });
      }
      if (isBankActive) {
        $('#draggable-player-bank').css({ visibility: 'visible' });
      }
      isDisplayAll = true;
    } else {
      $('#draggable-health').css({ visibility: 'collapse' });
      $('#draggable-armour').css({ visibility: 'collapse' });
      $('#draggable-hunger').css({ visibility: 'collapse' });
      $('#draggable-thirsty').css({ visibility: 'collapse' });

      $('#draggable-id-player').css({ visibility: 'collapse' });
      $('#draggable-biodata-player').css({ visibility: 'collapse' });
      $('#draggable-player-job').css({ visibility: 'collapse' });
      $('#draggable-player-money').css({ visibility: 'collapse' });
      $('#draggable-player-bank').css({ visibility: 'collapse' });
      isDisplayAll = false;
    }
  });
});
