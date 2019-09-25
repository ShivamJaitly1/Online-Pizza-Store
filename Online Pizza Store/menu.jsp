<%@include file="classes/template.jsp"%>
<%@include file="classes/user.jsp"%> 
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%
Template  objTemplate = new Template();
User objUser=new User();		
String size=request.getParameter("ord");
String qty=request.getParameter("qty");
String userid=session.getAttribute("UserID").toString();
String pname=request.getParameter("id");

//Random rdm=new Random();  
//int s1=rdm.nextInt(); 

//String hex=Integer.toHexString(sl);
//String oid=hex.substring(0,5);

//session.setAttribute("oi",oid);
//String wow="asd";
String Data="";
		
if((userid!=null)&&(size!=null)&&(qty!=null)&&(pname!=null)){
	%>
<%@include file="classes/pizza.jsp"%> 
     
<%
	pizza obj=new pizza();
	//String wow=session.getAttribute("oi");
	
	obj.addorder(userid,pname,qty,size);	
	Data="<h2>One item Added</h2>"+"<a href=menu.jsp>GO BACK!</a>";	
	
	}
	else	
	{
	try		
			{
				ResultSet rs=objUser.getmenu();
Data="<br><h1>BUILD YOUR ORDER-PIZZAS<h1><br>"
+"<table>"+"<tr>"+"<td><h3>Pizza</h3></td><td><td>"
+"<td><h3>Small</h3></td><td></td>"+
"<td><h3>Medium</h3></td><td></td>"+
"<td><h3>Large</h3></td>"+
"</tr>";
	
				while(rs.next())
				{
					Data+=
					"<form action=\"\" method=post>"+"<tr>"
						+"<td>"+rs.getString("pname")+"</td><td><td>"+
						"<td>"+rs.getString("priceS")+"</td><td></td>"+
						"<td>"+rs.getString("priceM") +"</td><td>"+
						"<td>"+rs.getString("priceL") +"</td>"+
						"<td>"+"<select name=ord>"+
	"<option value=null>-Select size-</option>"+					
	"<option value="+rs.getString("priceS")+">Small</option>"+
	"<option value="+rs.getString("priceM")+">Medium</option>"+
		"<option value="+rs.getString("priceL")+">Large</option>"+
	"</select>"+"</td>"+
	"<td>"+"<input type=text name=qty value=EnterQuantity>"+"</td>"+
	"<td>"+"<input type=submit value=\"Add to cart\"?id="+rs.getString("pname")+"></td>";
				}

				Data+="<tr><td><td><td><td><input type=submit value=\"Proceed\"></td></tr>"+"</form>"+"</table>";
			}

			
	
catch(Exception e)
{
	out.println("Menu not found");
}
    } 
out.println(objTemplate.genPage(Data,true));	
%>




