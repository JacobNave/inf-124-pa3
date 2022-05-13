package com.uci.pa3;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(name = "add", value = "/add")
public class AddToCartServlet extends HttpServlet {

  @Override
  public void init() throws ServletException {
    super.init();
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql:// localhost:3306/" + "product_data", "root",
          "password");
      String id = req.getParameter("id");
      System.out.println("id is " + id);
      PreparedStatement st = con
          .prepareStatement("INSERT INTO cart (product_id) VALUES(?)");
      st.setInt(1, Integer.valueOf(id));

      int rs = st.executeUpdate();

      if (rs != 0) {
        HttpServletResponse hsr = (HttpServletResponse) resp;
        hsr.setStatus(200);
      } else {
        HttpServletResponse hsr = (HttpServletResponse) resp;
        hsr.setStatus(400);
      }
      st.close();
      con.close();
    } catch (ClassNotFoundException e) {
      e.printStackTrace();
    } catch (SQLException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }

  }
}
