<%@include file="classes/template.jsp"%>
<%
	Template objTemplate=new Template();
	     
	String UserID=request.getParameter("UserID");
	String Password=request.getParameter("Password");   
	String capNumber=request.getParameter("number");
	

    if((UserID!=null) && (Password!=null) && ((capNumber)!=null))    
		{         
%>

<%@include file="classes/user.jsp"%> 
                    
<%
    User objUser=new User();
   String Role=objUser.checkLogin(UserID,Password);
       
	   if(Role!=null&&Role!="")
        {
           session.setAttribute("UserID",UserID);
           session.setAttribute("Role",Role);
		   if(capNumber.equals(session.getAttribute("key")))
		   {
           response.sendRedirect("home.jsp");
		   }		   
		}
  else {
	  out.println("<script type=\"text/javascript\">"+
"alert(\"Invalid username or password ,Try again.\");"+
"window.location=\"index.jsp\";"+
"</script>\"");
		}
		}
				
	String Data=" "+"<p><font size=50px color=white> Login Form</font></p>"+
	"<form name=LoginForm>"+
	"<table>"+
	"<tr></tr>"+
	"<tr></tr>"+
	"<tr></tr>"+
	"<tr></tr>"+
	"<tr>"+
	"<td><font color=white>Username</font></td>"+
	"<td><input type=text id=UserID name=UserID value=\"\"></td>"+
	"</tr>"+
	"<tr>"+
	"<td><font color=white>Password</font></td>"+
	"<td><input type=password id=Password name=Password value=\"\"></td>"+
	"</tr>"+
	"<tr>"+
	"<td><img src=\"Cap_Img.jsp\"></td>"+
	"<td><input name=\"number\" type=\"text\"></td>"+
	"</tr>"+
	"<tr>"+
	"<td></td>"+
	"<td><input type=submit value=\"Login\"></td>"+
	"</tr>"+
	"<tr>"+
	"<td></td>"+
	"<td><font color=white><a href=\"forgot-password.jsp\">Forgot Password</a></font></td>"+
	"<td><font color=white><a href=\"signup.jsp\">Not registered yet? Sign Up!</a></font></td>"+
	"</tr>"+
	"</table>"+
	"</form>";

out.println(objTemplate.genPage(Data,false));
%>

`