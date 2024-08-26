<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 100%;
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
        }
        h1 {
            color: #e74c3c;
        }
        p {
            color: #333;
        }
        .error-details {
            margin-top: 20px;
            background-color: #f8d7da;
            padding: 10px;
            border-radius: 5px;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        a {
            color: #3498db;
            text-decoration: none;
            margin-top: 20px;
            display: inline-block;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Oops! Something went wrong.</h1>
        <p>We encountered an unexpected issue. Please try again later or contact support if the problem persists.</p>
        
        <div class="error-details">
            <strong>Error Details:</strong>
            <p><%= request.getAttribute("errorMessage") %></p>
        </div>
        
        <a href="index.jsp">Go Back to Home Page</a>
    </div>
</body>
</html>
