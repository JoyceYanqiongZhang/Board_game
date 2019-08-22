<%@ include file="head.jsp"%>
<%@ include file="head2.jsp"%>
<div class="outter1">
<div class="center_80">
	<div class="inner_div">
			    <div id="modify_btn_container">
			        <button id="modify_profile" class="btn" onclick="window.location.href='http://localhost:8080/BoardGamePlatform/view/update_profile.jsp'">Modify</button>
			    </div>
			    <div>
			        <div id="show_pic">
			            <img src="<% out.print(current_user.get_pic()); %>" id="profile_pic" onerror="this.src='../view/images/black.png'">
			        </div>
			        <div id="show_profile_info">
			            <table class="normal_table">
			                <tbody>
			                <tr>
			                    <th scope="row">User id :</th>
			                    <td><% out.print(current_user.get_id()); %></td>
			                    <th scope="row">Username :</th>
			                    <td><% out.print(current_user.get_username()); %></td>
			                </tr>
			                <tr>
			
			                </tr>
			                <tr>
			                    <th scope="row">Email :</th>
			                    <td><% out.print(current_user.get_email()); %></td>
			                    <th scope="row">Gender :</th>
			                    <td><% out.print(current_user.get_gender()); %></td>
			                </tr>
			                <tr>
			
			                </tr>
			                <tr>
			                    
			                    <th scope="row">Date of birth :</th>
			                    <td><% out.print(current_user.get_date_of_birth()); %></td>
			                </tr>
			                <tr>
			
			                </tr>
			            
			                <tr>
			                    <th scope="row">Address :</th>
			                    <td><% out.print(current_user.get_location()); %></td>
			                </tr>
			                </tbody>
			            </table>
			        </div>
			    </div>	
	</div>
			<div class="vertical_100">
				<p><br><br><br><br></p>
			</div>

</div>

            	
            </div>
<%@ include file="manager_bar.jsp"%>
<%@ include file="footer.jsp"%>