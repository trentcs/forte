$( document ).ready(function() {
    console.log( "ready, bitches!" );

 	// function getParameter(name) {
  //   name = name.replace(/\[]/, "\\\[").replace(/[\]]/, "\\\]");
  //   var regex = new RegExp("[\\?&]" + name + "=([^&#]*)");
  //   var results = regex.exec(window.location.search);
  //   if (results == null) return undefined;
  //   else return decodeURIComponent(results[1].replace(/\+/g, " "));
  // }
  //  var doc = null;
  //  $(document).ready(function() {
  //    var req = new XMLHttpRequest();
  //    var uri = getParameter('doc');
  //    if (! uri) uri = 'hello_world.xml';
  //    req.open('GET', uri, true);
  //    req.onreadystatechange = function() {
  //      if (req.readyState != 4) return;
  //      doc = new Vex.Flow.Document(req.responseText);
  //      doc.getFormatter().setWidth(800).draw($("#viewer")[0]);
  //    };
  //    req.send(null);
  //  });


   //this is the part in which I attempt to grab information from the xml
   ////////////////////////////////////////////////////////////////////
   var parseXml;
if (window.DOMParser) {
    parseXml = function(xmlStr) {
        return (new window.DOMParser()).parseFromString(xmlStr, "text/xml");
    };
}
else if (typeof window.ActiveXObject != "undefined" && new window.ActiveXObject("Microsoft.XMLDOM")) {
    parseXml = function(xmlStr) {
        var xmlDoc = new window.ActiveXObject("Microsoft.XMLDOM");
        xmlDoc.async = "false";
        xmlDoc.loadXML(xmlStr);
        return xmlDoc;
    };
}
else {
    parseXml = function() {
        return null;
    }
}
var xmlTree = parseXml("<note></note>");

function add_children(child_name, parent_name) {
    str = xmlTree.createElement(child_name);
    //strXML = parseXml(str);
    $(xmlTree).find(parent_name).append(str);
    var xmlString = (new XMLSerializer()).serializeToString(xmlTree);
    console.log(xmlString);
}

	$("button").click(function(){
		add_children("pitch", "note");
		add_children("step", "note");
		add_children("octave", "note");
	});
});