function writeSave() {
	var topic = document.getElementById("subject").value;
	var content = document.getElementById("content").value;
	var writeForm = document.getElementById("writeform");

	if (!topic) {
		alert("Insert Topic Please!!");
		document.writeform.subject.focus();
		return false;
	}

	if (!content) {
		alert("Insert Content Please!!");
		document.writeform.content.focus();
		return false;
	}

	writeForm.submit();
}

function writeUpdate() {
	var topic = document.getElementById("subject").value;
	var content = document.getElementById("content").value;
	var updateForm = document.getElementById("updateform");

	if (!topic) {
		alert("Insert Topic Please!!");
		document.writeform.subject.focus();
		return false;
	}

	if (!content) {
		alert("Insert Content Please!!");
		document.writeform.content.focus();
		return false;
	}

	updateForm.submit();
}

function writeSchedule() {
	var name = document.getElementById("inputName").value;
	var startDate = document.getElementById("datePickerStart").value;
	var endDate = document.getElementById("datePickerEnd").value;
	var scheduleForm = document.getElementById("scheduleForm");

	if (!name) {
		alert("Insert Name Please!!");
		document.scheduleForm.inputName.focus();
		return false;
	}

	if (!startDate) {
		alert("Pick Start Date Please!!");
		document.scheduleForm.datePickerStart.focus();
		return false;
	}

	if (!endDate) {
		alert("Pick End Date Please!!");
		document.scheduleForm.datePickerEnd.focus();
		return false;
	}

	if (new Date(startDate).getTime() > new Date(endDate).getTime()) {
		alert("Starting date cannot be greater than the ending date!!");
		return false;
	}

	scheduleForm.submit();
}