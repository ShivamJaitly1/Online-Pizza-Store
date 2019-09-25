<%
final String role=String.valueOf(session.getAttribute("Role"));
         
class Template
 {  
    public  String navMenu()
		{
        
			String menu="<ul id=\"navmenu-h\">"+
						"<li><a href=\"#\">My Profile</a>"+
						"<ul>"+
						"<li><a href=\"view-user.jsp\">View Profile</a></li>"+
						"<li><a href=\"edit-user.jsp\">Edit Profile</a></li>"+
                        "<li><a href=\"order.jsp\">View Order history</a></li>"+
                        "<li><a href=\"change-password.jsp\">Change Password</a></li>"+
						"</ul>"+
						"</li>"+
						"<li><a href=\"menu.jsp\">Order Online</a></li>";
      
					if(role.equals("Admin"))
						{
						menu+="<li><a href=\"#\">Manager Users</a>"+
						"<ul>"+
						"<li><a href=\"add-user.jsp\">Add User</a></li>"+
						"<li><a href=\"view-user.jsp?id=all\">View All Users</a></li>"+
						"</ul>"+
						"</li>"+
						"<li><a href=\"#\">Manage Orders</a>"+
						"<ul>"+
						"<li><a href=\"add-item.jsp\">Add Pizza</a></li>"+
						"<li><a href=\"menu.jsp\">View menu</a></li>"+
                        "<li><a href=\"order.jsp\">View all orders</a></li>"+
						"</ul>"+
						"</li>";        
						}    
                        menu+="<li><a href=\"logout.jsp\">Logout</a>"+
						"</li>"+
						"</ul>"+"";
                
                
					return menu;
		}
   
    public String genPage(String content,boolean menu)
        {
			if(menu)
				{
					String page="<html><head>"+
								"<link rel=\"stylesheet\" href=\"style/style.css\" type=\"text/css\" media=\"screen\" />"+
								"<script type=\"text/javascript\" src=\"scripts/ajax.js\"></script>"+
								"</head><body>"+
								"<div class=wrapper>"+
								"<div class=head>"+
								"<div class=heading>"+
								"<img src=logo.png alt=Icon width=80 height=80 align=left>"+
								"<img src=download.jpeg alt=Icon width=80 height=80 align=left>"+
								"<img src=logo.png alt=Icon width=80 height=80 align=right>"+
								"<img src=download.jpeg alt=Icon width=80 height=80 align=right>"+
								"<p><font size=50px color=white>The Thick Slice Pizza<hr><hr></font></p>"+
								"</div>"+
                                navMenu()+"</div>"+
                                "<div class=content>"+content+                                "</div>"+
                                "<div class=foot>"+
                                " Powered by <a style=\"color:#FFFFFF;\" href=\"\">Sandrock Technologies</a>"+
								"</div>"+
								"</div>"+
								"</body>"+
								"</html>"+"";
                                         
					return page;
                }
			else
                {
					String page="<html>"+
								"<link rel=\"stylesheet\" href=\"style/style.css\" type=\"text/css\" media=\"screen\" />"+
								"<body>"+
								"<div class=wrapper>"+
								"<div class=head>"+
								"<div class=heading>"+
								"<img src=logo.png alt=Icon width=80 height=80 align=left>"+
								"<img src=download.jpeg alt=Icon width=80 height=80 align=left>"+
								"<img src=logo.png alt=Icon width=80 height=80 align=right>"+
								"<img src=download.jpeg alt=Icon width=80 height=80 align=right>"+
								"<p><font size=50px color=white>The Thick Slice Pizza<hr><hr></font></p>"+
								"</div>"+
                                "</div>"+
                                "<div class=content>"+content+
								
                                "</div>"+
                                "<div class=foot>"+
                                " Powered by <a style=\"color:#FFFFFF;\" href=\"#\">Sandrock Technologies</a>"+
								"</div>"+
								"</div>"+
								"</body>"+
								"</html>"+"";
                                         
                        return page;
                }
       















	   }   
	}
%>