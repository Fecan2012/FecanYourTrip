function findPW() {
	var usrID = document.getElementById("inputUserName").value;
	var usrEmail = document.getElementById("inputEmail").value;
	var chkNum = chkID(usrID, usrEmail);
	var idMsg = "User ID does not exist!";
	var emMsg = "Email address does not match account!";
	var alertMsg = document.getElementById("errorPass");
	var psForm = document.getElementById("passForm");
	if (chkNum == 0) {
		alertMsg.innerHTML = idMsg;
		return false;
	} else if (chkNum == 1) {
		alertMsg.innerHTML = emMsg;
		return false;
	} else {
		var path = "findpassPro.do?id=" + usrID + "&email=" + usrEmail;
		window.location.href = path;
	}
}

function chkID(ui, ue) {
	var idChk = false;
	var emChk = false;
	var chkSum = 0;
	var usrMap = new Map();
	usrHash = usrHash.slice(1, -1);
	var usrDuo = usrHash.split(',');
	usrDuo.forEach(function(cValue) {
		cValue = cValue.trim();
		var parUsr = cValue.split('=');
		usrMap.set(parUsr[0], parUsr[1]);
	});

	if (usrMap.has(ui)) {
		chkSum = 1;
		if (ue == usrMap.get(ui)) {
			chkSum = 2;
		}
	}

	return chkSum;
}