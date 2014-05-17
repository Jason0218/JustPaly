function getNodesByName(name) {
	return document.getElementsByName(name);
}

function getNodeByName(name) {
	return getNodesByName(name)[0];
}

function getNodeById(id) {
	return document.getElementById(id);
}

function checkNull(id, msg) {
	var eles = getNodesByName(id);
	var value = '';
	for ( var i = 0; i < eles.length; i++) {
		value += eles[i].value;
	}
	var node = getNodeById(id);
	if (value == '') {
		node.innerHTML = "<span style='color:red'>*" + msg + "</span>";
		return false;
	} else {
		node.innerHTML = "";
		return true;
	}
}

function checkEqReg(id, reg, msg) {
	var eName = getNodeByName(id);
	var eId = getNodeById(id);
	if (reg.test(eName.value)) {
		eId.innerHTML = "";
		return true;
	} else {
		eId.innerHTML = "<span style='color:red'>*" + msg + "</span>";
		return false;
	}
}

function checkNotEqReg(id, reg, msg) {
	var eName = getNodeByName(id);
	var eId = getNodeById(id);
	if (!reg.test(eName.value)) {
		eId.innerHTML = "<span style='color:red'>*" + msg + "</span>";
		return true;
	} else {
		eId.innerHTML = "";
		return false;
	}
}

var flag = false;
function checkUserName(name) {
	flag = checkNull(name, '用户名不能为空')
			&& checkEqReg(name, /^[a-zA-Z0-9_]{6,16}$/, '字母数字下划线组成,长度为6-16');
}
// 验证密码不得少于6位
function checkPassword(name) {
	flag = checkEqReg(name, /^[0-9a-zA-Z]{6,}$/, '密码不少于6位');/* /^[0-9a-zA-Z]{6,}$/ */
}
// 验证两次输入的密码是否相同
function checkPwd(pwd1, pwd2, id) {
	var nValue1 = getNodeByName(pwd1).value;
	var nValue2 = getNodeById(pwd2).value;
	flag = (nValue1 == nValue2);
	var eId = getNodeById(id);
	if (flag) {
		eId.innerHTML = "";
	} else {
		eId.innerHTML = "<span style='color:red'>*两次输入的密码要一致</span>";
	}
}
function selectAll(id, name) {
	getNodeById(id).onclick = function() {
		var checks = document.getElementsByName("cb");
		for ( var i = 0; i < checks.length; i++) {
			if (this.checked) {
				checks[i].checked = "checked";
			} else {
				checks[i].checked = "";
			}
		}
	};
	var checks = getNodesByName(name);
	for ( var i = 0; i < checks.length; i++) {
		var qx = getNodeById(id);
		checks[i].onclick = function() {
			var flag = true;
			if (!this.checked) {
				qx.checked = "";
				return;
			}
			for ( var j = 0; j < checks.length; j++) {
				if (!checks[j].checked) {
					flag = false;
				}
			}
			if (flag) {
				qx.checked = "checked";
			}
		};
	}
	;
}
