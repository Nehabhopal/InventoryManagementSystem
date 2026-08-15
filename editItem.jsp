<%@ page import="java.sql.*" %>
<%@ page import="com.inventory.DBConnection" %>

<%
String idParam = request.getParameter("id");

if (idParam == null) {
%>
    <h3 style="color:red; text-align:center;">Invalid Request (ID missing)</h3>
<%
    return;
}

int id = Integer.parseInt(idParam);

Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement(
    "SELECT * FROM items WHERE id=?");

ps.setInt(1, id);
ResultSet rs = ps.executeQuery();

if (rs.next()) {
%>

<!DOCTYPE html>
<html>
<head>
<title>Update Item</title>

<style>
    body {
        font-family: Arial;
        background-color: #f2f2f2;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        background: golden yellow;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0,0,0,0.2);
        width: 350px;
        text-align: center;
    }

    h2 {
        margin-bottom: 20px;
    }

    input {
        width: 90%;
        padding: 10px;
        margin: 8px 0;
        border-radius: 5px;
        border: 1px solid #ccc;
    }

    button {
        padding: 10px 20px;
        margin-top: 10px;
        border: none;
        border-radius: 5px;
        background-color: #4CAF50;
        color: white;
        cursor: pointer;
    }

    button:hover {
        background-color: #45a049;
    }

    .back-btn {
        background-color: #777;
        margin-top: 10px;
    }

    .back-btn:hover {
        background-color: #555;
    }
</style>

</head>

<body>

<div class="container">

<h2>Update Item</h2>

<form action="updateItem" method="post">

    <!-- Hidden ID -->
    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

    <input type="text" name="name" value="<%= rs.getString("name") %>" placeholder="Name" required>

    <input type="number" name="stock" value="<%= rs.getInt("stock") %>" placeholder="Stock" required>

    <input type="number" step="0.01" name="price" value="<%= rs.getDouble("price") %>" placeholder="Price" required>

    <input type="text" name="unit" value="<%= rs.getString("unit") %>" placeholder="Unit" required>

    <!-- Expiry Date -->
    <input type="date" name="expiry_date" value="<%= rs.getDate("expiry_date") %>">

    <button type="submit">Update</button>

</form>

<!-- Back button -->
<form action="items.jsp">
    <button class="back-btn">Back</button>
</form>

</div>

</body>
</html>

<%
} else {
%>
    <h3 style="color:red; text-align:center;">No item found</h3>
<%
}
%>