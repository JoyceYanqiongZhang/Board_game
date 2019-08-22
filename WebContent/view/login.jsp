<%@ include file="head.jsp"%>
<%@ include file="head2.jsp"%>
<div class="outter1">
	<div class="center_60">
		<div class="inner_div">
			<form action="../controller/login.jsp" method="POST">
	
	                <div class="form-row">
	                    <label class="col-form-label" for="emailId">Email</label>
	                    <input type="text" class="form-control" placeholder="Email" id="emailId" name="email">
	                </div>
	
	                <div class="form-row">
	                    <label class="col-form-label" for="passwordId">Password</label>
	                    <input type="password" class="form-control" placeholder="Password" id="passwordId" name="password">
	                    <a href="forget_password.jsp">Forgot password?</a>
	                </div>
	
	                <div class="form-row">
	                    <button type="submit" class="btn btn-secondary" name="userLogin">Log in</button>
	                </div>
	
	                <div class="form-row">
	                    Not a user yet?
	                    <a href="register.jsp">Register now!</a>
	                </div>
	            </form>
            </div>
     </div>
</div>
<%@ include file="footer.jsp"%>