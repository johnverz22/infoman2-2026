-- First, check the number of bookings for flight 1
SELECT COUNT(*) FROM bookings WHERE flight_id = 1;
-- Then, call the procedure to book a new seat
CALL book_flight(3, 1, '14C');
-- Finally, check the count again to see if it increased
SELECT COUNT(*) FROM bookings WHERE flight_id = 1;