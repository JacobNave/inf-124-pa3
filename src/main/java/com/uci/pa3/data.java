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

@WebServlet(name = "getProducts", value = "/getProducts")
public class data extends HttpServlet {

  @Override
  public void init() throws ServletException {
    super.init();
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
      resp.setContentType("application/json");
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql:// localhost:3306/" + "product_data", "root",
          "squishy1");
      Statement stmt = con.createStatement();
      String sql = "SELECT * FROM products";
      ResultSet rs = stmt.executeQuery(sql);

      PrintWriter writer = resp.getWriter();
      JSONArray products = new JSONArray();
      while (rs.next()) {
        System.out.println(rs.getInt("prod_id"));
        JSONObject prod = new JSONObject();
        prod.put("id", rs.getInt("prod_id"));
        prod.put("name", rs.getString("name"));
        prod.put("desc", rs.getString("description"));
        prod.put("price", rs.getDouble("price"));
        prod.put("img", rs.getString("img"));
        products.add(prod);

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
