<%@page import="com.ellipsonic.employee.dto.Employee"%>
<%@page import="com.ellipsonic.employee.dao.EmployeeDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>
</head>
<body>
<%
int id=Integer.parseInt(request.getParameter("id"));
EmployeeDao dao=new EmployeeDao();
Employee employee=dao.findEmployee(id);
%>
<h1 style="color: red">Enter Updated Employee Details</h1>
	<br>
	<form action="saveEmployee" method="post" enctype="multipart/form-data">
	<input type="text" name="id" value="<%=employee.getId()%>">
		<table>
			<tr>
				<td>Photo:</td>
				<td><input name="pic" type="file"><br> <br></td>
			</tr>
			<tr>
				<td>Full Name:</td>
				<td><input type="text" name="fullname" required="required"><br>
					<br></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><input type="email" name="email" required="required"><br>
					<br></td>
			</tr>
			<tr>
				<td>Number:</td>
				<td><input type="tel" name="number" pattern="[0-9]{10}"
					required="required"><br> <br></td>
			</tr>
			<tr>
				<td>Date of Birth:</td>
				<td><input type="date" name="dob"><br> <br></td>
			</tr>
			<tr>
				<td>Country :</td>
				<td><select name="country" id="country"
					onchange="updateStates(this.value)">
						<option value="">Select a country</option>
						<option value="India">India</option>
						<option value="Canada">Canada</option>
						<option value="Australia">Australia</option>
				</select> <br> <br></td>
			</tr>
			<tr>
				<td>State:</td>
				<td><select name="state" id="state">
						<option value="">Select a state</option>
				</select><br> <br></td>
			</tr>
			<tr>
				<td>Professional Skills:</td>
				<td><input type="checkbox" name="skills" value="Communication">Communication
					<input type="checkbox" name="skills"
					value="Ability to Work under Pressure">Ability to Work
					under Pressure<br> <input type="checkbox" name="skills"
					value="Decision Making">Decision Making <input
					type="checkbox" name="skills" value="Time Management">Time
					Management<br> <input type="checkbox" name="skills"
					value="Self Motivation">Self Motivation <input
					type="checkbox" name="skills" value="Conflict Resolution">Conflict
					Resolution<br> <input type="checkbox" name="skills"
					value="Leadership">Leadership <input type="checkbox"
					name="skills" value="Adaptability">Adaptability<br></td>
			</tr>
			<tr>
				<td>
					<button>Save</button>
				</td>
			</tr>
		</table>
	</form>


	<script type="text/javascript">
		function updateStates(country) {
			var states;
			switch (country) {
			case "India":
				states = [ "Karnataka", "TamilNadu", "Telangana" ];
				break;
			case "Canada":
				states = [ "Alberta", "British Columbia", "Manitoba" ];
				break;
			case "Australia":
				states = [ "Australian Capital Territory", "New South Wales",
						"Victoria" ];
				break;
			default:
				states = [];
			}

			var stateSelect = document.getElementById("state");
			stateSelect.innerHTML = "";

			for (var i = 0; i < states.length; i++) {
				var option = document.createElement("option");
				option.value = states[i];
				option.text = states[i];
				stateSelect.appendChild(option);
			}
		}
	</script>
</body>
</html>