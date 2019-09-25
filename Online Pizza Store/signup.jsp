<%@include file="classes/template.jsp"%>

<%
Template objTemplate = new Template();

String UserID=request.getParameter("UserID");
String Password=request.getParameter("Password");
String Fname=request.getParameter("Fname");
String Sname=request.getParameter("Sname");
String Role=request.getParameter("Role");
String Email=request.getParameter("Email");
String DOB=request.getParameter("DOB");
String Securityquestion=request.getParameter("Securityquestion");
String Securityanswer=request.getParameter("Securityanswer");

String Data;

if((UserID!=null) && (Password!=null) && (Fname!=null) && (Sname!=null) && (Role !=null) && (Email!=null) && (DOB!=null) &&(Securityquestion!=null) && (Securityanswer!=null))     
	{
%>
	<%@include file="classes/user.jsp"%> 
     
<%
	User objUser=new User();
	
	objUser.addUser(UserID,Password,Fname,Sname,Role,Email,DOB,Securityquestion,Securityanswer);
	
	Data="<br><br><h2>Congrats you can now order!</h2>"+
	"<form action=\"index.jsp\" method=post>"+"<table>"+
	"<tr><td></td><td><input type=submit value=\"click here to login\"></td></tr>"+
	"</table>"+
	"</form>"+"";
	}
else
	{
	Data="<br><br><h2>Add User Form</h2>"+
	"<form action=\"\" method=post>"+
	"<table>"+
	"<tr><td>User ID</td><td><input type=text name=UserID></td></tr>"+
	"<tr><td>Password</td><td><input type=password name=Password></td></tr>"+
	"<tr><td>First Name</td><td><input type=text name=Fname></td></tr>"+
	"<tr><td>Second Name</td><td><input type=text name=Sname></td></tr>"+
	"<tr><td>Role</td><td>"+
	"<select name=Role>"+
	"<option value=\"User\">User</option>"+
	"<option value=\"Admin\">Admin</option>"+
	"</select>"+
	"</td></tr>"+
	"<tr><td>Email ID</td><td><input type=text name=Email></td></tr>"+
	"<tr><td>Date of Birth</td><td><input type=text name=DOB></td></tr>"+
	"<tr><td>Security Question</td><td>"+
	"<select name=Securityquestion>"+
	"<option value=\"What is your bestfriends name?\">What is your bestfriends name?</option>"+
	"<option value=\"What is your favorite food?\">What is your favorite food?</option>"+
	"</select>"+
	"</td></tr>"+
	"<tr><td>Security Answer</td><td><input type=text name=Securityanswer></td></tr>"+
	"<tr><td></td><td><input type=submit value=\"Sign up\"></td></tr>"+
	"</table>"+
	"</form>"+"";
	}

out.println(objTemplate.genPage(Data,false));

%>