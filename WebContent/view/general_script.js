/**
 * 
 */
function register_check(){
	//alert("123");
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
        async : false,
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
	var user_name = document.getElementById("user_name").value;
	var is_full = check_room_full(room_id);
	
	 //alert(is_full);
	 //alert(user_id);
	
	if(is_full == "N"){
		$.ajax({
	
	        url:"http://localhost:8080/BoardGamePlatform/back_controller/Create_relationship.do",
	        async : false,
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
	    var add_room_log = user_name + " joined this room<br>";
		update_room_log(add_room_log);
	    
		var timer = window.setInterval('check_started()',100);
	}else{
		alert("This room is full! Please try another one!");
	}
}

function host_do(){
	var room_id = document.getElementById("room_id").value;
	var user_id = document.getElementById("user_id").value;
	var user_name = document.getElementById("user_name").value;
	var is_full = check_room_full(room_id);

	if(is_full == "Y"){
		$.ajax({
	
	        url:"http://localhost:8080/BoardGamePlatform/back_controller/Check_room_started.do",
	        async : false,
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
	    
	    var add_room_log = user_name + " started the game <br>" + user_name +" go first<br>";
		update_room_log(add_room_log);
	    
	}else{
		alert("This room is not full yet! Please wait for other players to join in!");
	}
	
}

function load(click_button){
	if(click_button != null){
		document.getElementById(click_button).click();

	}
	
}

function check_room_full(room_id){
	var is_full = "";
	$.ajax({

        url:"http://localhost:8080/BoardGamePlatform/back_controller/Check_room_full.do",
        async : false,
        type:"post",
        data:{
        		"room_id": room_id
        		},
        dataType:'text',
        success:function(result){
        	//alert("check_full ajax");
        	is_full = result[0];
        	
        	
        }
          
    })
    //alert("after check_full ajax");
    return is_full;
}

function load_refresh(click_button){
	//alert(click_button == "null");
	if(click_button != "null"){
		document.getElementById(click_button).click();

	}
	
	//check if it is room detail page
	var is_room_detail = document.getElementById("is_room_detail");
	if(is_room_detail != null){
		var room_is_public = document.getElementById("room_is_public").value;
		if(room_is_public == "0"){
			alert("The game in this room is end. Please go to other rooms");
			window.location.href = "http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num3";
		}
	}
	
	//refresh room log
	var room_log_tag = document.getElementById("room_log_content");
	//alert(room_log_tag != null);
	if(room_log_tag != null){
		var timer = window.setInterval('refresh_room_log()',100);
	}
	
	//refresh player vacancy
	var room_players_container = document.getElementById("room_players_container");
	if(room_players_container != null){
		var timer = window.setInterval('refresh_room_players_container()',100);
	}
	
	
	
}

function refresh_room_log(){
	var room_id = document.getElementById("room_id").value;
	//alert("refresh room log");
	var room_log;
	
	$.ajax({

        url:"http://localhost:8080/BoardGamePlatform/back_controller/Get_room_log.do",
        async : false,
        type:"post",
        data:{
        		"room_id": room_id
        		},
        dataType:'text',
        success:function(result){
        	
        	room_log = result;
        	//alert(room_log);
        	
        }
          
    })
    document.getElementById("room_log_content").innerHTML = room_log;
	
}

function refresh_room_players_container(){
	var room_id = document.getElementById("room_id").value;
	//alert("123");
	$.ajax({

        url:"http://localhost:8080/BoardGamePlatform/back_controller/Get_room_players.do",
        async : false,
        type:"post",
        data:{
        		"room_id": room_id
        		},
        dataType:'json',
        success:function(result){
        	
        	//alert("success");
        	var i = 0;
        	while(result["player"+i] != null){
        		var player_img = document.getElementById("vacancy_img"+i);
        		var player_p = document.getElementById("vacancy_p"+i);
        		player_img.src = result["player"+i][8];
        		player_p.innerHTML = result["player"+i][1];
        		//alert(result["player"+i][0]);
        		i++;
        	}

        	
        }
          
    })
	
}

function update_room_log(add_room_log){
	var room_id = document.getElementById("room_id").value;
	//alert(add_room_log);
	
	$.ajax({

        url:"http://localhost:8080/BoardGamePlatform/back_controller/Update_room_log.do",
        async : false,
        type:"post",
        data:{
        		"room_id": room_id,
        		"add_room_log": add_room_log
        		},
        dataType:'text',
        success:function(result){
        	
        	
        }
          
    })
}

function leave_room(){
	var room_id = document.getElementById("room_id").value;
	var user_id = document.getElementById("user_id").value;
	var user_name = document.getElementById("user_name").value;
	
		$.ajax({
	
	        url:"http://localhost:8080/BoardGamePlatform/back_controller/Delete_relationship.do",
	        async : false,
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
	    var add_room_log = user_name + "left this room<br>";
		update_room_log(add_room_log);
	    window.location.href="http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num3";


}

function add_friend(friend_id){
	var current_user_id = document.getElementById("user_id").value;
	
	//console.log(typeof friend_id);
	//alert(friend_id == current_user_id);
	if(friend_id == current_user_id){
		alert("You cannot add yourself as your friend!");
	}else{
		$.ajax({
			
	        url:"http://localhost:8080/BoardGamePlatform/back_controller/Create_relationship.do",
	        async : false,
	        type:"post",
	        data:{
	        		"table" : "friendship",
	        		"name1" : "player1_id",
	        		"name2": "player2_id",
	        		"int1": current_user_id,
	        		"int2": friend_id
	        		},
	        dataType:'text',
	        success:function(result){
	        	alert("You are friends with this user now!!");
	        	window.location.reload();
	        }
	          
	    })
	}
}

function delete_friend(place,friend_id){
	var current_user_id = document.getElementById("user_id").value;
	if(place == "1"){
		$.ajax({
			
	        url:"http://localhost:8080/BoardGamePlatform/back_controller/Delete_relationship.do",
	        async : false,
	        type:"post",
	        data:{
	        	"table" : "friendship",
	    		"name1" : "player1_id",
	    		"name2": "player2_id",
	    		"int1": current_user_id,
	    		"int2": friend_id
	        		},
	        dataType:'text',
	        success:function(result){
	        	alert("You are no longer friends with this user now!!");
	        	window.location.reload();
	        }
	          
	    })
	}else if(place == "2"){
		$.ajax({
			
	        url:"http://localhost:8080/BoardGamePlatform/back_controller/Delete_relationship.do",
	        async : false,
	        type:"post",
	        data:{
	        	"table" : "friendship",
	    		"name1" : "player1_id",
	    		"name2": "player2_id",
	    		"int1": friend_id,
	    		"int2": current_user_id
	        		},
	        dataType:'text',
	        success:function(result){
	        	alert("You are no longer friends with this user now!!");
	        	window.location.reload();
	        }
	          
	    })
	}
	
}

function change_availability(game_id,change_to){
	$.ajax({
		
        url:"http://localhost:8080/BoardGamePlatform/back_controller/Update_item.do",
        async : false,
        type:"post",
        data:{
        	"table" : "game",
    		"by" : "id",
    		"content": game_id,
    		"item": "availability",
    		"update_content": change_to
        		},
        dataType:'text',
        success:function(result){
        	window.location.reload();
        }
          
    })
}

function change_user(change_item,user_id,change_to){
$.ajax({
		
        url:"http://localhost:8080/BoardGamePlatform/back_controller/Update_item.do",
        async : false,
        type:"post",
        data:{
        	"table" : "user",
    		"by" : "id",
    		"content": user_id,
    		"item": change_item,
    		"update_content": change_to
        		},
        dataType:'text',
        success:function(result){
        	window.location.reload();
        }
          
    })
}

function change_room_block(room_id,change_to){
$.ajax({
		
        url:"http://localhost:8080/BoardGamePlatform/back_controller/Update_item.do",
        async : false,
        type:"post",
        data:{
        	"table" : "room",
    		"by" : "id",
    		"content": room_id,
    		"item": "is_blocked",
    		"update_content": change_to
        		},
        dataType:'text',
        success:function(result){
        	window.location.reload();
        }
          
    })
}

function show_content(report_id){
	var show_content_div = document.getElementById("show_content_div");
	$.ajax({

        url:"http://localhost:8080/BoardGamePlatform/back_controller/Get_report_content.do",
        async : false,
        type:"post",
        data:{
        		"report_id": report_id
        		},
        dataType:'text',
        success:function(result){
        	show_content_div.innerHTML = result;
        	//alert(room_log);
        	
        }
          
    })
}

function change_report_condition(report_id,change_to){
$.ajax({
		
        url:"http://localhost:8080/BoardGamePlatform/back_controller/Update_item.do",
        async : false,
        type:"post",
        data:{
        	"table" : "report",
    		"by" : "id",
    		"content": report_id,
    		"item": "conditions",
    		"update_content": change_to
        		},
        dataType:'text',
        success:function(result){
        	window.location.reload();
        }
          
    })
}

function add_favorite(game_id){
	var current_user_id = document.getElementById("user_id").value;
	$.ajax({
		
        url:"http://localhost:8080/BoardGamePlatform/back_controller/Create_relationship.do",
        async : false,
        type:"post",
        data:{
        		"table" : "favorite",
        		"name1" : "player_id",
        		"name2": "game_id",
        		"int1": current_user_id,
        		"int2": game_id
        		},
        dataType:'text',
        success:function(result){
        	alert("This game is in your favorite list now!!");
        	window.location.reload();
        }
          
    })
}

function exit_game(room_id,user_name){
$.ajax({
		
        url:"http://localhost:8080/BoardGamePlatform/back_controller/Update_item.do",
        async : false,
        type:"post",
        data:{
        	"table" : "room",
    		"by" : "id",
    		"content": room_id,
    		"item": "is_public",
    		"update_content": "0"
        		},
        dataType:'text',
        success:function(result){
        	$.ajax({
        		
                url:"http://localhost:8080/BoardGamePlatform/back_controller/Update_item.do",
                async : false,
                type:"post",
                data:{
                	"table" : "room",
            		"by" : "id",
            		"content": room_id,
            		"item": "is_started",
            		"update_content": "0"
                		},
                dataType:'text',
                success:function(result){
                	var add_room_log = user_name + " ended this game.<br>"
                	update_room_log(add_room_log);
                	window.location.href="http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num3";
                }
                  
            })
        }
          
    })
    
    
}

function play_again(user_name){
	var add_room_log = user_name + "started the game again<br>";
	var room_id = document.getElementById("room_id").value;
	update_room_log(add_room_log);
	$.ajax({
		
        url:"http://localhost:8080/BoardGamePlatform/back_controller/Update_item.do",
        async : false,
        type:"post",
        data:{
        	"table" : "room",
    		"by" : "id",
    		"content": room_id,
    		"item": "room_play",
    		"update_content": ""
        		},
        dataType:'text',
        success:function(result){
        	window.location.reload();
        }
          
    })
	
}

function delete_favorite(game_id){
	var user_id = document.getElementById("user_id").value;
	$.ajax({
		
        url:"http://localhost:8080/BoardGamePlatform/back_controller/Delete_relationship.do",
        async : false,
        type:"post",
        data:{
        	"table" : "favorite",
    		"name1" : "player_id",
    		"name2": "game_id",
    		"int1": user_id,
    		"int2": game_id
        		},
        dataType:'text',
        success:function(result){
        	alert("Removed from your favorite list!!");
        	window.location.reload();
        }
          
    })
}

function match_room(){
	var user_id = document.getElementById("hidden_user_id").value;
$.ajax({
		
        url:"http://localhost:8080/BoardGamePlatform/back_controller/Match_room.do",
        async : false,
        type:"post",
        data:{
        	"user_id":user_id
        	
        		},
        dataType:'text',
        success:function(result){
        	if(result == ""){
        		alert("No room ia available for you at the time!");
        	}else{
            	window.location.href=result;
        		
        	}
        }
          
    })
}
