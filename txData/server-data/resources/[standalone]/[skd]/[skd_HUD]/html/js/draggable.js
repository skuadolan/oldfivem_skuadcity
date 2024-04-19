/** @format */

const idDraggable = [
  'draggable-health',
  'draggable-armour',
  'draggable-hunger',
  'draggable-thirsty',
  'draggable-id-player',
  'draggable-biodata-player',
  'draggable-player-job',
  'draggable-player-money',
  'draggable-player-bank',
  'draggable-speedmeter',
  'draggable-fuelmeter',
  'draggable-oilmeter',
  'draggable-seatbelt',
  'draggable-cruise-controll',
];

for (const listdraggable of idDraggable) {
  dragElement(document.getElementById(listdraggable));
}

function dragElement(elmnt) {
  let pos1 = 0,
    pos2 = 0,
    pos3 = 0,
    pos4 = 0;

  if (document.getElementById(elmnt.id + 'header')) {
    document.getElementById(elmnt.id + 'header').onmousedown = dragMouseDown;
  } else {
    elmnt.onmousedown = dragMouseDown;
  }

  function dragMouseDown(e) {
    e = e || window.event;
    e.preventDefault();
    pos3 = e.clientX;
    pos4 = e.clientY;
    document.onmouseup = closeDragElement;
    document.onmousemove = elementDrag;
  }

  function elementDrag(e) {
    e = e || window.event;
    e.preventDefault();
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    elmnt.style.top = elmnt.offsetTop - pos2 + 'px';
    elmnt.style.left = elmnt.offsetLeft - pos1 + 'px';
  }

  function closeDragElement() {
    document.onmouseup = null;
    document.onmousemove = null;
  }
}
