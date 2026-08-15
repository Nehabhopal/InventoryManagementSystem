<%@ page import="java.sql.*" %>
<%@ page import="com.inventory.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Items List</title>

<style>
    body {
        font-family: Arial;
        text-align: center;
        background-image: url("https://previews.123rf.com/images/limagesstudio/limagesstudio2008/limagesstudio200800001/152914029-set-of-grocery-items-from-canned-food-vegetables-cereal-on-white-bacground-food-delivery-concept.jpg");
    background-size: cover;
    }

    table {
        border-collapse: collapse;
        margin: 20px auto;
        width: 90%;
    }

    th, td {
        border: 1px solid #ccc;
        padding: 10px;
    }

    th {
        background-color: #f2f2f2;
    }

    .expired {
        background-color: #ffcccc;
    }

    .warning {
        background-color: #fff3cd;
    }

    button {
        padding: 5px 10px;
        cursor: pointer;
    }
</style>
</head>

<body>

<h2>Inventory Control System</h2>

<a href="addItem.jsp"><button>Enter Item Details</button></a>
<a href="items.jsp"><button>Items List</button></a>
<a href="searchItem.jsp"><button>Search Item</button></a>
<a href="logout.jsp"><button>Logout</button></a>

<h3>Items List</h3>

<%
Connection con = DBConnection.getConnection();

/* 🔴 ALERT MESSAGE (ONLY ONCE) */
PreparedStatement alertPs = con.prepareStatement(
    "SELECT COUNT(*) FROM items WHERE expiry_date < CURDATE()");
ResultSet alertRs = alertPs.executeQuery();

if (alertRs.next()) {
    int expiredCount = alertRs.getInt(1);
    if (expiredCount > 0) {
%>
        <h3 style="color:red;">
            ⚠️ <%= expiredCount %> items are expired!
        </h3>
<%
    }
}

/* MAIN DATA */
PreparedStatement ps = con.prepareStatement("SELECT * FROM items");
ResultSet rs = ps.executeQuery();
%>

<table>
<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Stock</th>
    <th>Price</th>
    <th>Unit</th>
    <th>Delete</th>
    <th>Update</th>
    <th>Expiry Date</th>
    <th>Status</th>
</tr>

<%
while (rs.next()) {

    java.sql.Date expiryDate = rs.getDate("expiry_date");
    java.sql.Date today = new java.sql.Date(System.currentTimeMillis());

    boolean expired = expiryDate != null && expiryDate.before(today);

    long days = 0;
    if (expiryDate != null) {
        long diff = expiryDate.getTime() - today.getTime();
        days = diff / (1000 * 60 * 60 * 24);
    }

    String rowClass = "";
    if (expired) {
        rowClass = "expired";
    } else if (days <= 2 && expiryDate != null) {
        rowClass = "warning";
    }
%>

<tr class="<%= rowClass %>">

    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getInt("stock") %></td>
    <td><%= rs.getDouble("price") %></td>
    <td><%= rs.getString("unit") %></td>

    <!-- DELETE -->
    <td>
        <a href="deleteItem?id=<%= rs.getInt("id") %>">
            <button>Delete</button>
        </a>
    </td>

    <!-- UPDATE -->
    <td>
        <a href="editItem.jsp?id=<%= rs.getInt("id") %>">
            <button>Update</button>
        </a>
    </td>

    <!-- EXPIRY DATE -->
    <td>
        <%= (expiryDate != null) ? expiryDate : "N/A" %>
    </td>

    <!-- STATUS -->
    <td>
        <% if (expired) { %>
            Expired ❌
        <% } else if (days <= 2 && expiryDate != null) { %>
            Expiring Soon 
        <% } else { %>
            Valid ✅
        <% } %>
    </td>

</tr>

<%
}
%>

</table>

</body>
</html>