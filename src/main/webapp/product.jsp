<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>PA3</title>
    <style>
        #header {
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
        height: auto;
        background-color: black;
        color: white;
        padding: 25px;
        font-size: 30px;
        }

        a {
        color: white;
        text-decoration: none;
        }

        a:hover {
        cursor: pointer;
        }

        .container {
        width: 1100px;
        height: 750px;
        padding-top: 20px;
        padding-right: 20px;
        padding-left: 20px;
        margin-right: auto;
        margin-left: auto;
        }

        .col {
        vertical-align: top;
        display: inline-block;
        flex: 0 0 50%;
        max-width: 50%;
        position: relative;
        width: 45%;
        padding-right: 20px;
        padding-left: 20px;
        }

        .img {
        width: 400px;
        height: 525px;
        border: 2px solid grey;
        }

        .text {
        max-width: 600px;
        padding-left: 20px;
        margin-left: auto;
        margin-right: auto;
        }
        .p {
        font-size: 1.2rem;
        font-family: Georgia, "Times New Roman", Times, serif;
        margin-bottom: 30px;
        }

        h3 {
        font-weight: normal;
        }
        u {
        color: blue;
        }

        #products-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        margin-top: 25px;
        }

        .product {
        text-align: center;
        margin: 20px;
        width: 15em;
        height: 17em;
        padding: 10px;
        border: 1px solid gray;
        border-radius: 4px;
        background-color: white;
        }

        .product-img {
        width: 80%;
        height: 45%;
        transition: .3s;
        }

        .product-img:hover {
        width: 90%;
        height: 50%;
        }

        .product-img:hover {
        width: 100%;
        }

        .product-title {
        font-size: 1em;
        height: 3.5em;
        overflow: hidden;
        }

        .product-link {
        text-decoration: none;
        color: darkred;
        }

        .product-link:hover {
        color: black;
        }

        #page-container {
        text-align: center;
        }

        #product-img {
        padding: 20px;
        border: 1px black solid;
        }

        #product-price {
        font-size: large;
        font-weight: bold;
        padding-bottom: 20px;
        }

        #product-description {
        padding-bottom: 20px;
        padding-left: 50px;
        padding-right: 50px;
        text-align: left;
        }

        #add_button {
        width: 150px;
        height: 30px;
        background-color: cornflowerblue;
        border-radius: 10px;
        }

        #order-header {
        text-align: center;
        }

        #orders-container {
        display: flex;
        justify-content: center;
        margin-top: 25px;
        flex-direction: column;
        }

        .order {
        text-align: left;
        margin: 20px;
        width: 50%;
        padding: 10px;
        border: 1px solid gray;
        border-radius: 4px;
        background-color: white;
        align-self: center;
        }

        .order-title {
        font-size: 1em;
        height: 2em;
        overflow: hidden;
        }

        .list-item { 
        margin-bottom: 5px;
        }

        body { 
        background-color: #F8F8F8;
        }

        select {
        width: 30%;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        }


        /*If screen less than 580px */
        @media (max-width: 580px) {
        #header {
            flex-direction: column;
            padding: 10px;
        }
        .product {
            text-align: center;
            width: 90vw;
            height: 100vw;
            border-bottom: 1px gray solid;
            margin-bottom: 20px;
            background-color: white;
            padding-top: 15%;
        }
        }
    </style>
  </head>
  <body>
    <div class="product">
        <h1 class="product-title"><c:out value="${param.productName}"/></h1>
        <a class="product-link" href=<%=  value="${param.productLink}" %>></a>
        <a href=<%=  value="${param.productLink}" %>>
            <img class="product-img" href=<%=  value="${param.productCost}" %>/>
        </a>
        <div><c:out value="${param.productCost}"/></div>
    </div>
  </body>
</html>