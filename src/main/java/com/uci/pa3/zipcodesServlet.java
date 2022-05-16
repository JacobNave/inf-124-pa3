package com.uci.pa3;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "zipcodes", value = "/zipcodes")
public class zipcodesServlet extends HttpServlet {

  @Override
  public void init() throws ServletException {
    super.init();
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    resp.setContentType("text/plain");
    List<String> file = Files.readAllLines(Paths.get("/WEB-INF/classes/com/uci/pa3/zip_codes.json"));
    String data = file.stream().collect(Collectors.joining());
    resp.getWriter().write(data);
  }
}
