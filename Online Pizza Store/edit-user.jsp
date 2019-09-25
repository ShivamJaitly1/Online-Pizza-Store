<%@ page import="java.io.*,javax.servlet.http.HttpServletRequest,javax.servlet.ServletInputStream" %>  
<%@ page import="java.io.FileWriter,java.io.IOException" %> 
<%@include file="classes/user.jsp"%>
<%@include file="classes/template.jsp"%>

<%
	String Data="";
	String Id=request.getParameter("UserID");
%>
<%
User objUser =new User();
Template objTemplate=new Template();

if(Id!=null && (request.getParameter("UserID"))==null )
	{
		ResultSet rs=objUser.getuser(Id);
		rs.next();
  
		Data+="<form action=\"\" method=POST enctype=\"multipart//form-data\" >"+
			"<input type=hidden name=UserID value="+rs.getString("UserID")+">"+
			"<table>"+
			"<tr><td>First Name</td><td><input type=text name=Fname value="+rs.getString("Fname") +"></td></tr>"+
			"<tr><td>Last Name</td><td><input type=text name=Sname value="+rs.getString("Sname") +"></td></tr>"+
			"<tr><td>Email</td><td><input type=text name=Email value="+rs.getString("email") +"></td></tr>"+
			"<tr><td>Date of Birth</td><td><input type=text name=DOB value="+rs.getString("dob") +"></td></tr>"+
			"<tr><td>Role</td><td>"+
			"<select name=Role>"+
			"<option vaule=\"User\">User</option>"+
			"<option vaule=\"Admin\">Admin</option>"+
			"</select>"+
			"</td></tr>"+
			"<tr><td></td><td><input type=submit value=\"Update User\"></td></tr>"+
			"</table>"+
			"</form>"+"";
            
	} 

else if(Id==null && (request.getParameter("UserID"))==null )
	{  
		ResultSet rs=objUser.getuser(session.getAttribute("UserID").toString());
		rs.next();
  
		Data+="<form action=\"\" method=POST>"+
			"<input type=hidden name=UserID value="+rs.getString("UserID")+">"+
			"<br>"+"<table>"+
			"<tr><td>First Name</td><td><input type=text name=Fname value="+rs.getString("Fname") +"></td></tr>"+
			"<tr><td>Last Name</td><td><input type=text name=Sname value="+rs.getString("Sname") +"></td></tr>"+
			"<tr><td>Email</td><td><input type=text name=Email value="+rs.getString("email") +"></td></tr>"+
			"<tr><td>Date of Birth</td><td><input type=text name=DOB value="+rs.getString("dob") +"></td></tr>"+
			"<tr><td>Role</td><td>"+
			"<select name=Role>"+
			"<option vaule=\"User\">User</option>"+
			"<option vaule=\"Admin\">Admin</option>"+
			"</select>"+
			"</td></tr>"+
			"<tr><td></td><td><input type=submit value=\"Update User\"></td></tr>"+
			"</table>"+
			"</form>"+"";
	}
else
	{
		String ID=request.getParameter("UserID");
		String Fname=request.getParameter("Fname");
		String Sname=request.getParameter("Sname");
		String Email=request.getParameter("Email");
		String DOB=request.getParameter("DOB");
		String Role=request.getParameter("Role");
		
   
		objUser.setuser(ID,Fname,Sname,Email,DOB,Role);
		
		Data+="<br><br>"+"User Updated Successfully";
	}

	out.println(objTemplate.genPage(Data, true));
%>