<%-- 
    Document   : index
    Created on : 27 Jul, 2013, 1:26:44 PM
    Author     : Unmesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        
        
        <%
        
        String DRIVER = "com.mysql.jdbc.Driver";
        Class.forName(DRIVER).newInstance();
        
        Connection con=null;
        ResultSet rst=null;
        Statement stmt=null;
        String usern = request.getParameter("q");
        String sql1 = "select timestamp from sskt1 where username='"+usern+"'";
        
        try{
        String url="jdbc:mysql://localhost/sssk?user=root";

        int i=1;
        con=DriverManager.getConnection(url);
        stmt=con.createStatement();
        rst=stmt.executeQuery(sql1);
        while(rst.next()){i++;
            %>
            <div>Hello <% out.print(usern); %> the time is
            <% out.print(" "); %>
            <%=
              rst.getString("timestamp")
            %>
            </div>
        
        <%
        }
        if(i==1)
            throw new Exception();
        rst.close();
        stmt.close();
        con.close();
        }
        catch(Exception e){
       %>
       <% out.print("Invalid Username "); %>
       <%
        }
        
        %>
    </body>
</html>
