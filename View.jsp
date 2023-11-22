<%@ page import="java.sql.*" %>
<html>
<head>
<title>SMS</title>
<style>
*{font-size:40px;}
.nav{background-color:black;}
.nav a{
color:white;
text-decoration:none;
margin:5%;
}
body{
	font-family: 'Poppins', sans-serif;
	font-weight: 300;
	font-size: 15px;
	line-height: 1.7;
	color: #c4c3ca;
	background-color: #1f2029;
	overflow-x: hidden;
}
table{
width:50%;
background-color:black;
color:#fff;
margin-top:60px;
}
</style>
</head>
<body>
<center>
<div class="nav">
<a href="Home.jsp">ADD</a>
<a href="View.jsp">VIEW</a>
<a href="Update.jsp">UPDATE</a>
<a href="Delete.jsp">DELETE</a>
<a href="Logout.jsp">LOGOUT</a>
</div>
<div class="form-group">
<table border = "5" style = "width:50%">
<tr>
<th>rno</th>
<th>name</th>
<th>marks</th>
</tr>

<%
String un = (String)session.getAttribute("un");
if(un == null)
{
response.sendRedirect("index.jsp");
}
%>

<%
try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url = "jdbc:mysql://localhost:3306/final_23july23";
Connection con = DriverManager.getConnection(url ,"root" , "abc123");
String sql = "select * from student ";
PreparedStatement pst = con.prepareStatement(sql);
ResultSet rs = pst.executeQuery();
while(rs.next())
{
%>
<tr style = "text-align:center;">
<td><%= rs.getInt(1)%></td>
<td><%= rs.getString(2)%></td>
<td><%= rs.getInt(3)%></td>

</tr>
<% }
con.close();
}
catch(SQLException e)
{
out.println("issue" + e);

}

%>
</table>
</div>
</center>
</body>
</html>