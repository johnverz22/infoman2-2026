-- Goal:
-- 1. Create a trigger that checks stock before sale.
-- If stock < 1, prevent sale, otherwise continue.
	1. Create trigger function, BEFORE sales INSERT
	2. Create the trigger definition	

-- 2. Create a trigger that decrement stock after successful sale

--  1. Create a trigger function, AFTER sales INSERT
-- 	2. Create the trigger definition


-- CHECK BOOK STOCK BEFORE SALE
CREATE OR REPLACE FUNCTION check_stock_before_sale()
RETURNS TRIGGER AS $$
DECLARE
    available_stock INT;
BEGIN
    -- Get the current stock for the book being sold
    SELECT stock_quantity INTO available_stock
    FROM books
    WHERE book_id = NEW.book_id;

    -- Check if there is enough stock
    IF NEW.quantity_sold > available_stock THEN
        -- Raise an exception to prevent the sale
        RAISE EXCEPTION 'Not enough stock: Cannot sell % copies when only % are available.', NEW.quantity_sold, available_stock;
    END IF;

    -- If stock is sufficient, allow the insert to proceed
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create the Trigger
CREATE TRIGGER sales_check_stock_trigger
BEFORE INSERT ON sales
FOR EACH ROW
EXECUTE FUNCTION check_stock_before_sale();

--- --------------------------------------------------------------------------------------------

-- DECREMENT BOOK QUANTITY AFTER SALE
CREATE OR REPLACE FUNCTION decrement_stock_after_sale()
RETURNS TRIGGER AS $$
BEGIN
    -- Update the stock quantity in the books table
    UPDATE books
    SET stock_quantity = stock_quantity - NEW.quantity_sold
    WHERE book_id = NEW.book_id;

    -- The return value of an AFTER trigger is ignored, but it's good practice to return something
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- Create the trigger
CREATE TRIGGER sales_decrement_stock_trigger
AFTER INSERT ON sales
FOR EACH ROW
EXECUTE FUNCTION decrement_stock_after_sale();

--- ----------------------------------------------------------------------------

-- TESTING


INSERT INTO sales (book_id, quantity_sold) VALUES (1, 2);

-- Check the stock
SELECT title, stock_quantity FROM books WHERE book_id = 1;
-- Expected stock_quantity: 3

-- Unsuccessful Sale
-- Attempt to sell 3 copies of "Dune" (book_id 3), which only has 2 in stock.
-- This should fail and raise an exception
INSERT INTO sales (book_id, quantity_sold) VALUES (3, 3);

-- Check that the stock was not changed
SELECT title, stock_quantity FROM books WHERE book_id = 3;
-- Expected stock_quantity: 2

-- Attempt to sell the last 2 copies of "Dune".
INSERT INTO sales (book_id, quantity_sold) VALUES (3, 2);

-- Check the stock
SELECT title, stock_quantity FROM books WHERE book_id = 3;
-- Expected stock_quantity: 0
