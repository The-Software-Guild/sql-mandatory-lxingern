-- 1. Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.

-- SELECT guests.name, rooms.room_no, reservations.start_date, reservations.end_date
-- FROM guests
-- JOIN reservations ON guests.id = reservations.guest_id
-- JOIN rooms ON reservations.room_no = rooms.room_no
-- WHERE reservations.end_date BETWEEN '2023-07-01' AND '2023-07-31';

-- +----------------+---------+------------+------------+
-- | name           | room_no | start_date | end_date   |
-- +----------------+---------+------------+------------+
-- | XingErn Low    |     205 | 2023-06-28 | 2023-07-02 |
-- | Walter Holaway |     204 | 2023-07-13 | 2023-07-14 |
-- | Wilfred Vise   |     401 | 2023-07-18 | 2023-07-21 |
-- | Bettyann Seery |     303 | 2023-07-28 | 2023-07-29 |
-- +----------------+---------+------------+------------+

-- 2. Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.

-- SELECT guests.name, rooms.room_no, reservations.start_date, reservations.end_date
-- FROM guests
-- JOIN reservations ON guests.id = reservations.guest_id
-- JOIN rooms ON reservations.room_no = rooms.room_no
-- WHERE rooms.has_jacuzzi = 1;

-- +----------------+---------+------------+------------+
-- | name           | room_no | start_date | end_date   |
-- +----------------+---------+------------+------------+
-- | Karie Yang     |     201 | 2023-03-06 | 2023-03-07 |
-- | Bettyann Seery |     203 | 2023-02-05 | 2023-02-10 |
-- | Karie Yang     |     203 | 2023-09-13 | 2023-09-15 |
-- | XingErn Low    |     205 | 2023-06-28 | 2023-07-02 |
-- | Wilfred Vise   |     207 | 2023-04-23 | 2023-04-24 |
-- | Walter Holaway |     301 | 2023-04-09 | 2023-04-13 |
-- | Mack Simmer    |     301 | 2023-11-22 | 2023-11-25 |
-- | Bettyann Seery |     303 | 2023-07-28 | 2023-07-29 |
-- | Duane Cullison |     305 | 2023-02-22 | 2023-02-24 |
-- | Bettyann Seery |     305 | 2023-08-30 | 2023-09-01 |
-- | XingErn Low    |     307 | 2023-03-17 | 2023-03-20 |
-- +----------------+---------+------------+------------+

-- 3. Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)

-- SELECT guests.name, rooms.room_no, reservations.start_date, (reservations.no_of_adults + reservations.no_of_children) AS pax
-- FROM guests
-- JOIN reservations ON guests.id = reservations.guest_id
-- JOIN rooms ON reservations.room_no = rooms.room_no
-- WHERE guests.name = "Mack Simmer";

-- +-------------+---------+------------+-----+
-- | name        | room_no | start_date | pax |
-- +-------------+---------+------------+-----+
-- | Mack Simmer |     308 | 2023-02-02 |   1 |
-- | Mack Simmer |     208 | 2023-09-16 |   2 |
-- | Mack Simmer |     206 | 2023-11-22 |   2 |
-- | Mack Simmer |     301 | 2023-11-22 |   4 |
-- +-------------+---------+------------+-----+

-- 4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room.

-- SELECT rooms.room_no, reservations.id, reservations.total_cost
-- FROM rooms
-- LEFT OUTER JOIN reservations ON rooms.room_no = reservations.room_no;

-- +---------+------+------------+
-- | room_no | id   | total_cost |
-- +---------+------+------------+
-- |     205 |   15 |     699.96 |
-- |     206 |   12 |     599.96 |
-- |     206 |   23 |     449.97 |
-- |     207 |   10 |     174.99 |
-- |     208 |   13 |     599.96 |
-- |     208 |   20 |     149.99 |
-- |     305 |    3 |     349.98 |
-- |     305 |   19 |     349.98 |
-- |     306 | NULL |       NULL |
-- |     307 |    5 |     524.97 |
-- |     308 |    1 |     299.98 |
-- |     201 |    4 |     199.99 |
-- |     202 |    7 |     349.98 |
-- |     203 |    2 |     999.95 |
-- |     203 |   21 |     399.98 |
-- |     204 |   16 |     184.99 |
-- |     301 |    9 |     799.96 |
-- |     301 |   24 |     599.97 |
-- |     302 |    6 |     924.95 |
-- |     302 |   25 |     699.96 |
-- |     303 |   18 |     199.99 |
-- |     304 |   14 |     184.99 |
-- |     401 |   11 |    1199.97 |
-- |     401 |   17 |    1259.97 |
-- |     401 |   22 |    1199.97 |
-- |     402 | NULL |       NULL |
-- +---------+------+------------+

-- 5. Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.

-- SELECT * FROM rooms
-- 	WHERE rooms.room_no IN (
-- 		SELECT reservations.room_no FROM reservations
-- 			WHERE (no_of_adults + no_of_children) >= 3
-- 				AND (start_date BETWEEN '2023-04-01' AND '2023-04-30'
-- 						OR end_date BETWEEN '2023-04-01' AND '2023-04-30')
-- 	);

-- No results for April 2023.

-- 6. Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.

-- SELECT guests.name, COUNT(reservations.id) AS number_of_reservations
-- FROM guests
-- JOIN reservations ON guests.id = reservations.guest_id
-- GROUP BY guests.name
-- ORDER BY number_of_reservations DESC, SUBSTRING(guests.name, INSTR(guests.name, " ") + 1);

-- +---------------------+------------------------+
-- | name                | number_of_reservations |
-- +---------------------+------------------------+
-- | Mack Simmer         |                      4 |
-- | Bettyann Seery      |                      3 |
-- | Duane Cullison      |                      2 |
-- | Walter Holaway      |                      2 |
-- | Aurore Lipton       |                      2 |
-- | XingErn Low         |                      2 |
-- | Maritza Tilton      |                      2 |
-- | Joleen Tison        |                      2 |
-- | Wilfred Vise        |                      2 |
-- | Karie Yang          |                      2 |
-- | Zachery Luechtefeld |                      1 |
-- +---------------------+------------------------+

-- 7. Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)

-- SELECT name, address, phone FROM guests
-- 	WHERE phone = "(377) 507-0974";
    
-- +---------------+----------------------+----------------+
-- | name          | address              | phone          |
-- +---------------+----------------------+----------------+
-- | Aurore Lipton | 762 Wild Rose Street | (377) 507-0974 |
-- +---------------+----------------------+----------------+