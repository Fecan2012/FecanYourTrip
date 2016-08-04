function validateEncryptedForm() {
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    if (!username || !password) {
        alert("Please Enter Your ID or/and Password");
        return false;
    }
    
    try {
    	var rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
        var rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
        submitEncryptedForm(username,password, rsaPublicKeyModulus, rsaPublicKeyExponent);
    } catch(err) {//예외객체
        alert(err);
    }
    return false;
}

function submitEncryptedForm(username, password, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
   //1.자바스크립트객체를 생성->RSAKey()객체
	var rsa=new RSAKey();
  //2.공개키를 설정->setPublic()
	rsa.setPublic(rsaPublicKeyModulus, 
			                           rsaPpublicKeyExponent);

	var securedUsername=rsa.encrypt(username);
	var securedPassword=rsa.encrypt(password);
	//post 로그인폼에 값을 설정하고 submit시킨다.
	var securedLoginForm=document.getElementById
	                                         ("securedLoginForm");
	securedLoginForm.securedUsername.value=securedUsername;
	securedLoginForm.securedPassword.value=securedPassword;
	securedLoginForm.submit();// LoginServlet전송
}