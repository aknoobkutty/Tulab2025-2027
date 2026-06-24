<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
String name = request.getParameter("name");
String price = request.getParameter("price");

List<String> cart = (List<String>) session.getAttribute("cart");

if(cart == null){
    cart = new ArrayList<>();
}

cart.add(name + " - ₹" + price);

session.setAttribute("cart", cart);

response.sendRedirect("index.jsp");
%>