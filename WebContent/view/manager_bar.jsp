
<div class="xuanfu rel" <% if(current_user == null){
        	out.print("style='display:none'");
        	}else if(current_user.get_is_manager().equals("N")){
        		out.print("style='display:none'");
        	} %>>
            <div class="xf_top">
                <div class="xf_top_k rel" onclick="javascript:window.location.href='http://localhost:8080/BoardGamePlatform/view/manage_game.jsp'">
                    <img src="./images/xftb1.png" height="26" width="29" class="xftb db auto abs trans_fast" />
                    <div class="xf_top_k_nr abs">
                        <div class="xf_top_k1">
                            <div class="xf_topknrr abs xf_nr1">
                                <a href="http://localhost:8080/BoardGamePlatform/view/manage_game.jsp" target="_blank">Manage Games</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="xf_top_k rel" onclick="javascript:window.location.href='http://localhost:8080/BoardGamePlatform/view/manage_room.jsp'">
                    <img src="./images/xftb1.png" height="26" width="29" class="xftb db auto abs trans_fast" />
                    <div class="xf_top_k_nr abs">
                        <div class="xf_top_k1">
                            <div class="xf_topknrr abs xf_nr1">
                                <a href="http://localhost:8080/BoardGamePlatform/view/manage_room.jsp" target="_blank">Manage Rooms</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="xf_top_k rel" onclick="javascript:window.location.href='http://localhost:8080/BoardGamePlatform/view/manage_player.jsp'">
                    <img src="./images/xftb1.png" height="26" width="29" class="xftb db auto abs trans_fast" />
                    <div class="xf_top_k_nr abs">
                        <div class="xf_top_k1">
                            <div class="xf_topknrr abs xf_nr1">
                                <a href="http://localhost:8080/BoardGamePlatform/view/manage_player.jsp" target="_blank">Manage Players</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="xf_top_k rel" onclick="javascript:window.location.href='http://localhost:8080/BoardGamePlatform/view/manage_report.jsp'">
                    <img src="./images/xftb1.png" height="26" width="29" class="xftb db auto abs trans_fast" />
                    <div class="xf_top_k_nr abs">
                        <div class="xf_top_k1">
                            <div class="xf_topknrr abs xf_nr1">
                                <a href="http://localhost:8080/BoardGamePlatform/view/manage_report.jsp" target="_blank">Report Box</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                
                <div class="xf_top_k rel">
                    <img src="./images/xftb4.png" height="26" width="29" class="xftb db auto abs trans_fast" />
                    <div class="xf_top_k_nr abs">
                        <div class="xf_top_k1">
                            <div class="xf_topknrr abs xf_nr1">
                                <span class="fhtop">Back to Top</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="xf_bot abs">
                <div>
                    <div class="abs trans_fast"></div>
                </div>
            </div>
        </div>