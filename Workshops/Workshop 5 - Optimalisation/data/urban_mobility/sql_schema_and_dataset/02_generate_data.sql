-- Insert scooters
WITH new_scooters AS (
    SELECT
        (ARRAY[
            'Segway Ninebot Max',
            'Xiaomi Pro 2',
            'NIU KQi3',
            'Bird One',
            'Voi Explorer'
        ])[1 + floor(random() * 5)::int] AS model,

        (ARRAY[450, 500, 551, 600])[1 + floor(random() * 4)::int] AS battery_capacity,

        DATE '2022-01-01' + floor(random() * 1460)::int AS purchase_date,

        CASE
            WHEN random() < 0.85 THEN 'active'
            WHEN random() < 0.95 THEN 'maintenance'
            ELSE 'retired'
        END AS status,

        (ARRAY['Rotterdam', 'Amsterdam', 'Utrecht', 'Den Haag'])
            [1 + floor(random() * 4)::int] AS city
    FROM generate_series(1, 500)
)
INSERT INTO scooters (model, battery_capacity, purchase_date, status, city)
SELECT
    model,
    battery_capacity,
    purchase_date,
    status,
    city
FROM new_scooters
WHERE NOT EXISTS (SELECT 1 FROM scooters);

-- Insert rides
WITH ride_numbers AS (
    SELECT generate_series(1, 1000000) AS ride_number
),
random_rides AS (
    SELECT
        1 + floor(random() * 500)::int AS scooter_id,

        TIMESTAMP '2024-01-01 00:00:00'
            + (random() * INTERVAL '730 days') AS start_time,

        (180 + floor(random() * 2520))::int AS duration_seconds,

        round((0.8 + random() * 11.2)::numeric, 2) AS distance_km,

        round((51.880000 + random() * 0.080000)::numeric, 6) AS start_lat,
        round((4.420000 + random() * 0.120000)::numeric, 6) AS start_lon,

        round((51.880000 + random() * 0.080000)::numeric, 6) AS end_lat,
        round((4.420000 + random() * 0.120000)::numeric, 6) AS end_lon
    FROM ride_numbers
),
final_rides AS (
    SELECT
        scooter_id,
        start_time,
        start_time + (duration_seconds * INTERVAL '1 second') AS end_time,
        start_lat,
        start_lon,
        end_lat,
        end_lon,
        distance_km,
        duration_seconds,
        round((1.00 + distance_km * 0.85 + duration_seconds / 600.0)::numeric, 2) AS price
    FROM random_rides
)
INSERT INTO rides (
    scooter_id,
    start_time,
    end_time,
    start_lat,
    start_lon,
    end_lat,
    end_lon,
    distance_km,
    duration_seconds,
    price
)
SELECT
    scooter_id,
    start_time,
    end_time,
    start_lat,
    start_lon,
    end_lat,
    end_lon,
    distance_km,
    duration_seconds,
    price
FROM final_rides;