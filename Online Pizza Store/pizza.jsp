<%@page import="java.sql.*" %>


<%

class pizza
{
	Connection con=null;
	Statement st=null;
   
   public void addorder(String userID,String pname,String qty,String size)
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","1234");
				Statement st=con.createStatement();
                
				st.executeQuery("insert into orders values('"+userID+"','"+pname+"',"+qty+",'"+size+"');
				st.close();
			con.close();}
			
			catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
			
		}
    
    public void additem(String Pid,String PName,String PriceS,String PriceM,String PriceL)
        {
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","1234");
				Statement st=con.createStatement();
				st.executeUpdate("insert into pizza values('"+Pid+"','"+PName+"','"+PriceS+"','"+PriceM+"','"+PriceL+"')");
			
				st.close();
				con.close();
			}
           catch(Exception e)
            {
               System.out.println(e.getMessage());
			}
		}
public ResultSet getAllorder()
		{
			ResultSet rs=null;
        
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","1234");
				Statement st=con.createStatement();
               
                rs=st.executeQuery("Select * from orders");
				return rs;
      
			}
			
			catch(Exception e)
            {
				return rs;
			}
		}
		
		public ResultSet getorder(String userID)
		{
			ResultSet rs=null;
			
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","1234");
				Statement st=con.createStatement();
               
                rs=st.executeQuery("Select * from orders where userid='"+userID+"'");
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
				Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","1234");
				Statement st=con.createStatement();
               
                rs=st.executeQuery("Select * from pizza");
				return rs;
      
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());
				return rs;
			}   
        
		}
    
    
    public ResultSet getitem(String Pid)
        {
			ResultSet rs=null;
        
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","1234");
				Statement st=con.createStatement();
                
				rs=st.executeQuery("Select * from pizza where Pid='"+Pid+"'");
				return rs;
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());
				return rs;
			}   
		}
      
    public void setitem(String Pid,String PName,String PriceS,String PriceM,String PriceL)
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@localhost:1521:XE","hr","1234");
				Statement st=con.createStatement();
				
				st.executeUpdate("update Pizza set PName='"+PName+"',PriceS='"+PriceS+"',PriceM='"+PriceM+"',PriceL='"+PriceL+"' where Pid='"+Pid+"'");
               
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