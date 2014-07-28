console.log(gon.scores)
console.log(gon.scores.original_image.url)
console.log(Vex.Flow)

function getParameter(name) {
  name = name.replace(/\[]/, "\\\[").replace(/[\]]/, "\\\]");
  var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
  var results = regex.exec(window.location.search);
  if (results == null) return undefined;
  else return decodeURIComponent(results[1].replace(/\+/g, " "));
}
 var doc = null;
 $(document).ready(function() {
   var req = new XMLHttpRequest();
   var uri = getParameter('doc');
   if (! uri) uri = gon.scores.original_image.url;
   req.open('GET', uri, true);
   req.onreadystatechange = function() {
     console.log(req)
     if (req.readyState != 4) return;
     doc = new Vex.Flow.Document(req.responseText);
     doc.getFormatter().setWidth(800).draw($("#viewer")[0]);
   };
   req.send(null);
 });
