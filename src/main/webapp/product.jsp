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
    <div id="header">
      <a href="http://localhost:8080/pa2/index" class="header-item logo"
      >EcommerceZZZZ</a>
    <a href="http://localhost:8080/pa2/about" class="header-item">About</a>
    <a href="http://localhost:8080/pa2/orders" class="header-item">Orders</a>
    <a href="http://localhost:8080/pa2/checkOut" class="header-item logo"
      >Cart</a
    >
    </div>
    <div id="page-container">
        <h1 id="product-title">

        </h1>
        <img id="product-img"></img>
        <div id="product-price">
          <%= request.getParameter("product_id") %>
        </div>
        <div id="product-description"></div>
        <button type='button' id="add_button">Add to Cart</button>
    </div>
  </body>
</html>
