<%@ page import="java.sql.*" %>
	<html>
	<head>
		<title>Clinic Master (Appointment)</title>
		<link href="css/bootstrap.min.css" rel="stylesheet"/>
	</head>
	<body>
		<nav class="navbar navbar-expand-lg bg-warning border border-dark">
			<div class="container-fluid">
				<a class="navbar-brand font-weight-bold fs-4" href="homePage.jsp">Clinic Master</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarText">
					<ul class="navbar-nav w-100 d-flex justify-content-between">
						<li class="nav-item flex-grow-1 text-center">
							<a class="nav-link font-weight-bold fs-4" href="./patientView.jsp">Patient</a>
						</li>
						<li class="nav-item flex-grow-1 text-center">
							<a class="nav-link font-weight-bold fs-4 " href="./staffView.jsp">Staff</a>
						</li>
						<li class="nav-item flex-grow-1 text-center">
							<a class="nav-link font-weight-bold fs-4" href="./departments.jsp">Departments</a>
						</li>
						<li class="nav-item flex-grow-1 text-center">
							<a class="nav-link font-weight-bold fs-4 active" aria-current="page" href="./appointment.jsp">Appointment</a>
						</li>
						<li class="nav-item flex-grow-1 text-center">
							<a class="nav-link font-weight-bold fs-4" href="./signupPage.jsp">Sign Out</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>	

		<div class="container d-flex justify-content-center align-items-center bg-primary-subtle card p-3 mt-5">
			<form action = "appointment.jsp" method = "GET">
				<h2>Book Appointment</h2>
				<% 
				String db="clinicmaster"; 
				String user; // assumes database name is the same as username 
				user = "root";
				String password = "root";
				try 
				{ 
					java.sql.Connection con; 
					Class.forName("com.mysql.jdbc.Driver");
					con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
					Statement statement1 = con.createStatement();
					ResultSet dropdownPatient = statement1.executeQuery("select patientID date FROM patient");
					Statement statement2 = con.createStatement();
					ResultSet dropdownServiceName = statement2.executeQuery("select serviceName date FROM services");
					Statement statement3 = con.createStatement();
					ResultSet dropdownStaff = statement3.executeQuery("select staffID date FROM staff");
					Statement statement4 = con.createStatement();
					ResultSet dropdownRoom = statement4.executeQuery("select roomNumber FROM room");
					out.println("<div class = 'mb-3'>"+"<select class = 'form-select' name = 'patientID'>" + "<option selected>Choose a patientID</option>");
					while(dropdownPatient.next())
					{
						String temp = String.format("<option value='%s'>%s</option>", dropdownPatient.getInt(1), dropdownPatient.getInt(1));
						out.println(temp);
					}
					out.println("</select>"+"</div>");
					out.println("<div class = 'mb-3'>"+"<select class = 'form-select' name = 'serviceName'>" + "<option selected>Choose a service</option>");
					while(dropdownServiceName.next())
					{
						String temp = String.format("<option value='%s'>%s</option>", dropdownServiceName.getString(1), dropdownServiceName.getString(1));
						out.println(temp);
					}
					out.println("</select>"+"</div>");
					out.println("<div class = 'mb-3'>"+"<select class = 'form-select' name = 'staffID'>" + "<option selected>Choose a staff member</option>");
					while(dropdownStaff.next())
					{
						String temp = String.format("<option value='%s'>%s</option>", dropdownStaff.getInt(1), dropdownStaff.getInt(1));
						out.println(temp);
					}
					out.println("</select>"+"</div>");
					out.println("<div class = 'mb-3'>"+"<select class = 'form-select' name = 'room'>" + "<option selected>Choose a room</option>");
					while(dropdownRoom.next())
					{
						String temp = String.format("<option value='%s'>%s</option>", dropdownRoom.getInt(1), dropdownRoom.getInt(1));
						out.println(temp);
					}
					out.println("</select>"+"</div>");
	
				} 
				catch(SQLException e) 
				{
					out.println("SQLException caught: " + e.getMessage());
				}
				%>
				<!--
				<div class="mb-3">
					<input type = "text" name = "patientID" class = "form-control" placeholder = "Patient ID" size = "50">
				</div>
				<div class="mb-3">
					<input type = "text" name = "serviceName" class = "form-control" placeholder = "Service Name" size = "50">
				</div>
				-->
				<div class="mb-3">
					<input type = "text" name = "serviceDescription" class = "form-control" placeholder = "Service Description" size = "50">
				</div>
				<!--
				<div class="mb-3">
					<input type = "text" name = "staffID" class = "form-control" placeholder = "Staff ID" size = "50">
				</div>
				<div class="mb-3">
					<input type = "text" name = "room" class = "form-control" placeholder = "Room" size = "50">
				</div>
				-->
				<div class="mb-3">
					<input type = "date" name = "date" class = "form-control" placeholder = "Choose Appointment Date" size = "50">
				</div>
				<div class="mb-3">
					<select class="form-select" name = "time">
						<option selected>Choose a time</option>
						<option value="00:00">00:00</option>
						<option value="01:00">01:00</option>
						<option value="02:00">02:00</option>
						<option value="03:00">03:00</option>
						<option value="04:00">04:00</option>
						<option value="05:00">05:00</option>
						<option value="06:00">06:00</option>
						<option value="07:00">07:00</option>
						<option value="08:00">08:00</option>
						<option value="09:00">09:00</option>
						<option value="10:00">10:00</option>
						<option value="11:00">11:00</option>
						<option value="12:00">12:00</option>
						<option value="13:00">13:00</option>
						<option value="14:00">14:00</option>
						<option value="15:00">15:00</option>
						<option value="16:00">16:00</option>
						<option value="17:00">17:00</option>
						<option value="18:00">18:00</option>
						<option value="19:00">19:00</option>
						<option value="20:00">20:00</option>
						<option value="21:00">21:00</option>
						<option value="22:00">22:00</option>
						<option value="23:00">23:00</option>
					</select>
				</div>
				<input type = "submit" class="btn btn-primary" value = "Book Appointment">
			</form>
        <%
		try 
		{ 
			if(request.getParameter("date") != null && !request.getParameter("date").equals("") && request.getParameter("time") != null && !request.getParameter("time").equals(""))
			{
				java.sql.Connection con; 
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
				Boolean appointmentValid = true;
				Statement stmt1 = con.createStatement();
				ResultSet rs1 = stmt1.executeQuery("SELECT * FROM has natural join appointments WHERE roomNumber='" + request.getParameter("room") + "' AND date = '" + request.getParameter("date") + "'AND time = '" + request.getParameter("time") + "'");
				Statement stmt2 = con.createStatement();
				ResultSet rs2 = stmt2.executeQuery("SELECT * FROM attends natural join appointments WHERE staffID='" + request.getParameter("staffID") + "' AND date = '" + request.getParameter("date") + "'AND time = '" + request.getParameter("time")+ "'");
				Statement stmt3 = con.createStatement();
				ResultSet rs3 = stmt3.executeQuery("SELECT * FROM attends natural join appointments WHERE patientID='" + request.getParameter("patientID") + "' AND date = '" + request.getParameter("date") + "'AND time = '" + request.getParameter("time")+ "'");
				
				Statement stmt10 = con.createStatement();
				ResultSet checkPatientExists = stmt10.executeQuery("SELECT * FROM patient WHERE patientID=" + request.getParameter("patientID"));
				Statement stmt11 = con.createStatement();
				ResultSet checkStaffExists = stmt11.executeQuery("SELECT * FROM staff WHERE staffID=" + request.getParameter("staffID"));
				Statement stmt12 = con.createStatement();
				ResultSet checkRoomExists = stmt12.executeQuery("SELECT * FROM room WHERE roomNumber=" + request.getParameter("room"));
				Statement stmt13 = con.createStatement();
				ResultSet checkServiceNameExists = stmt13.executeQuery("SELECT * FROM services WHERE serviceName='" + request.getParameter("serviceName") + "'");

				if(rs2.isBeforeFirst())
				{
					out.println("Patient already has appointment at this time");
					appointmentValid = false;

				}
				if(rs3.isBeforeFirst())
				{
					out.println("Staff already has appointment at this time");
					appointmentValid = false;

				}		
		
				if(rs1.isBeforeFirst())
				{
					out.println("Room already has appointment at this time");
					appointmentValid = false;
				}

				if(!checkPatientExists.isBeforeFirst())
				{
					out.println("Patient does not exists.");
					appointmentValid = false;
				}
				if(!checkStaffExists.isBeforeFirst())
				{
					out.println("Staff does not exist.");
					appointmentValid = false;
				}
				if(!checkRoomExists.isBeforeFirst())
				{
					out.println("Room does not exist.");
					appointmentValid = false;
				}
				if(!checkServiceNameExists.isBeforeFirst())
				{
					out.println("Service does not exist.");
					appointmentValid = false;
				}


				
				if(appointmentValid)
				{
					Statement stmt = con.createStatement();
					String sql = String.format("INSERT INTO appointments(date, time) VALUES('%s','%s')",request.getParameter("date"),request.getParameter("time"));
					stmt.executeUpdate(sql);	
					sql = "SELECT appointmentID FROM appointments ORDER BY appointmentID DESC LIMIT 1";
					ResultSet rs = stmt.executeQuery(sql);
					rs.next();
					String appointmentID = rs.getString(1);
					sql = String.format("INSERT INTO has(appointmentID, roomNumber) VALUES(%s,%s)",appointmentID, request.getParameter("room"));
					stmt.executeUpdate(sql);	            	
					sql = String.format("INSERT INTO consistsof(appointmentID, serviceName, serviceDescription) VALUES(%s,'%s','%s')", appointmentID,request.getParameter("serviceName"), request.getParameter("serviceDescription"));
					stmt.executeUpdate(sql);
					sql = String.format("INSERT INTO attends(appointmentID, patientID, staffID) VALUES(%s,%s,%s)",appointmentID, request.getParameter("patientID"),request.getParameter("staffID"));
					stmt.executeUpdate(sql);	

					sql = "SELECT cost FROM services WHERE serviceName = '"+request.getParameter("serviceName")+"'";
					ResultSet rs4 = stmt.executeQuery(sql);
					rs4.next();

					sql = "UPDATE patient SET balance = balance +"+ rs4.getInt(1) + " WHERE patientID =" + request.getParameter("patientID");
					stmt.executeUpdate(sql);	
					rs.close();  
					rs4.close();         	
					stmt.close();
				}
				con.close();
			}
			else if(request.getParameter("appointmentID") != null)
			{
				java.sql.Connection con; 
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
				Statement stmt = con.createStatement();
				String sql = String.format("DELETE FROM appointments WHERE appointmentID ="+ request.getParameter("appointmentID"));
				stmt.executeUpdate(sql);	

				sql = "SELECT cost FROM services WHERE serviceName = '"+request.getParameter("serviceNameDelete")+"'";
				ResultSet rs5 = stmt.executeQuery(sql);
				rs5.next();


				sql = "UPDATE patient SET balance = balance -"+ rs5.getInt(1) + " WHERE patientID =" + request.getParameter("patientIDDelete");
				rs5.close();
				stmt.executeUpdate(sql);		
				stmt.close();
				con.close();
			}

		} 
		catch(SQLException e) 
		{
			out.println("SQLException caught: " + e.getMessage());
		}
		%>
		</div>
		<br>
		<div class = "container d-flex justify-content-center align-items-center bg-primary-subtle card p-3">
			<h2>View Appointment for specific patient</h2>
			<form action ="appointment.jsp">
				<input type = "text" name = "patientIDSpecifc" class = "form-control" id = "paitientID" placeholder = "Patient ID" size = "50">
				<input type = "submit" class = "btn btn-primary" value = "See Appointments">
			</form>
	
			<table class="table table-bordered">
				<thead>
				<tr>
					<th scope="col">Appointment ID</th>
					<th scope="col">Patient ID</th>
					<th scope="col">Staff ID</th>
					<th scope="col">Service Name</th>
					<th scope="col">Service Description</th>
					<th scope="col">Room</th>
					<th scope="col">Time</th>
					<th scope="col">Date</th>
					<th scope="col">Cancel</th>
				</tr>
				</thead>
				<tbody>
					<% 
					try 
					{ 
						java.sql.Connection con; 
						Class.forName("com.mysql.jdbc.Driver");
						con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
						Statement stmt1 = con.createStatement();
						ResultSet rs1 = stmt1.executeQuery("select appointmentID, patientID, staffID, serviceName, serviceDescription, roomNumber, time, date FROM appointments natural join has natural join attends natural join consistsof WHERE patientID='" + request.getParameter("patientIDSpecifc")+ "'");
						while (rs1.next()) {
							Statement stmt2 = con.createStatement();
							ResultSet rs2 = stmt2.executeQuery("SELECT patientID, staffID FROM attends WHERE appointmentID=" + rs1.getInt(1));
							Statement stmt3 = con.createStatement();
							ResultSet rs3 = stmt3.executeQuery("SELECT serviceName, serviceDescription FROM consistsof WHERE appointmentID=" + rs1.getInt(1));
							Statement stmt4 = con.createStatement();
							ResultSet rs4 = stmt4.executeQuery("SELECT roomNumber FROM has WHERE appointmentID=" + rs1.getInt(1));
							rs2.next();
							rs3.next();
							rs4.next();
							out.println("<tr><td>"+rs1.getInt(1) + "</td><td>" + rs2.getInt(1) + "</td><td>" + rs2.getInt(2) + "</td><td>" + rs3.getString(1) + "</td><td>" + rs3.getString(2) + "</td><td>" + rs4.getInt(1) + "</td><td>" + rs1.getString(7) + "</td><td>" + rs1.getString(8) + "</td>" + "<td><form action = 'appointment.jsp' method = 'GET'><input type='submit' class = 'btn btn-danger' name = 'delete_user' value = 'Delete'/><input type='hidden' name = 'appointmentID' value = "+rs1.getInt(1)+"><input type='hidden' name = 'patientIDDelete' value = "+rs2.getInt(1)+"><input type='hidden' name = 'serviceNameDelete' value ='"+rs3.getString(1)+"'></form></tr>");
							
						}
						stmt1.close();
						con.close();
					} 
					catch(SQLException e) 
					{
						out.println("SQLException caught: " + e.getMessage());
					}
					%>
				</tbody>
			</table>
		</div>
		<br>
		<div class = "container d-flex justify-content-center align-items-center bg-primary-subtle card p-3">
			<h2>View All Appointments</h2>
			<table class="table table-bordered">
				<thead>
				<tr>
					<th scope="col">Appointment ID</th>
					<th scope="col">Patient ID</th>
					<th scope="col">Staff ID</th>
					<th scope="col">Service Name</th>
					<th scope="col">Service Description</th>
					<th scope="col">Room</th>
					<th scope="col">Time</th>
					<th scope="col">Date</th>
					<th scope="col">Cancel</th>
				</tr>
				</thead>
				<tbody>
					<% 
					try 
					{ 
						java.sql.Connection con; 
						Class.forName("com.mysql.jdbc.Driver");
						con=DriverManager.getConnection("jdbc:mysql://localhost/" + db, user, password); 
						Statement stmt1 = con.createStatement();
						ResultSet rs1 = stmt1.executeQuery("SELECT * FROM appointments");
						while (rs1.next()) {
							Statement stmt2 = con.createStatement();
							ResultSet rs2 = stmt2.executeQuery("SELECT patientID, staffID FROM attends WHERE appointmentID=" + rs1.getInt(1));
							Statement stmt3 = con.createStatement();
							ResultSet rs3 = stmt3.executeQuery("SELECT serviceName, serviceDescription FROM consistsof WHERE appointmentID=" + rs1.getInt(1));
							Statement stmt4 = con.createStatement();
							ResultSet rs4 = stmt4.executeQuery("SELECT roomNumber FROM has WHERE appointmentID=" + rs1.getInt(1));
							rs2.next();
							rs3.next();
							rs4.next();
							String temp = rs3.getString(1);

							out.println("<tr><td>"+rs1.getInt(1) + "</td><td>" + rs2.getInt(1) + "</td><td>" + rs2.getInt(2) + "</td><td>" + rs3.getString(1) + "</td><td>" + rs3.getString(2) + "</td><td>" + rs4.getInt(1) + "</td><td>" + rs1.getString(2) + "</td><td>" + rs1.getString(3) + "</td>" + "<td><form action = 'appointment.jsp' method = 'GET'><input type='submit' class = 'btn btn-danger' name = 'delete_user' value = 'Delete'/><input type='hidden' name = 'appointmentID' value = "+rs1.getInt(1)+"><input type='hidden' name = 'patientIDDelete' value = "+rs2.getInt(1)+"><input type='hidden' name = 'serviceNameDelete' value ='"+rs3.getString(1)+"'></form></td></tr>");
							
						}
						stmt1.close();
						con.close();
					} 
					catch(SQLException e) 
					{
						out.println("SQLException caught: " + e.getMessage());
					}
					%>
				</tbody>
			</table>
		</div>
	</body>
	</html>