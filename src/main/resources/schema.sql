-- Create the LawLink database
CREATE DATABASE IF NOT EXISTS c5_db;
USE c5_db;

-- Create Users table (base table for all user types)
CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    password_salt VARCHAR(100),
    email VARCHAR(100) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    role ENUM('ADMIN', 'LAWYER', 'CLIENT') NOT NULL DEFAULT 'CLIENT',
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP NULL,
    is_active BOOLEAN DEFAULT TRUE,
    profile_image VARCHAR(255),
    session_token VARCHAR(255),
    session_expiry TIMESTAMP NULL,
    reset_token VARCHAR(255),
    reset_token_expiry TIMESTAMP NULL,
    otp VARCHAR(6) NULL,
    otp_expiry TIMESTAMP NULL
);

-- Create Admins table (extends Users)
CREATE TABLE IF NOT EXISTS Admins (
    admin_id INT PRIMARY KEY,
    FOREIGN KEY (admin_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Create Lawyers table (extends Users)
CREATE TABLE IF NOT EXISTS Lawyers (
    lawyer_id INT PRIMARY KEY,
    specialization VARCHAR(100) NOT NULL,
    practice_areas TEXT NOT NULL,
    experience_years INT NOT NULL,
    education TEXT NOT NULL,
    license_number VARCHAR(50) NOT NULL,
    about_me TEXT,
    consultation_fee DECIMAL(10, 2) NOT NULL,
    is_verified BOOLEAN DEFAULT FALSE,
    is_available BOOLEAN DEFAULT TRUE,
    rating DECIMAL(3, 2) DEFAULT 0.0,
    FOREIGN KEY (lawyer_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Create Clients table (extends Users)
CREATE TABLE IF NOT EXISTS Clients (
    client_id INT PRIMARY KEY,
    date_of_birth DATE,
    gender ENUM('MALE', 'FEMALE', 'OTHER'),
    FOREIGN KEY (client_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Create LawyerAvailability table
CREATE TABLE IF NOT EXISTS LawyerAvailability (
    lawyer_id INT NOT NULL,
    day_of_week ENUM('MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY', 'SUNDAY') NOT NULL,
    is_available BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (lawyer_id, day_of_week),
    FOREIGN KEY (lawyer_id) REFERENCES Lawyers(lawyer_id) ON DELETE CASCADE
);

-- Create Appointments table
CREATE TABLE IF NOT EXISTS Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    lawyer_id INT NOT NULL,
    client_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    appointment_time TIME NOT NULL,
    duration INT NOT NULL DEFAULT 60,
    status ENUM('PENDING', 'CONFIRMED', 'COMPLETED', 'CANCELLED') DEFAULT 'PENDING',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (lawyer_id) REFERENCES Lawyers(lawyer_id) ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id) ON DELETE CASCADE,
    UNIQUE KEY unique_appointment (lawyer_id, appointment_date, appointment_time)
);

-- Create Reviews table
CREATE TABLE IF NOT EXISTS Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id) ON DELETE CASCADE
);

-- Create PracticeAreas table
CREATE TABLE IF NOT EXISTS PracticeAreas (
    area_id INT AUTO_INCREMENT PRIMARY KEY,
    area_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    image VARCHAR(255)
);

-- Create LawyerPracticeAreas junction table
CREATE TABLE IF NOT EXISTS LawyerPracticeAreas (
    lawyer_id INT NOT NULL,
    area_id INT NOT NULL,
    PRIMARY KEY (lawyer_id, area_id),
    FOREIGN KEY (lawyer_id) REFERENCES Lawyers(lawyer_id) ON DELETE CASCADE,
    FOREIGN KEY (area_id) REFERENCES PracticeAreas(area_id) ON DELETE CASCADE
);


-- Insert practice areas
INSERT INTO PracticeAreas (area_name, description, image) VALUES
('Property Law', 'Legal matters related to real estate, property rights, and transactions', 'property-law.png'),
('Family Law', 'Legal issues related to family relationships, divorce, child custody, etc.', 'family-law.png'),
('Criminal Law', 'Legal defense and prosecution for criminal offenses', 'criminal-law.png'),
('Corporate Law', 'Legal services for businesses, corporations, and commercial entities', 'corporate-law.png'),
('Labor Law', 'Legal matters related to employment, workplace rights, and regulations', 'labor-law.png'),
('International Law', 'Legal issues crossing international boundaries and jurisdictions', 'international-law.png');

-- Insert default admin
INSERT INTO Users (username, password, email, full_name, role)
VALUES ('admin', '$2a$10$XFE/oW.Lz6wAOej7vdCUj.p1QK/SAGpVnO1V1oCGHxqBzUCfA7SBu', 'admin@lawlink.com', 'System Administrator', 'ADMIN');

INSERT INTO Admins (admin_id) VALUES (LAST_INSERT_ID());
