<%@ include file="head.jsp"%>
<link rel="stylesheet" type="text/css" href="../view/css/image_input.css" />
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>

<%@ include file="head2.jsp"%>
<div class="outter1">
<div class="center_80">
	<div class="inner_div">
    
        <form action="http://localhost:8080/BoardGamePlatform/back_controller/update_profile.do" method="post" enctype="multipart/form-data" id="update_info_form">
            <input type="hidden" name="user_id" value="<% out.print(current_user.get_id());%>">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputEmail4">User ID</label>
                    <input class="form-control" type="text" placeholder="<% out.print(current_user.get_id());%>" readonly>
                </div>
                <div class="form-group col-md-6">
                    <label for="inputPassword4">Email</label>
                    <input class="form-control" type="text" placeholder="<% out.print(current_user.get_email());%>" readonly>
                </div>
            </div>
            <!--image upload plugin-->
            <div class="form-group">
                <label for="profile_pic">Profile picture</label>
                <section class="logo-license">
                    <div class="half">
                        <a class="logo" id="logox">
                            <img id="bgl" src="<% out.print(current_user.get_pic());%>" onerror="this.src='../view/image/black.png'" >
                        </a>
                    </div>
                    <div class="clear"></div>
                </section>
                <br><br>
                <p class="explain">*Click on the image to choose your picture</p>
                <article class="jq22-container">
                    <div id="clipArea">
                        <div id="lei" >

                        </div>
                    </div>
                    <div class="foot-use"  >
                        <div id="uploader1_btn_container" class="uploader1 blue">
                            <input type="button" id="btn_open_file" name="file" class="button" value="open">
                            <input id="file" type="file" name="update_pic" accept="image/*"   />
                        </div>
                        <input type="button" id="clipBtn" class="button" value="confirm">
                    </div>
                    <div id="view"></div>
                </article>
            </div>

            <script src="../view/img_plug_js/iscroll-zoom.js"></script>
            <script src="../view/img_plug_js/hammer.js"></script>
            <script src="../view/img_plug_js/jquery.photoClip.js"></script>
            <script>
                var obUrl = ''
                $("#clipArea").photoClip({
                    width: 300,
                    height: 300,
                    file: "#file",
                    view: "#view",
                    ok: "#clipBtn",
                    loadStart: function() {
                        console.log("loading");
                    },
                    loadComplete: function() {
                        console.log("complete");
                    },
                    clipFinish: function(dataURL) {
                        console.log(dataURL);//path
                    }
                });
            </script>
            <script>
                $(function(){
                    $("#logox").click(function(){
                        $(".jq22-container").show();
                    })
                    $("#clipBtn").click(function(){
                        $("#logox").empty();
                        $('#logox').append('<img src="' + imgsource + '" align="absmiddle" style=" width: 5rem;height: 5rem;">');
                        $(".jq22-container").hide();
                    })
                });
            </script>

          
            <div class="form-group">
                <label for="inputAddress">Username</label>
                <input type="text" class="form-control" name="update_username" value="<% out.print(current_user.get_username());%>">
            </div>
            <div class="form-row">


                <div class="form-group col-md-6">
                    <p class="notice"><br></p>
                    <label for="exampleFormControlSelect1">Gender</label>

                    <select class="form-control" id="exampleFormControlSelect1" name="update_gender" >

                        <option value="Male"<% if(current_user.get_gender().equals("Male")){
                            out.print("selected = 'selected'");
                        } %>>Male</option>
                        <option value="Female" <% if(current_user.get_gender().equals("Female")){
                            out.print("selected = 'selected'");
                        } %>>Female</option>
                        <option value="Other" <% if(current_user.get_gender().equals("Other")){
                            out.print("selected = 'selected'");
                        } %>>Other</option>
                        <option value="Better not to say" <% if(current_user.get_gender().equals("Better not to say")){
                            out.print("selected = 'selected'");
                        } %>>Better not to say</option>
                    </select>
                </div>
              
                <div class="form-group col-md-6">
                    <div class="form-group">
                        <p class="explain"><br></p>
                        <label for="date_of_birth">Date of Birth</label>
                        <input class="form-control" type="date" name="update_date_of_birth" value="<% out.print(current_user.get_date_of_birth());%>">
                    </div>
                </div>
               
            </div>
            <div class="form-row">
	            <div class="form-group">
	                <label for="inputAddress2">Location </label>
	                <input type="text" class="form-control" name="update_address" value="<% out.print(current_user.get_location());%>">
	            </div>
            </div>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <button class="btn" type="submit" id="btn_upload_profile" class="btn btn-primary" onclick="return update_form_check();" value="Confirm">Confirm</button>

        </form>
        	</div>
		
    </div>
</div>
<%@ include file="manager_bar.jsp"%>
<%@ include file="footer.jsp"%>