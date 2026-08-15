<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Add Item</title>

<style>
body {
    margin: 0;
    font-family: Arial;
    background:#f5e6cc;
    background-image: url("https://thumbs.dreamstime.com/b/food-supplies-period-quarantine-blue-background-set-grocery-items-canned-food-vegetables-pasta-food-supplies-181959811.jpg");
    background-size: cover;
}

/* Sidebar */
.sidebar {
    position: fixed;
    left: 0;
    top: 0;
    width: 60px;
    height: 100%;
    background: linear-gradient(to bottom, #6a11cb, #2575fc);
}

/* Main container */
.container {
    margin-left: 80px;
    text-align: center;
    padding-top: 30px;
}

/* Buttons */
.nav-buttons button {
    margin: 5px;
    padding: 8px 15px;
    border: none;
    background-color: #ddd;
    cursor: pointer;
}

.nav-buttons button:hover {
    background-color: #bbb;
}

/* Form */
.form-box {
    background: white;
    padding: 20px;
    width: 300px;
    margin: 30px auto;
    border-radius: 10px;
    box-shadow: 0 0 10px gray;
}

input {
    width: 90%;
    padding: 8px;
    margin: 8px 0;
}

button.submit-btn {
    padding: 8px 15px;
    background-color: green;
    color: white;
    border: none;
    cursor: pointer;
}

button.submit-btn:hover {
    background-color: #6a11cb;
}
</style>
<script>
function setUnit() {
    let name = document.getElementById("name").value.toLowerCase();
    let unit = "";

    if(name.includes("milk") || name.includes("oil") || name.includes("juice")) {
        unit = "liters";
    } 
    else if(name.includes("rice") || name.includes("sugar") || name.includes("wheat")) {
        unit = "kg";
    } 
    else {
        unit = "pieces";
    }

    document.getElementById("unit").value = unit;
}
</script>

</head>

<body>

<div class="sidebar"></div>

<div class="container">

<h2>Inventory Control System</h2>

<!-- Navigation -->

<div class="form-box">
<h3>Enter Item Details</h3>

<form action="AddItemServlet" method="post">
    Name: <input type="text" name="name" id="name" onkeyup="setUnit()"><br><br>

Stock: <input type="text" name="stock"><br><br>

Price: <input type="text" name="price"><br><br>


Unit: <input type="text" name="unit" id="unit" readonly><br><br>
Expiry Date:<br><input type="date" name="expiry_date"><br>
<input type="submit" value="Save">
</form>
</div>

</div>

</body>
</html>