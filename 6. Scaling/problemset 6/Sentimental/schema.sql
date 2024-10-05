
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    username VARCHAR(50) UNIQUE,
    password VARCHAR(128)
);

CREATE TABLE Schools (
    school_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    type ENUM('Primary', 'Secondary', 'Higher Education'),
    location VARCHAR(100),
    year_founded YEAR
);


CREATE TABLE Companies (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    industry ENUM('Technology', 'Education', 'Business'),
    location VARCHAR(100)
);


CREATE TABLE UserSchoolConnections (
    connection_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    school_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (school_id) REFERENCES Schools(school_id)
);

CREATE TABLE UserCompanyConnections (
    connection_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    company_id INT,
    title VARCHAR(100),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (company_id) REFERENCES Companies(company_id)
);


INSERT INTO Users (first_name, last_name, username, password)
VALUES ('Claudine', 'Gay', 'claudine', 'password'),
       ('Reid', 'Hoffman', 'reid', 'password');

INSERT INTO Schools (name, type, location, year_founded)
VALUES ('Harvard University', 'Higher Education', 'Cambridge, Massachusetts', 1636);

INSERT INTO Companies (name, industry, location)
VALUES ('LinkedIn', 'Technology', 'Sunnyvale, California');

INSERT INTO UserSchoolConnections (user_id, school_id, start_date, end_date)
VALUES (1, 1, '1993-01-01', '1998-12-31');

INSERT INTO UserCompanyConnections (user_id, company_id, title, start_date, end_date)
VALUES (2, 1, 'CEO and Chairman', '2003-01-01', '2007-02-01');
