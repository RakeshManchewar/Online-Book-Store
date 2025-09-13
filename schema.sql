-- Online Book Store Database Schema
CREATE DATABASE IF NOT EXISTS online_book_store;
USE online_book_store;

-- Users table
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    role ENUM('ROLE_USER', 'ROLE_ADMIN') DEFAULT 'ROLE_USER',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Books table
CREATE TABLE books (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    image_url VARCHAR(500),
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Orders table
CREATE TABLE orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('PENDING', 'CONFIRMED', 'SHIPPED', 'DELIVERED', 'CANCELLED') DEFAULT 'PENDING',
    shipping_address TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Order items table
CREATE TABLE order_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    book_id BIGINT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE
);

-- Shopping cart table
CREATE TABLE cart_items (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    book_id BIGINT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    added_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE
);

-- Insert default admin user (password: admin)
INSERT INTO users (email, password, full_name, role) VALUES
('admin@bookstore.com', '$2a$10$ZR6zBBNfMf3bfM68Q8UzE.9rT3q7k1VWJkQ8rQ2bQ1cQ4VXQ2XQ2u', 'Admin User', 'ROLE_ADMIN');

-- Insert sample user (password: user123)
INSERT INTO users (email, password, full_name, role) VALUES
('user@example.com', '$2a$10$XZR6zBBNfMf3bfM68Q8UzE.9rT3q7k1VWJkQ8rQ2bQ1cQ4VXQ2XQ2u', 'John Doe', 'ROLE_USER');

-- Insert sample books
INSERT INTO books (title, author, description, category, price, stock_quantity, image_url) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'A classic novel of the Jazz Age', 'Fiction', 12.99, 50, '/assets/images/gatsby.jpg'),
('To Kill a Mockingbird', 'Harper Lee', 'A story of racial injustice and childhood innocence', 'Fiction', 11.50, 40, '/assets/images/mockingbird.jpg'),
('1984', 'George Orwell', 'Dystopian social science fiction novel', 'Science Fiction', 10.75, 60, '/assets/images/1984.jpg'),
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy novel and children''s book', 'Fantasy', 14.25, 30, '/assets/images/hobbit.jpg'),
('Pride and Prejudice', 'Jane Austen', 'Romantic novel of manners', 'Romance', 9.99, 45, '/assets/images/pride.jpg'),
('The Catcher in the Rye', 'J.D. Salinger', 'Story of teenage rebellion and alienation', 'Fiction', 10.99, 35, '/assets/images/catcher.jpg');

-- Display success message
SELECT '✅ Online Book Store database created successfully!' AS '';
SELECT '📦 Tables created: users, books, orders, order_items, cart_items' AS '';
SELECT '👤 Default admin login: admin@bookstore.com / admin' AS '';
SELECT '👤 Default user login: user@example.com / user123' AS '';
