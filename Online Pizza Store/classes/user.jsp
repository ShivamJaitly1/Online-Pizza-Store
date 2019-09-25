<%@page import="java.sql.*" %>
<%

class User
	{Connection con=null;
	Statement st=null;
        public void addUser(String userID,String Password,String Fname,String Sname,String Role,String Email,String DOB,String Securityquestion,String Securityanswer)
        {
        try
           { 
		   
			Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdfg");
            Statement st=con.createStatement();
            st.executeUpdate("insert into user1 values('"+userID+"','"+Password+"','"+Role+"','"+Securityquestion+"','"+Securityanswer+"','"+Fname+"','"+Sname+"','"+Email+"','"+DOB+"')");
			st.close();
			con.close();
			}
        catch(Exception e)
			{
				
               System.out.println(e.getMessage());
			}
		}
   
   
    public String  checkLogin(String userID,String Password)
		{
		try
			{
			Class.forName("oracle.jdbc.driver.OracleDriver");
	        con=DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdfg");
	        st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from user1 where UserID='"+userID+"' and Password='"+Password+"'");
      
			rs.next();
			
           String Role=rs.getString("Role");
			
			st.close();
			con.close();
			return Role;
			}
		catch(Exception e)
			{
				System.out.println(e.getMessage());
						}
		       return "";
     	
		}

	public ResultSet getAlluser()
		{
			 
			ResultSet rs=null;
			try
			{  
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdfg");
				Statement st=con.createStatement();
				
                rs=st.executeQuery("Select * from user1");
				return rs;
			}
			catch(Exception e)
            {
				return rs;
			}
		}

		public ResultSet getmenu()
		{
			 
			ResultSet rs=null;
			try
			{  
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdfg");
				Statement st=con.createStatement();
				
                rs=st.executeQuery("Select * from pizza");
				return rs;
			}
			catch(Exception e)
            {
				return rs;
			}
		}

	public ResultSet getAllCourses()
        {
			ResultSet rs=null;
        
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdfg");
				Statement st=con.createStatement();
               
                rs=st.executeQuery("Select * from courses");
				return rs;
			}
			catch(Exception e)
            {
				return rs;
			}   
		}

	public ResultSet getuser(String userID)
		{
			ResultSet rs=null;
			
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdfg");
				Statement st=con.createStatement();
               
                rs=st.executeQuery("Select * from user1 where userid='"+userID+"'");
				return rs;
			}
			catch(Exception e)
            {
				return rs;
			}
		}

	public void setPassword(String Password,String userID)
	{
    try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdfg");
            Statement st=con.createStatement();
               
            st.executeQuery("update user1 set password='"+Password+"' where userid='"+userID+"'");
			st.close();
			con.close();
		}
    catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
}


	public void setuser(String userID,String Fname,String Sname,String Email,String DOB,String Role)
		{
    
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdfg");
				Statement st=con.createStatement();
                
				st.executeQuery("update user1 set Fname='"+Fname+"' , Sname='"+Sname+"' , Email='"+Email+"' ,dob='"+DOB+"',role='"+Role+"' where userid='"+userID+"'");  
				
				st.close();
				con.close();
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}

	public void assignCourse(String CourseID,String userID)
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdfg");
				Statement st=con.createStatement();
                
				st.executeQuery("insert into course_user_map values('"+CourseID+"','"+userID+"')");
				
				st.close();
				con.close();
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}

        
	public void unassignCourse(String CourseID,String userID)
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdfg");
				Statement st=con.createStatement();
               
				st.executeQuery("delete from course_user_map where userid='"+userID+"' and courseid='"+CourseID+"'");
				
				st.close();
				con.close();
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}

	public ResultSet getRegisteredCourses(String userId)
		{
			ResultSet rs=null;
			
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdfg");
				Statement st=con.createStatement();
               
                rs=st.executeQuery("select * from courses where name in(select courseid from course_user_map where userid='"+userId+"')");
				return rs;
      
			}
			catch(Exception e)
            {
            return rs;
			}
		}


public ResultSet getSecurity(String userId)
	{
		ResultSet rs=null;
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdfg");
				Statement st=con.createStatement();
               
                rs=st.executeQuery("select securityquestion,securityanswer from user1 where userid='"+userId+"' ");
				
				return rs;
      
			}
			catch(Exception e)
            {
				return rs;
			}
	}

public void setSecurity(String userId,String securityquestion,String securityanswer)
	{
       
		try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdfg");
				Statement st=con.createStatement();
               
                st.executeUpdate("update user1 set securityquestion='"+securityquestion+"' , securityanswer='"+securityanswer+"' where userid='"+userId+"'");
				st.close();
				con.close();
			}
        catch(Exception e)
            {
				System.out.println(e.getMessage());
			}
	}


public void addPic(String userID,String Profilepic)
{
    try
        {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","asdfg");
			Statement st=con.createStatement();
           
            st.executeUpdate("update user1 set profilepic='"+Profilepic+"' where userid='"+userID+"'");
			st.close();
			con.close();
	   }
	catch(Exception e)
        {
			System.out.println(e.getMessage());
        }
}


}
%>