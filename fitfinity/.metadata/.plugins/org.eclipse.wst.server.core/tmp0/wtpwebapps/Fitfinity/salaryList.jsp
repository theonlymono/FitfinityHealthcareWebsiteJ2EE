<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="ViewSalary.SalaryDAO"%>
<%@ page import="ViewSalary.Salary" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Salary List</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .table-container {
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #3575FE;
            color: #ffffff;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
        
        h2{
        	margin-left: 50px;
        	text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Salary List</h2> <br>

    <% SalaryDAO dao = new SalaryDAO();
       List<Salary> salaryList = dao.getPcount();
       
       if(salaryList!=null && !salaryList.isEmpty())
       {
    	    %> 
    	   
    	   <table> 
    	   		<tr>
		            <th>Doctor ID</th>
		            <th>Doctor Name</th>
		            <th>Role Name</th>
		            <th>Appointment Date</th>
		            <th>Total Patient</th>
		            <th>Fixed Salary</th>
		            <th>Total Salary</th>
		        </tr>
		        <% for (Salary s : salaryList) { %>
		        	<tr>
		        		<td> <%= s.getDoctorID() %> </td>
		        		<td> <%= s.getDoctorName() %> </td>
		        		<td> <%= s.getRoleName() %></td>
		        		<td> <%= s.getAppointmentDate() %>
		        		<td> <%= s.getPatientCount() %></td>
		        		<td> <%= s.getFixedSalary() %></td>
		        		<td> <%= s.getTotalSalary() %></td>
		        	</tr>
		        <% } %>
    	   </table>
    <%	   
       }
    %>
             
    
</body>
</html>
