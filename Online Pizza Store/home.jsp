<%@include file="classes/template.jsp"%>

<%
Template objTemplate=new Template();

String Data="<a href=menu.jsp><img src=order.png alt=Icon height=120 width=200 align=right></a>"+
"<br><br><h2>Hello, "+session.getAttribute("UserID").toString()+"</h2>"+
"<h3>Welcome to the Thick slice Pizza</h3>"+

"<h4>Please use the navigation menu to choose the appropriate option:</h4>"+
"<img src=pic.jpg alt=Icon height=330 width=875 align=centre>"+"";
        


  
out.println(objTemplate.genPage(Data,true));
           
%>