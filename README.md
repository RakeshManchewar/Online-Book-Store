# Online Book Store

A modern full-stack e-commerce application for purchasing books online, built with Angular and Spring Boot.

## ✨ Features

- **User Authentication:** Login and registration with JWT security.
- **Book Catalog:** Browse and search books by title, author, or category.
- **Shopping Cart:** Add/remove items and manage quantities.
- **Order Management:** Complete checkout process and view order history.
- **Admin Panel:** Manage books and view all orders (Admin only).
- **Responsive Design:** Works seamlessly on desktop and mobile devices.

## 🛠️ Tech Stack

- **Frontend:** Angular 15+, TypeScript, HTML5, CSS3, Bootstrap
- **Backend:** Spring Boot 3+, Spring Security, Spring Data JPA, JWT
- **Database:** MySQL 8.0
- **Build Tools:** Angular CLI, Maven

## 🚀 Quick Start

### Prerequisites
- Node.js (v18 or higher)
- npm (v9 or higher)
- Java 17 or higher
- MySQL 8.0 or higher

### Installation & Setup

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/RakeshManchewar/Online-Book-Store.git
    cd Online-Book-Store
    ```

2.  **Set up the database:**
    ```bash
    mysql -u root -p < schema.sql
    ```

3.  **Run the Spring Boot backend:**
    ```bash
    cd backend
    ./mvnw spring-boot:run
    ```
    The API server will start on `http://localhost:8080`

4.  **Run the Angular frontend (in a new terminal):**
    ```bash
    cd frontend
    npm install
    ng serve
    ```
    The application will open on `http://localhost:4200`

## 🔐 Default Login Credentials

- **Admin User:** 
  - Email: `admin@bookstore.com`
  - Password: `admin`

- **Regular User:** 
  - Register a new account or use:
  - Email: `user@example.com`
  - Password: `user123`

## 📁 Project Structure
Online-Book-Store/
- backend/ # Spring Boot Application
  - src/main/java/
  - pom.xml
  - application.properties
- frontend/ # Angular Application
  - src/app/
  - package.json
  - angular.json
- schema.sql # Database Schema

---

**Author:** Rakesh Manchewar  
**GitHub:** [@RakeshManchewar](https://github.com/RakeshManchewar)
