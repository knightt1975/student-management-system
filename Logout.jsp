<%@ page import="java.sql.*" %>
<html>
<head>
<title> SMS </title>
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
	top:40%;
	transform: translate(-50%,-50%);
        background-color: rgba(0, 0, 0, 0.89);
	border-radius:20px;
	padding:70px 100px;
	height:20%;
}

.button{background-color:#fff;
 border-radius:10px;
  cursor:pointer;
width:120%;
height:70px;
margin-right:35%;
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
<script>
 function confirmLogout() {
    return confirm("Are you sure you want to logout?");
  }
</script>

<%
String un = (String)session.getAttribute("un");
if(un == null)
{
response.sendRedirect("index.jsp");
}
%>
<br>
<div class="input-container">
<form>
<div class="form-group">
<input type = "submit" value = "Logout" name = "btn" onclick="return confirmLogout()" class = "button"/>
</div>
</form>
</div>
<%
if(request.getParameter("btn") !=null)
{
session.invalidate();
response.sendRedirect("index.jsp");
}
%>
</center>
</body>
</html>