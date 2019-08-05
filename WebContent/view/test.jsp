
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE> top.html </TITLE>
 </HEAD>
 <script language="JavaScript">
 window.οnbefοreunlοad=function (){ 
	 alert("===οnbefοreunlοad==="); 
	 if(event.clientX>document.body.clientWidth && event.clientY < 0 || event.altKey){ 
	 alert("close"); 
	 }else{ 
	 alert("refresh"); 
	 } 
	 } 

</script>
 
<BODY>
   <p> ok</p>
</BODY>
</HTML>