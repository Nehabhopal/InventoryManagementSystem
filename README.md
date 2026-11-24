# Inventory Management System

A simple web-based Inventory Management System built with **JSP (JavaServer Pages)**. It lets authorized users log in and manage inventory items: view, add, and edit products.

## Features

- **User Login** – Secure entry point to the application (`login.jsp`)
- **Item Listing** – View all inventory items in one place (`items.jsp`)
- **Add Item** – Add new products to the inventory (`addItem.jsp`)
- **Edit Item** – Update details of existing products (`editItem.jsp`)
- **Home Page** – Landing page / entry point (`index.jsp`)

## Tech Stack

| Layer       | Technology                              |
|-------------|-----------------------------------------|
| Frontend    | JSP, HTML, CSS                          |
| Backend     | Java (Servlets / JSP)                   |
| Database    | MySQL *(update if you use another DB)*  |
| Server      | Apache Tomcat                           |

## Project Structure

```
InventoryManagementSystem/
├── index.jsp       # Home / landing page
├── login.jsp       # User login page
├── items.jsp       # List of all inventory items
├── addItem.jsp     # Form to add a new item
└── editItem.jsp    # Form to edit an existing item
```

## Prerequisites

- Java JDK 8 or higher
- Apache Tomcat 9 or higher
- MySQL (or your chosen database) and the matching JDBC driver
- An IDE such as Eclipse, IntelliJ IDEA, or NetBeans (optional)

## Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/Nehabhopal/InventoryManagementSystem.git
   cd InventoryManagementSystem
   ```

2. **Set up the database**
   - Create a database, e.g. `inventory_db`
   - Create the required tables (e.g. `users` and `items`)
   - Update the database URL, username, and password in your JSP/connection code

3. **Deploy to Tomcat**
   - Import the project into your IDE as a Dynamic Web Project, **or**
   - Copy the project folder into Tomcat's `webapps/` directory

4. **Run the application**
   - Start Tomcat
   - Open `http://localhost:8080/InventoryManagementSystem/` in your browser

## Usage

1. Open the app and log in from the login page.
2. Go to the items page to see the current inventory.
3. Use **Add Item** to create new entries.
4. Use **Edit** on any item to update its details.

## Future Improvements

- Delete item functionality
- Search and filter items
- Role-based access (Admin / Staff)
- Password hashing and stronger security
- Low-stock alerts and reports

## Contributing

Contributions are welcome! Fork the repo, create a feature branch, and open a pull request.

## Author

**Neha Bhopal** – [GitHub](https://github.com/Nehabhopal)

## License

This project is open source. Add a license of your choice (e.g. MIT) to the repository.
