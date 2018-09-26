function folding(divid) {
	var div = document.getElementById(divid);
	var item = document.getElementById(divid + 'image');
	var folder = document.getElementById(divid + 'folder');
	
	if (div == null) return;
	
	if (div.style.display == "none") {
		div.style.display = "block";
		item.src = 'minus.png';
		folder.src = "folder_open.gif";
	} else {
		div.style.display = "none";
		item.src = 'plus.png';
		folder.src = "folder_closed.gif";
	}
}
