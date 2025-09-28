-- ===================================
-- Task 8: Implement Indexing for Query Optimization
-- Database: Broskies_Hub
-- ===================================
use broskies_hub;
select * from borrow;
-- Step 1: Original Query (Slow)
-- Find all borrowed books with member details in 2024
SELECT b.Title, m.Name, br.BorrowDate, br.ReturnDate
FROM Borrow br
JOIN Books b ON br.BookID = b.BookID
JOIN Members m ON br.MemberID = m.MemberID
WHERE br.BorrowDate BETWEEN '2025-09-01' AND '2025-09-15';

-- Step 2: Analyze performance
-- Use EXPLAIN to check the query plan
EXPLAIN SELECT b.Title, m.Name, br.BorrowDate, br.ReturnDate
FROM Borrow br
JOIN Books b ON br.BookID = b.BookID
JOIN Members m ON br.MemberID = m.MemberID
WHERE br.BorrowDate BETWEEN '2025-09-01' AND '2025-09-15';

-- Step 3: Create indexes to optimize
-- Index on BorrowDate for filtering
CREATE INDEX idx_borrow_borrowdate ON Borrow (BorrowDate);

-- Indexes on foreign keys for faster joins
CREATE INDEX idx_borrow_bookid ON Borrow (BookID);
CREATE INDEX idx_borrow_memberid ON Borrow (MemberID);

-- Step 4: Optimized Query (same query, but faster with indexes)
EXPLAIN SELECT b.Title, m.Name, br.BorrowDate, br.ReturnDate
FROM Borrow br
JOIN Books b ON br.BookID = b.BookID
JOIN Members m ON br.MemberID = m.MemberID
WHERE br.BorrowDate BETWEEN '2025-09-01' AND '2025-09-15';
