<%@ page import="java.sql.*" %>
<html>
<head>
<title>SMS</title>
<style>
*{font-size:40px;}
.nav a{
color:#fff;
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

a {
cursor: pointer;
  transition: all 200ms linear;
}
a:hover {
text-decoration: none;
color:yellow;
}
.nav{
color:yellow;
}
.form-group{ 
position:absolute;
	left:50%;
	top:50%;
	transform: translate(-50%,-50%);
        background-color: rgba(0, 0, 0, 0.89);
	border-radius:20px;
	padding:70px 100px;
}
.input-container{
position:relative;
margin-bottom:25px;
}
.input-container input{ 
  border:0;
  border-bottom:1px solid #555;  
  background:transparent;
  width:100%;
  padding:8px 0 5px 0;
  color:#fff;
}
.btn{background-color:#fff;
 border-radius:20px;
  cursor:pointer;
width:60%;
height:70px;

}
</style>
</head>
<body>
<center>
<div class="form-group">
<form method="POST">
<div class="input-container">
<input type = "text" name = "un" placeholder = "enter username" required/>
<br><br>
<input type = "password" name = "pw" placeholder = "enter password" required/>
<br><br>
</div>
<input type = "submit" value="LOGIN" name = "btn" class="btn">
<br><br>
<div class="nav">
<label>New User ? </label><a href="Signup.jsp">Signup</a>
</div>
<%
if(request.getParameter("btn") != null)
{
String un = request.getParameter("un");
String pw = request.getParameter("pw");

try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url = "jdbc:mysql://localhost:3306/final_23july23";
Connection con = DriverManager.getConnection(url ,"root" , "abc123");
String sql = "select*from user where un = ? and pw = ?";
PreparedStatement pst = con.prepareStatement(sql);
pst.setString(1,un);
pst.setString(2,pw);
ResultSet rs = pst.executeQuery();
if(rs.next())
{
session.setAttribute("un",un);
response.sendRedirect("Home.jsp");
}
else
{
out.println("invalid login");
}
con.close();
}
catch(SQLException e)
{
out.println("sql issue" + e);
}

}

%>


</form>
</div>
</center>
</body>
</html>