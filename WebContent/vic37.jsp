<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	var xhttp = new XMLHttpRequest();
	
	function testAJAX (){
		 xhttp.onreadystatechange = function() {
			 // console.log("debug1 - readyState:" + this.readyState);
		    if (this.readyState == 4 && this.status == 200) {
		    	// console.log("debug2 - readyState:" + this.readyState);
		    	document.getElementById("here").innerHTML = this.responseText
		    }
		  };
		  xhttp.open("GET", "vic39.jsp", true);
		  xhttp.send();
	}
	
	function fetchServerTime () {
		xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		    	document.getElementById("clock").innerHTML = this.responseText
		    }
		  };
		  xhttp.open("GET", "vic39.jsp", true);
		  xhttp.send();
	}
	setInterval(fetchServerTime, 500);

	
</script>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Vic Big Company</title>
	</head>
	<body>
		<div id="clock"></div>
		<h2>共用同一個 action（用 hidden 欄位判斷）</h2>
		<form action="vic38.jsp">
			<input type="hidden" name="form" value="form1" />
			<input name="x" />
			<input type="submit" />
		</form>
		<form action="vic38.jsp">
			<input type="hidden" name="form" value="form2" />
			<input name="x" />
			<input type="submit" />
		</form>
		<hr />
		
		<h2>用 submit 按鈕的 name 來判斷</h2>
		<form action="vic38.jsp">
			<input name="x" />
			<input type="submit" name="form" value="form1" />
		</form>
		<form action="vic38.jsp">
			<input name="x" />
			<input type="submit" name="form" value="form2" />
		</form>
		<hr />
		
		<input type="button" value="click me!" onclick="testAJAX()">
		<hr />
		<div id="here"></div>
		
	</body>
</html>