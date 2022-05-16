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

@WebServlet(name = "getOrders", value = "/getOrders")
public class OrderDataServlet extends HttpServlet {

  @Override
  public void init() throws ServletException {
    super.init();
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
      resp.setContentType("application/json");
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql:// localhost:3306/" + "product_data", "root", "password");
      Statement stmt = con.createStatement();
      String sql = "SELECT * FROM orders ORDER BY order_id DESC LIMIT 5";
      ResultSet rs = stmt.executeQuery(sql);

      PrintWriter writer = resp.getWriter();
      JSONArray orders = new JSONArray();
      while (rs.next()) {
        JSONObject order = new JSONObject(); 
        order.put("id", rs.getInt("order_id"));
        order.put("shippingAddress", rs.getString("shipping_address"));
        order.put("firstName", rs.getString("first_name"));
        order.put("lastName", rs.getString("last_name"));
        order.put("pin", rs.getString("pin"));
        order.put("phoneNumber", rs.getString("phone_number"));
        order.put("creditCard", rs.getString("credit_card"));
        order.put("rating", rs.getInt("rating"));
        orders.add(order);

      }

      JSONObject jsonOrders = new JSONObject();
      jsonOrders.put("orders", orders);

      writer.print(jsonOrders.toString());
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

  }
}
