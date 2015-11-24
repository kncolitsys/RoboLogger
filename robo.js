// global  functions

function robo_toggleDiv(divName,imageName,imageSrc) {
	if(document.getElementById(divName).style.display == "block") {
		document.getElementById(divName).style.display = "none";
		document[imageName].src=imageSrc+'_def.gif';
	} else {
		document.getElementById(divName).style.display = "block";
		document[imageName].src=imageSrc+'_sel.gif';
	}
}

function robo_toggleDivSize(divName,imageName,imageSrc) {
	if(document.getElementById(divName).style.height == undefined | document.getElementById(divName).style.height == '0px') {
		document.getElementById(divName).style.height = "auto";
		document.getElementById(divName).style.overflow = "visible";
		document[imageName].src=imageSrc+'_def.gif';
	} else {
		document.getElementById(divName).style.height = '0px';
		document.getElementById(divName).style.overflow = "hidden";
		document[imageName].src=imageSrc+'_sel.gif';
	}
}