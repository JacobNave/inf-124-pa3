package com.uci.pa3;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "getCartProducts", value = "/getCartProducts")
public class CheckoutProductsServlet extends HttpServlet {

  @Override
  public void init() throws ServletException {
    super.init();
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
      resp.setContentType("application/json");
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql:// localhost:3306/" + "product_data", "root", "@Aznbruin77");
      Statement stmt = con.createStatement();
      String sql = "SELECT name, price, prod_id FROM cart, products WHERE product_id = prod_id";
      ResultSet rs = stmt.executeQuery(sql);

      PrintWriter writer = resp.getWriter();
      JSONArray products = new JSONArray();
      while (rs.next()) {
        JSONObject product = new JSONObject(); 
        product.put("name", rs.getString("name"));
        product.put("price", rs.getDouble("price"));
        product.put("id", rs.getInt("prod_id"));
        products.add(product);

      }

      JSONObject jsonProducts = new JSONObject();
      jsonProducts.put("products", products);

      writer.print(jsonProducts.toString());
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

  }
}
