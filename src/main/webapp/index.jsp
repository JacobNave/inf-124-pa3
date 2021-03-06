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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>pa3</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="http://localhost:8080/pa3/style"
    />

  </head>
  <body>
    <jsp:include page="/WEB-INF/classes/com/uci/pa3/header.jsp" />
    <div>
      <p>Group 9</p>
      <p>Michael Le</p>
      <p>Jacob Nave</p>
      <p>Calvin Nguyen</p>
    </div>
    <div id="products-container">
      <% 
        DatabaseHelper databaseHelper = new DatabaseHelper(); 
        Connection connection = databaseHelper.getConnection(); 
        Statement statement = connection.createStatement(); 
        ResultSet resultSet = statement.executeQuery("SELECT prod_id, name, description, img, price FROM products"); 
        while (resultSet.next()) { 
      %>
        <div class="product">
          <a class="product-img" href=<%= "http://localhost:8080/pa3/product?id=" + resultSet.getString("prod_id") %>>
            <img class="product-img" src=<%= resultSet.getString("img") %>>
          </a>
          <h1 class="product-title">
            <a class="product-link" href=<%= "http://localhost:8080/pa3/product?id=" + resultSet.getString("prod_id") %>> <%=resultSet.getString("name") %></a>
          </h1>
          <div><%= resultSet.getString("price") %></div>
        </div>
      <% 
        } 
      %>
    </div>
  </body>
</html>
