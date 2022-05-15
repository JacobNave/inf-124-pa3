package com.uci.pa3;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.stream.Collectors;

@WebServlet(name = "submit", value = "/submit")
public class SubmitOrderServlet extends HttpServlet {

  @Override
  public void init() throws ServletException {
    super.init();
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql:// localhost:3306/" + "product_data?allowMultiQueries=true", "root", "@Aznbruin77");

      JSONObject jsonBody = new JSONObject(req.getReader().lines().collect(Collectors.joining()));

      PreparedStatement st = con 
				.prepareStatement("INSERT INTO orders (shipping_address, phone_number, credit_card, first_name, last_name, cvv, city, state, zip) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"); 
      st.setString(1, jsonBody.getString("shippingAddress"));
      st.setString(2, jsonBody.getString("phoneNumber"));
      st.setString(3, jsonBody.getString("creditCard"));
      st.setString(4, jsonBody.getString("firstName"));
      st.setString(5, jsonBody.getString("lastName"));
      st.setString(6, jsonBody.getString("pin"));
      st.setString(7, jsonBody.getString("city"));
      st.setString(8, jsonBody.getString("state"));
      st.setString(9, jsonBody.getString("zip"));
      
      int rs = st.executeUpdate();
      
      PreparedStatement st2 = con 
				.prepareStatement("SELECT order_id FROM orders ORDER BY order_id DESC LIMIT 1"); 

      ResultSet result = st2.executeQuery();
      result.next();
      int orderId = result.getInt("order_id");

      JSONArray products = jsonBody.getJSONArray("products");
      PreparedStatement prodInsert = con.prepareStatement("INSERT INTO ordered_products (order_number, product_id) VALUES (?, ?)");
      for(int i = 0; i < products.length(); i++) {
        JSONObject prod = products.getJSONObject(i);
        prodInsert.setInt(1, orderId);
        prodInsert.setInt(2, prod.getInt("id"));
        prodInsert.executeUpdate();
      }

      PreparedStatement clearCart = con.prepareStatement("DELETE FROM cart");
      clearCart.executeUpdate();
      
      st.close();
      st2.close();
      prodInsert.close();
      clearCart.close();
      con.close();
      
      HttpServletResponse hsr = (HttpServletResponse) resp;
      hsr.setStatus(200);
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

  }
}
