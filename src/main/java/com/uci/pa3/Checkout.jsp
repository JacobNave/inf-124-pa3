<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="com.uci.pa3.DatabaseHelper" %> 
<%@ page import="java.sql.Connection" %> 
<%@ page import="java.sql.Statement" %> 
<%@ page import="java.sql.ResultSet"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>PA3</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="http://localhost:8080/pa3/style"
    />
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
  </head>
  <body>
    <jsp:include page="header.jsp" />
    <div id="products-container"></div>
        <div class="checkOut">
            <div class="col-75">
                <div class="checkOutContainer">
                    <h1 style="text-align: center;">Check Out</h1>
                    <form
                        id="order-form"
                        onsubmit="onsub()"
                    >
                    <div>
                        <label>
                        First Name:
                        <input type="text" id="first-name" name="First Name" required="required" placeholder="John"/>
                        </label>
                    </div>
                    <div>
                    <label>
                        Last Name:
                        <input type="text" id="last-name" name="Last Name" required="required" placeholder="Doe"/>
                    </label>
                    </div>
                    <div>
                    <label>
                        Shipping time:
                        <select style="margin-bottom: 15px;" name="Shipping option" id="shipping-options">
                            <option value="bDay">5-7 Business Days</option>
                        </select>
                    </label>
                    </div>
                    <div>
                    <label>
                        Phone number:
                        <input
                        type="text"
                        id="phone"
                        name="Phone number"
                        required="required"
                        placeholder="(123)-456-7890"
                        pattern="\(?\d+\)?[-.\s]?\d+[-.\s]?\d\d\d\d"
                        />
                    </label>
                    </div>
                    <div>
                    <label>
                        Credit card number:
                        <input
                        type="text"
                        id="credit"
                        name="Credit card number"
                        required="required"
                        placeholder="0000-0000-0000-0000"
                        pattern="^\d\d\d\d-\d\d\d\d-\d\d\d\d-\d\d\d\d$"
                        />
                    </label>
                    </div>
                    <div>
                    <label>
                        CVV:
                        <input
                        type="text"
                        id="pin"
                        name="Pin number"
                        placeholder="123"
                        required="required"
                        pattern="^\d\d\d$"
                        />
                    </label>
                    </div>
                    
                    <div>
                    <label>
                        Zip:
                        <input
                        type="text"
                        id="zip"
                        name="Zip"
                        placeholder="92612"
                        required="required"
                        />
                    </label>
                    </div>
                    <div>
                    <label>
                        Address:
                        <input
                        type="text"
                        id="Address"
                        name="Address"
                        placeholder="123 Anteater Drive"
                        required="required"
                        />
                    </label>
                    </div>
                    <div>
                    <label>
                        City:
                        <input
                        type="text"
                        id="city"
                        name="City"
                        placeholder="Irvine"
                        required="required"
                        />
                    </label>
                    </div>
                    <div>
                    <label>
                        State:
                        <input
                        type="text"
                        id="state"
                        name="State"
                        placeholder="CA"
                        required="required"
                        />
                    </label>
                    </div>
                    </form>
                    <div class="col-25">
                        <div class="cart"> 
                            <h2 style="text-align: center"> Order Details </h2>
                            <div id="cart"></div>
                            <div style="display:flex; justify-content: center; width:100%; padding-bottom: 20px;">
                                <input type="button" id="submit-button" value="Place order"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <script src="http://localhost:8080/pa3/checkoutjs"></script>
    <script> src="http://localhost:8080/pa3/zipcodes"</script>
  </body>
</html>