<%@ include file="head.jsp"%>
<div class="outter1">
<% 
List<Map<String,Object>> online_user_set = new ArrayList<Map<String,Object>>();
	online_user_set = (List<Map<String,Object>>)request.getAttribute("onLines");
	//System.out.println("players" + online_user_set);
	//System.out.println("user" + ((Users)(online_user_set.get(0).get("user"))).get_username());


//ArrayList<ArrayList<String>> online_user_set = coop.get_by_from("*", "is_online", "user", "1" );
//System.out.println(online_user_set);



%>
<div class="cust">
                
                <div class="pic-cont">
                    
                    <div class="v_out v_out_p">
                        
                        <div class="v_show">
                            <div class="v_cont">
                                <ul>
                                    <li>
                                        <div>
                                        	<% 
                                        	if(online_user_set != null){
                                        		Iterator<Map<String,Object>> it = online_user_set.iterator();
                                        		while(it.hasNext()){
                                        			Users thisuser = (Users)it.next().get("current_user");
                                        			//out.println(it.next().get("user"));
                                        			if(thisuser != null){
                                                		out.println("<a href='../view/player_detail.jsp?u=" + thisuser.get_id() + "'><span><div class='vertical_100'><img src='"+ thisuser.get_pic() +"' alt='' /></div><div class='vertical_100'><h3>" + thisuser.get_username() + "</h3></div></span>");

                                        				//out.println("<tr><td>" + thisuser.get_id() + "</td><td>" + thisuser.get_username() + "</td><td>" + thisuser.get_gender() + "</td><td>" + thisuser.get_location() + "</td><td>" + thisuser.get_pic() + "</td></tr>");
                                        			}
                                        		}
                                        	}

                                        	%>
                                           </div> 
                                      
                                    </li>
                                    
                                </ul>
                            </div>
                            
                            
                            
                            
                        </div>
                       
                    </div>
                </div>
            </div>


</div>

<%@ include file="footer.jsp"%>