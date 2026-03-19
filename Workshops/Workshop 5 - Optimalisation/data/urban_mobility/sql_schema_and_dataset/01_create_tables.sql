CREATE TABLE IF NOT EXISTS scooters (
    scooter_id BIGSERIAL PRIMARY KEY,
    model TEXT NOT NULL,
    battery_capacity INT NOT NULL,   -- in Wh
    purchase_date DATE NOT NULL,
    status TEXT NOT NULL,            -- active, maintenance, retired
    city TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS rides (
    ride_id BIGSERIAL PRIMARY KEY,
    scooter_id BIGINT NOT NULL REFERENCES scooters(scooter_id),
    
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    
    start_lat NUMERIC(9,6),
    start_lon NUMERIC(9,6),
    end_lat NUMERIC(9,6),
    end_lon NUMERIC(9,6),
    
    distance_km NUMERIC(5,2),
    duration_seconds INT,
    price NUMERIC(6,2),

    CONSTRAINT chk_time CHECK (end_time > start_time)
);