<%@include file="classes/template.jsp"%>

<%
Template objTemplate = new Template();

String PName=request.getParameter("PName");
String PriceS=request.getParameter("PriceS");
String PriceM=request.getParameter("PriceM");
String PriceL=request.getParameter("PriceL");
String Pid=request.getParameter("Pid");

String Data;
if((PName!=null) && (Pid!=null) && (PriceL!=null) && (PriceS!=null) && (PriceM !=null))     
	{
%>
	<%@include file="classes/pizza.jsp"%> 
<%
pizza obj=new pizza();
obj.additem(Pid,PName,PriceS,PriceM,PriceL);

Data="<h2>Item Added</h2>";
	}
else
	{
		Data="<br><h2>Add Pizza Form</h2>"+
			"<form action=\"\" method=post>"+
			"<table>"+
			"<tr><td>Pizza Id</td><td><input type=text name=Pid></td></tr>"+
			"<tr><td>Pizza Name</td><td><input type=text name=PName></td></tr>"+
			"<tr><td>Trainer</td><td><input type=text name=PriceS></td></tr>"+
			"<tr><td>Cord </td><td><input type=text name=PriceM></td></tr>"+
			"<tr><td>Manager</td><td><input type=text name=PriceL></td></tr>"+
			"<tr><td></td><td><input type=submit value=\"Add Pizza\"></td></tr>"+
			"</table>"+
			"</form>"+"";
	}

	out.println(objTemplate.genPage(Data, true));

%>