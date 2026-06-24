<%@ page import="java.sql.*, dao.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<title>Products</title>
<meta charset="UTF-8">
<style>
    body { font-family: Arial; text-align:center; }
    table { margin:auto; border-collapse: collapse; width:60%; }
    th, td { border:1px solid #ccc; padding:10px; }
    th { background:#236fe2; color:white; }
</style>
</head>

<body>

<h2>🛍️Our Products</h2>

<table>
<tr>
<th>No</th>
<th>Name</th>
<th>Price</th>
<th>Action</th>
</tr>

<%
Connection con = DBConnection.getConnection();
if (con == null) {
    out.println("DB Error");
    return;
}

Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM products");

int i = 1;

while(rs.next()){
%>

<tr>
<td><%= i++ %></td>
<td><%= rs.getString("name") %></td>
<td>₹ <%= rs.getDouble("price") %></td>
<td>
<form action="addToCart.jsp" method="post">
<input type="hidden" name="name" value="<%= rs.getString("name") %>">
<input type="hidden" name="price" value="<%= rs.getDouble("price") %>">
<button>Add</button>
</form>
</td>
</tr>

<%
}
%>

</table>

<br>

<a href="cart.jsp"><button>🛒 Go to Cart</button></a>


</body>
</html>