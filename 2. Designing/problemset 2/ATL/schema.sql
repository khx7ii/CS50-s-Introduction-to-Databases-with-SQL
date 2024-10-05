CREATE TABLE IF NOT EXISTS Passengers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER NOT NULL CHECK (age > 0)
);

CREATE TABLE IF NOT EXISTS Airlines (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    concourse TEXT NOT NULL CHECK (concourse IN ('A', 'B', 'C', 'D', 'E', 'F', 'T'))
);


CREATE TABLE IF NOT EXISTS Flights (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    flight_number TEXT NOT NULL,
    airline_id INTEGER NOT NULL,
    departure_airport_code TEXT NOT NULL,
    arrival_airport_code TEXT NOT NULL,
    expected_departure_time TEXT NOT NULL,
    expected_arrival_time TEXT NOT NULL,
    FOREIGN KEY (airline_id) REFERENCES Airlines(id)
);

CREATE TABLE IF NOT EXISTS CheckIns (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    passenger_id INTEGER NOT NULL,
    flight_id INTEGER NOT NULL,
    check_in_time TEXT NOT NULL,
    FOREIGN KEY (passenger_id) REFERENCES Passengers(id),
    FOREIGN KEY (flight_id) REFERENCES Flights(id)
);
