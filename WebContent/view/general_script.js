/**
 * 
 */
function register_check(){
	alert("123");
	var password1 = document.getElementById('passwordId').value;
    var password2 = document.getElementById('confirmPasswordId').value;
    var email = document.getElementById('emailId').value;
    //password check
    if(password1.length === 0 ||  password2.length === 0){
        alert("Please enter password twice.");
        return false;
    }else{
        if(password1.length < 6){
            alert("Please set password more than 6 letters.");
            return false;

        }else{
            if(password1.length > 16){
                alert("Please set password less than 16 letters.");
                return false;

            }else{
                if(!/[A-Z]/.test(password1)){
                    alert("Include at least one upper case letter.");
                    return false;

                }else{
                    if(!/[0-9]/.test(password1)){
                        alert("Include at least one number.");
                        return false;

                    }else{
                        if(  password1 !==  password2){
                            alert("Please check your password.");
                            return false;

                        }else{
                        	if(email.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1){
                        		alert("email format invalid!");
                        		return false;
                        	}else{
                             return true;
                        	}
                        }
                    }
                }
            }
        }
    }
	
}


function update_form_check() {
    var check_tel = document.getElementById('update_tel').value;
    var i;

    //not stop the form submission if there is no tel input
    if (check_tel.length === 0){
        return true;
    }
    for(i=0; i<check_tel.length; i++){

        if(parseFloat(check_tel[i]).toString() == 'NaN'){
            alert('Tel need to be a 11-digits number start with 0, your input is not a number');
            return false;
        }
    }
    if (check_tel[0] !== '0'){
        alert('Tel need to be a 11-digits number start with 0, your input does not start with 0');
        return false;
    }else if(check_tel.length !== 11){
        alert('Tel need to be a 11-digits number start with 0, your input is not 11 digits');
        return false;
    }else{
        return true;
    }

}

function new_password_check() {
    var password1 = document.getElementById('new_password').value;
    var password2 = document.getElementById('new_password2').value;
    //password check
    if(password1.length === 0 ||  password2.length === 0){
        alert("Please enter password twice.");
        return false;
    }else{
        if(password1.length < 6){
            alert("Please set password more than 6 letters.");
            return false;

        }else{
            if(password1.length > 16){
                alert("Please set password less than 16 letters.");
                return false;

            }else{
                if(!/[A-Z]/.test(password1)){
                    alert("Include at least one upper case letter.");
                    return false;

                }else{
                    if(!/[0-9]/.test(password1)){
                        alert("Include at least one number.");
                        return false;

                    }else{
                        if(  password1 !==  password2){
                            alert("Please check your password.");
                            return false;

                        }else{
                             return true;
                        }
                    }
                }
            }
        }
    }
    
    function offline_update(){
    	println("123");
    	var user_id = document.getElementById("hidden_user_id").value;
    	var xmlHttp;
        if (window.XMLHttpRequest) {
            xmlHttp = new XMLHttpRequest();
            
        } else {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlHttp.onreadystatechange = function(){
            if (xmlHttp.readyState==4 && xmlHttp.status==200) {
               document.getElementById("sp").innerHTML = xmlHttp.responseText; 
            }
        }
        
        xmlHttp.open("GET", "Online_check?id=" + user_id , true);
        xmlHttp.send();
    }
    

}

function check_started(){
	var room_id = document.getElementById("room_id").value;
	$.ajax({

        url:"http://localhost:8080/BoardGamePlatform/back_controller/Check_room_started.do",
        type:"post",
        data:{
        		"is_change" : "N",
        		"room_id": room_id
        		},
        dataType:'text',
        success:function(result){
        	if(result == 1){
        		window.location.href="start_play.jsp?role=1&rid=" + room_id;
        		window.clearInterval(timer);
        	}else{}
        }
          
    })
}

function let_visitor_login(){
	alert("Please login or register first!");
	window.location.href="login.jsp";
}

function non_host_do(){
	
	var room_id = document.getElementById("room_id").value;
	var user_id = document.getElementById("user_id").value;
	 alert(room_id);
	 alert(user_id);
	$.ajax({

        url:"http://localhost:8080/BoardGamePlatform/back_controller/Create_relationship.do",
        type:"post",
        data:{
        		"table" : "room_players",
        		"name1" : "room_id",
        		"name2": "player_id",
        		"int1": room_id,
        		"int2": user_id
        		},
        dataType:'text',
        success:function(result){
        	
        }
          
    })
    
    
	var timer = window.setInterval('check_started()',100);
	
}

function host_do(){
	var room_id = document.getElementById("room_id").value;
	var user_id = document.getElementById("user_id").value;
	
	$.ajax({

        url:"http://localhost:8080/BoardGamePlatform/back_controller/Check_room_started.do",
        type:"post",
        data:{
        		"is_change" : "Y",
        		"room_id": room_id
        		},
        dataType:'text',
        success:function(result){
        	
        		window.location.href="start_play.jsp?role=0&rid=" + room_id;
        	
        }
          
    })
    
	
}

function load(click_button){
	if(click_button != null){
		document.getElementById(click_button).click();

	}
}
