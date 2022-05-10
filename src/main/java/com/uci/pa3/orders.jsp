<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="com.uci.pa3.DatabaseHelper" %> 
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>PA3</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="http://localhost:8080/pa3/style"
    />
  </head>
  <body>
    <jsp:include page="header.jsp" />
    <h1 id="order-header">Orders</h1>
    <div id="orders-container">
        <% 
        DatabaseHelper databaseHelper = new DatabaseHelper(); 
        Connection connection = databaseHelper.getConnection(); 
        Statement statement = connection.createStatement(); 
        ResultSet resultSet = statement.executeQuery("SELECT order_id, shipping_address, phone_number, first_name, last_name FROM orders"); 
        while (resultSet.next()) { 
      %>
        <div class="order">
            <h2 class="order-title">Order ID: <%=resultSet.getString("order_id")%></h2> 
            <p>Name: <%=resultSet.getString("first_name")%> <%=resultSet.getString("last_name")%></p>
            <p>Address <%=resultSet.getString("shipping_address")%></p>
            <p>Phone Number: <%=resultSet.getString("phone_number")%></p>
            <p>Products: </p>
            <ol>
            <% 
            DatabaseHelper dbh = new DatabaseHelper(); 
            Connection con = dbh.getConnection(); 
            Statement st = con.createStatement(); 
            ResultSet rs = st.executeQuery("SELECT name, price FROM ordered_products LEFT JOIN products ON ordered_products.product_id = products.prod_id WHERE ordered_products.order_number = " + resultSet.getInt("order_id")); 
            while (rs.next()) { 
            %>
                <li>$<%=rs.getDouble("price")%> <%=rs.getString("name")%></li>
            <%
            }
            %>
            </ol>
        </div>
      <% 
        }
      %>
    </div>
  </body>
</html>
