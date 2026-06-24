<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String idx = request.getParameter("index");

// safety check
if (idx != null && !idx.equals("")) {

    int index = Integer.parseInt(idx);

    List<String> cart = (List<String>) session.getAttribute("cart");

    if (cart != null && index >= 0 && index < cart.size()) {
        cart.remove(index);
    }

    session.setAttribute("cart", cart);
}

// always go back
response.sendRedirect("cart.jsp");
%>