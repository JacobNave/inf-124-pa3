
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title> index.jsp for tempConvertB </title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h2> Welcome to the temperature converter service </h2>
        <form name="Temperature input form" action="response.jsp" 
              method="POST">
            Enter a temperature in Celsius:
            <input type="text" name="celsius" value="" size="4" />
            <p></p>
            <input type = "submit" value = "Convert to Fahrenheit" />
        </form>
    </body>
</html>
