<%@include file="classes/pizza.jsp"%>
<%@include file="classes/template.jsp"%>

<%
	pizza  objpizza = new pizza();
	Template  objTemplate = new Template();

	try
	{
		if(request.getParameter("id").equals("all"))
			{
				ResultSet rs=objpizza.getAllorder();
    
				String Data="<br><br><table>"+
							"<tr>"+
							"<td>userid</td><td>"+
							"<td>Pizza Name</td>"+
							"<td>Quantity</td>"+
							"<td>Size</td>"+
							"</tr>";
	
				while(rs.next())
				{
				Data+="<tr>"+
						"<td>"+rs.getString("wow") +"</td>"+
						"<td>"+rs.getString("userid")+"</td><td>"+
						"<td>"+rs.getString("pname")+"</td><td>"+
						"<td>"+rs.getString("qty")+"</td><td>"+
						"<td>"+rs.getString("sizee") +"</td>"+
                        "<td><a href=view-user.jsp?id="+rs.getString("UserID")+">Details</a></td>"+
						"</tr>";
				}

				Data+="</table>";
        
				out.println(objTemplate.genPage(Data,true));

			}

		else if(request.getParameter("id")==null)
			{
				ResultSet rs=objpizza.getorder(session.getAttribute("UserID").toString());
				rs.next();
        
				String Data="<br><br><table>"+
						"<tr><td>Order id</td><td>"+"<td>"+rs.getString("wow") +"</td>"+
						"<td>"+"<tr><td>User id</td><td>"+rs.getString("userid")+"</td><td>"+
						"<tr><td>Pizza name</td><td>"+"<td>"+rs.getString("pname")+"</td><td>"+
						"<tr><td>Quantity</td><td>"+"<td>"+rs.getString("qty")+"</td><td>"+
						"<tr><td>Size</td><td>"+rs.getString("sizee") +"</td></tr>"+
						"<tr><td>Total</td><td>"+rs.getString("total") +"</td></tr>"+"<br><br>"
						"</table>";
        
				out.println(objTemplate.genPage(Data,true));
			}
		
	}
	catch(Exception e)
	{
		ResultSet rs=objpizza.getorder(session.getAttribute("UserID").toString());
        rs.next();
        
		String Data="<br><br><table>"+
						"<tr><td>Order id</td><td>"+"<td>"+rs.getString("wow") +"</td>"+
						"<td>"+"<tr><td>User id</td><td>"+rs.getString("userid")+"</td><td>"+
						"<tr><td>Pizza name</td><td>"+"<td>"+rs.getString("pname")+"</td><td>"+
						"<tr><td>Quantity</td><td>"+"<td>"+rs.getString("qty")+"</td><td>"+
						"<tr><td>Size</td><td>"+rs.getString("sizee") +"</td></tr>"+
						"<tr><td>Total</td><td>"+rs.getString("total") +"</td></tr>"+"<br><br>"
						"</table>";
        
        out.println(objTemplate.genPage(Data,true));
	}
%>