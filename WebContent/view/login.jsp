<%@ include file="head.jsp"%>
<div class="outter1">
<form action="../controller/login.jsp" method="POST">

                <div>
                    <label class="col-form-label" for="emailId">Email</label>
                    <input type="text" class="form-control" placeholder="Email" id="emailId" name="email">
                </div>

                <div>
                    <label class="col-form-label" for="passwordId">Password</label>
                    <input type="password" class="form-control" placeholder="Password" id="passwordId" name="password">
                    <a href="forget_password.jsp">Forgot password?</a>
                </div>

                <div>
                    <button type="submit" class="btn btn-primary" name="userLogin">Log in</button>
                </div>

                <div>
                    Not a user yet?
                    <a href="register.jsp">Register now!</a>
                </div>
            </form>
</div>
<%@ include file="footer.jsp"%>