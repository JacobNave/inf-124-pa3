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

@WebServlet(name = "rating", value = "/rating")
public class SetRatingServlet extends HttpServlet {

  @Override
  public void init() throws ServletException {
    super.init();
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {
      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql:// localhost:3306/" + "product_data", "root", "password");
      String rating = req.getParameter("rating");
      String id = req.getParameter("id");

      PreparedStatement st = con 
				.prepareStatement("UPDATE orders SET rating = ? WHERE order_id = ?"); 
      st.setInt(1, Integer.valueOf(rating));
      st.setInt(2, Integer.valueOf(id));
      
      int rs = st.executeUpdate();

      if(rs != 0) {
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
