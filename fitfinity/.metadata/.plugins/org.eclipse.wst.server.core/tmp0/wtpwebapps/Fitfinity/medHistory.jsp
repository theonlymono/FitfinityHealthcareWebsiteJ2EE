<%@page import="ViewHistory.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Fitfinity | Medical History </title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        table {
            width: 90%;
            border-collapse: collapse;
            margin-top: 20px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #0bb288;
            color: white;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        .error-message {
            color: #ff0000;
            font-size: 18px;
            margin-top: 20px;
        }
    </style>
</head>
<body style="display: flex; flex-direction: column; align-items: center;">

    <div style="text-align: left; margin-bottom: 2px; padding: 10px;">
        <h1 style="color: #0bb288; font-size: 36px; font-family: 'Arial', sans-serif; margin: 0;">
            Your Medical History
        </h1>
    </div>

    <%  
        String userid = request.getParameter("userid"); 
        ViewDAO dao = new ViewDAO();
        List<History> myList = dao.viewMyHistory(userid);
        
        if(myList!=null && !myList.isEmpty()){ 
    %>
            <table>
                <tr>
                    <th>Date</th>
                    <th>Doctor Name</th>
                    <th>Allergies</th>
                    <th>Surgical Procedures</th>
                    <th>Past History</th>
                    <th>Cause of Visit</th>
                    <th>Family History</th>
                    <th>Medicine</th>
                </tr>
                <% for(History h: myList){  %>
                    <tr>
                        <td><%= h.getDate() %></td>
                        <td><%= h.getDoctorName() %></td>
                        <td><%= h.getAllergies() %></td>
                        <td><%= h.getSurgical() %></td>
                        <td><%= h.getPast() %> </td>
                        <td><%= h.getCurrent() %> </td>
                        <td><%= h.getFamily() %></td>
                        <td><%= h.getMedicine() %></td>
                    </tr>
                <% } %>
            </table>
        <% } else { %>
            <div class="error-message">
                No medical history available recorded.
            </div>
        <% } %>

</body>
</html>
