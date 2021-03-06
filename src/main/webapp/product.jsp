<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="com.uci.pa3.DatabaseHelper" %> 
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<html>
  <head>
    <title>PA3</title>
    <link rel="stylesheet" href="http://localhost:8080/pa3/style" />
  </head>
  <body>
    <jsp:include page="/WEB-INF/classes/com/uci/pa3/header.jsp" />
    <% 
      DatabaseHelper databaseHelper = new DatabaseHelper(); 
      Connection connection = databaseHelper.getConnection(); 
      Statement statement = connection.createStatement();
      String queryStr = "SELECT prod_id, name, description, img, price FROM products WHERE prod_id = " + request.getParameter("id");
      ResultSet resultSet = statement.executeQuery(queryStr); 
      resultSet.next();
    %>
    <div id="page-container">
      <h1 id="product-title">
        <%= resultSet.getString("name") %>
      </h1>
      <img id="product-img" src=<%= resultSet.getString("img") %>>
      <div id="product-price">$<%= resultSet.getString("price") %></div>
      <div id="product-description">
        <%= resultSet.getString("description") %>
      </div>
      <button type='button' id="add_button">Add to Cart</button>
    </div>
    <script src="http://localhost:8080/pa3/productjs"></script>
  </body>
</html>
