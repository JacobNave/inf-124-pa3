<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Response document </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <jsp:useBean id="mybean" scope="session" 
                     class="com.uci.inf124.Converter" />
        <jsp:setProperty name="mybean" property="celsius" />
        Given Celsius temperature is:
        <jsp:getProperty name = "mybean" property = "celsius" />
        <br />Equivalent temperature in Fahrenheit is:
        <jsp:getProperty name="mybean" property="fahrenheit" />
    </body>
</html>
