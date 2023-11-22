<%@ page import="java.sql.*"%>
<html>
<head>
<title>SMS</title>
<style>
*{font-size:40px;}
.nav{background-color:black;}
.nav a{
color:#fff;
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
<script src ="Check.js"></script>
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
<%
String un = (String)session.getAttribute("un");
if(un == null)
{
response.sendRedirect("index.jsp");
}
%>
<div class="form-group">
<form method="POST" onsubmit="return valid()">
<div class="input-container">
<input type="number" name="rno" placeholder="enter rno" id="rn"/>
<br><br>
</div>
<input type="submit" value="Delete" name="btn" class="btn"/>
<br>
<%
if(request.getParameter("btn")!=null)
{
int rno=Integer.parseInt(request.getParameter("rno"));
try
{

DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url="jdbc:mysql://localhost:3306/final_23july23";
Connection con=DriverManager.getConnection(url,"root","abc123");
String sql="delete from student where rno=(?)";
PreparedStatement pst=con.prepareStatement(sql);
pst.setInt(1,rno);
long rc = pst.executeUpdate();
if(rc>0)
{
out.println("record deleted");
}
else{
out.println("record does not exists :(");
}
con.close();
}
catch(SQLException e)
{
out.println("issue "+e);
}
}
%>
</form>
</div>
</center>
</body>
</html>