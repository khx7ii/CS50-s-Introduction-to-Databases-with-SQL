CREATE TABLE Users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE Schools (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    type TEXT NOT NULL,
    location TEXT NOT NULL,
    founded_year INTEGER NOT NULL
);

CREATE TABLE Companies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    industry TEXT NOT NULL,
    location TEXT NOT NULL
);


CREATE TABLE UserConnections (
    user1_id INTEGER,
    user2_id INTEGER,
    PRIMARY KEY (user1_id, user2_id),
    FOREIGN KEY (user1_id) REFERENCES Users(id),
    FOREIGN KEY (user2_id) REFERENCES Users(id),
    CHECK (user1_id != user2_id) -- prevent users to connect themselves
);


CREATE TABLE UserSchools (
    user_id INTEGER,
    school_id INTEGER,
    start_date TEXT NOT NULL,
    end_date TEXT, -- (null is still attended)
    degree TEXT NOT NULL,
    PRIMARY KEY (user_id, school_id),
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (school_id) REFERENCES Schools(id)
);


CREATE TABLE UserCompanies (
    user_id INTEGER,
    company_id INTEGER,
    start_date TEXT NOT NULL,
    end_date TEXT, -- Null if the user is still employed
    title TEXT NOT NULL, -- ex: "CEO", "Software Engineer"
    PRIMARY KEY (user_id, company_id),
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (company_id) REFERENCES Companies(id)
);

-- Sample Data
INSERT INTO Users (first_name, last_name, username, password) VALUES
('Alan', 'Garber', 'alan', 'password'),
('Reid', 'Hoffman', 'reid', 'password');

INSERT INTO Schools (name, type, location, founded_year) VALUES
('Harvard University', 'University', 'Cambridge, Massachusetts', 1636);

INSERT INTO Companies (name, industry, location) VALUES
('LinkedIn', 'Technology', 'Sunnyvale, California');

INSERT INTO UserSchools (user_id, school_id, start_date, end_date, degree) VALUES
(1, 1, '1973-09-01', '1976-06-01', 'BA');

INSERT INTO UserCompanies (user_id, company_id, start_date, end_date, title) VALUES
(2, 1, '2003-01-01', '2007-02-01', 'CEO and Chairman');
