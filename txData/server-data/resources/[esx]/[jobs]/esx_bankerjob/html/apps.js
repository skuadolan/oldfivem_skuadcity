window.addEventListener("message", function (event) {
  var item = event.data;

  if (item.action == true) {
    $("#list_properties").html('')
    $("#list_properties").append(`<table class="table table-light"><thead><tr><th scope="col">No</th><th scope="col">Toko</th><th scope="col">Biaya</th><th scope="col">Kadaluarsa</th><th scope="col">Pemilik</th><th scope="col">Map</th></tr></thead><tbody id="body_table"></tbody></table>`)
    for (let i = 0; i < item.lengthProperties; i++) {
      var tempNameOwner = ' - ';
      if (item.freeProperties[i].owner_name == null) {
        tempNameOwner = ' - ';
      }else{
        tempNameOwner = item.freeProperties[i].owner_name
      }
      var tempDateExpired = ' - ';
      if (item.freeProperties[i].expired == null) {
        tempDateExpired = ' - ';
      }else{
        tempDateExpired = item.freeProperties[i].expired
      }
      if (i % 2 === 0){
        $("#body_table").append(`<tr class="table-info"><td scope="col">`+(i+1)+`</td><td scope="col">`+item.freeProperties[i].store_label+`</td><td scope="col">Rp.`+item.freeProperties[i].price+`</td><td scope="col">`+tempDateExpired+`</td><td scope="col">`+tempNameOwner+`</td><td scope="col">Map</td></tr>`);
      }else{
        $("#body_table").append(`<tr class="table-light"><td scope="col">`+(i+1)+`</td><td scope="col">`+item.freeProperties[i].store_label+`</td><td scope="col">Rp.`+item.freeProperties[i].price+`</td><td scope="col">`+tempDateExpired+`</td><td scope="col">`+tempNameOwner+`</td><td scope="col">Map</td></tr>`);
      }
    }
    $(".container").attr("style", "display: block !important;");
    $("body").fadeIn();
  } else {
    $("body").fadeOut();
  }
});

window.addEventListener("keyup", function onEvent(event) {
  // Close menu when key is released
  if (event.key == "F2") {
    $.post("http://esx_bankerjob/cJobs", JSON.stringify({}));
  }
});
