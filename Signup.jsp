<%@ page import="java.sql.*" %>
<html>
<head>
<title>SMS</title>
<style>
*{font-size:35px;}
.nav a{
color:#fff;
}
body{
	font-family: 'Poppins', sans-serif;
	font-weight: 300;
	font-size: 13px;
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
	top:52%;
	transform: translate(-50%,-50%);
        background-color: rgba(0,0,0,0.89);
	
        border-radius:20px;
        box-shadow: 0 0 10px rgba(0,0,0,.2);
	padding:70px 100px;
        width:500px;
        height:550px;
        
}
.input-container{
position:relative;
margin-bottom:18px;
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
  width:80%;

height:70px;
}
</style>

<script src ="Valid.js"></script>
</head>
<body>
<center>
<div class="form-group">
<form method="POST" onsubmit="return check()">
<div class="input-container">
<input type = "text" name = "un" placeholder = "enter username" id="un" />
<br><br>
<input type = "password" name = "pw1" placeholder = "enter password" id="pw" />
<br><br>
<input type = "password" name = "pw2" placeholder = "enter confirm password" />
<br><br>
</div>
<input type = "submit" name = "btn" value="REGISTER" class="btn"/>
<br><br>
<%
if(request.getParameter("btn") != null)
{
String un = request.getParameter("un");
String pw1 = request.getParameter("pw1");
String pw2 = request.getParameter("pw2");
if(! pw1.equals(pw2))
{
out.println("password did not match");
}
else{
try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url = "jdbc:mysql://localhost:3306/final_23july23";
Connection con = DriverManager.getConnection(url ,"root" , "abc123");
String sql = "insert into user values(?,?)";
PreparedStatement pst = con.prepareStatement(sql);
pst.setString(1,un);
pst.setString(2,pw1);
pst.executeUpdate();
out.println("Successfully Registered :)");
con.close();
}
catch(SQLException e)
{
out.println("sql issue" + e);
}

}
}
%>
<div class="nav">
<label>Already user ? </label><a href = "index.jsp">Login<label> Here</label></a>

</form>
</div>
</center>
</body>
</html>