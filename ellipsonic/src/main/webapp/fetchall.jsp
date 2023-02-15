<%@page import="org.apache.commons.codec.binary.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.ellipsonic.employee.dto.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fetch All</title>
</head>
<body>
	<%
	List<Employee> list = (List<Employee>) session.getAttribute("list");
	%>

	<h1>List Of All Employees</h1>
	<table border="1">
		<tr>
			<th>Image</th>
			<th>Full Name</th>
			<th>Age</th>
			<th>Country</th>
			<th>Email</th>
			<th>Mobile</th>
			<th>Country</th>
			<th>State</th>
			<th>DOB</th>
			<th>Skills</th>
			<th>Delete</th>
		</tr>
		<%
		for (Employee employee : list) {
		%>
		<tr>
			<td>
			<%
		     String base64 = Base64.encodeBase64String(employee.getPic()); 
			%>
			<img height="100" width="100" alt="unknown" src="data:image/jpeg;base64,<%= base64 %>">
			</td>
			<td><%=employee.getFullName()%></td>
			<td><%=employee.getAge()%></td>
			<td><%=employee.getCountry()%></td>
			<td><%=employee.getEmail()%></td>
			<td><%=employee.getMobile()%></td>
			<td><%=employee.getCountry()%></td>
			<td><%=employee.getState()%></td>
			<td><%=employee.getDob()%></td>
			<td>
				<%
				String[] skills = employee.getSkill();
				for (String s : skills) {
				%> <%=s%>, <%
 }
 %>
			</td>
			<td><a href="delete?id=<%=employee.getId()%>"><button>Delete</button></a></td>
	</tr>

		<%
		}
		%>

	</table>



</body>
</html>