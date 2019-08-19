<%@ include file="head.jsp" %>
<div class="outter1">
	<form action="../controller/register.jsp" method="POST">

                <div class="form-row">
                    <label for="usernameId">Username</label>
                    <input type="text" class="form-control" placeholder="Username" id="usernameId" name="username" required>
                </div>

                <div class="form-row">
                    <label for="passwordId">Password (6-16 characters, include at least one upper case letter and one number)</label>
                    <input type="password" class="form-control" placeholder="Password" id="passwordId" name="password" required>
                </div>

                <div class="form-row">
                    <label for="confirmPasswordId">Confirm password</label>
                    <input type="password" class="form-control" placeholder="Confirm password" id="confirmPasswordId" name="confirmPassword" required>
                </div>

                <div class="form-row">
                    <label for="emailId">Email</label>
                    <input type="email" class="form-control" placeholder="abc@gmail.com" id="emailId" name="email" required>
                </div>

                <div class="form-row">
                    <label for="questionId">Recovery Question</label>
                    <textarea class="form_textarea" style="width:400px" placeholder="Your question" id="questionId" name="question" required></textarea>
                    <br>
                    <textarea class="form_textarea" style="width:400px" placeholder="Your answer" id="answerId" name="answer" required></textarea>
                </div>

                <br>

                <br>

                <div class="form-row">
                    <div style="float:left;padding-right: 5%">
                        <button class="btn btn-primary" onclick="return register_check()" name="registerSubmit" value="Register">Register</button>
                    </div>
                    <div style="float:left;padding-right: 5%">
                        <a href="index.jsp" class="btn btn-primary">Cancel</a>
                    </div>
                </div>
            </form>
</div>
<%@ include file="footer.jsp"%>