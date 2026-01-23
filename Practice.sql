-- -------------------------
-- Create table: events
-- -------------------------
CREATE TABLE events (
  event_id   INT PRIMARY KEY,
  event_name VARCHAR(100) NOT NULL,
  city       VARCHAR(50)  NOT NULL
);

-- -------------------------
-- Create table: ticket_sales
-- -------------------------
CREATE TABLE ticket_sales (
  sale_id          INT PRIMARY KEY,
  event_id         INT NOT NULL,
  sale_date        DATE NOT NULL,
  ticket_type      VARCHAR(20) NOT NULL,
  qty              INT NOT NULL,
  price_per_ticket INT NOT NULL,
  CONSTRAINT fk_ticket_sales_event
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- -------------------------
-- Insert data: events
-- -------------------------
INSERT INTO events (event_id, event_name, city) VALUES
(1, 'Music Fest', 'Mumbai'),
(2, 'Tech Summit', 'Bengaluru'),
(3, 'Food Carnival', 'Delhi'),
(4, 'Startup Meetup', 'Mumbai');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                

-- -------------------------
-- Insert data: ticket_sales
-- -------------------------
INSERT INTO ticket_sales (sale_id, event_id, sale_date, ticket_type, qty, price_per_ticket) VALUES
(101, 1, '2025-01-05', 'Regular', 2, 1500),
(102, 1, '2025-01-10', 'VIP',     1, 5000),
(103, 2, '2025-02-03', 'Regular', 3, 2000),
(104, 2, '2025-02-10', 'VIP',     1, 6000),
(105, 3, '2025-03-01', 'Regular', 5,  800),
(106, 3, '2025-03-15', 'VIP',     2, 2500),
(107, 4, '2025-01-20', 'Regular', 4, 1200),
(108, 4, '2025-02-05', 'Regular', 1, 1200);

-- Quick check
SELECT * FROM events ORDER BY event_id;
SELECT * FROM ticket_sales ORDER BY sale_id;


select sum(qty),event_id from ticket_sales group by(event_id);

select sum(price_per_ticket * qty) , event_id from ticket_sales group by(event_id);


select sum(price_per_ticket * qty) , month(sale_date) from ticket_sales group by month(sale_date);
-- =========================================================================================================================
-- Q) Find the maximum price_per_ticket per event_id

select max(price_per_ticket) , event_id from ticket_sales group by(event_id);

-- =========================================================================================================================
-- Q) Find total revenue per month and ticket_type



-- =========================================================================================================================
-- Q) List all sales with event_name and sale_date

select sale_id , e.event_name , t.sale_date  from events as e join ticket_sales as t where e.event_id = t.event_id; 

-- ========================================================================================================================

-- Q) Show event_name, ticket_type, qty for each sale.

select  e.event_name , t.ticket_type , t.qty 
from events as e join ticket_sales as t
where  e.event_id = t.event_id ;


-- ========================================================================================================================

-- Q) Show sales where the event city is Mumbai

select t.sale_id, e.event_name , e.city , t.sale_date 
from events as e join ticket_sales as t
where  e.event_id = t.event_id and e.city in ('mumbai');

-- =======================================================================================================================

-- Q) Show all events and matching sales 
select  e.event_name , t.sale_id, t.sale_date 
from events as e join ticket_sales as t
where  e.event_id = t.event_id;

-- =======================================================================================================================

-- Q) Show distinct event names that have at least one sale. 
select distinct e.event_name
from events as e join ticket_sales as t
 where  e.event_id = t.event_id;
 
 
 -- =======================================================================================================================
 
 -- Q) Show each sale’s computed revenue with event name 
 select  e.event_name , t.sale_id, t.price_per_ticket * t.qty As revenue
from events as e join ticket_sales as t
where  e.event_id = t.event_id;

-- =========================================================================================================================

-- Q) Find total quantity per event_name.                        ( event_name  ||  total_qty)
select  e.event_name , sum(t.qty)
from events as e join ticket_sales as t
where  e.event_id = t.event_id group by e.event_name ;


-- =============================================================================================================================


