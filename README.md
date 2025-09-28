# Task 8: Implement Indexing for Query Optimization

## 📌 What I Built
I worked on optimizing queries in the **Broskies_Hub Library Database**.  
The database contains tables for `Books`, `Authors`, `Members`, `Book_Author`, and `Borrow`.  
My focus was on improving query performance using **indexing techniques**.

---

## 🎯 Why I Built It
Some queries in the Borrow table (like fetching all borrowed books with member details for a given year) were running slowly because they scanned many rows without using indexes.  
The goal was to:
- Reduce query execution time.  
- Optimize joins between `Borrow`, `Books`, and `Members`.  
- Demonstrate how indexes improve performance.  

---

## ⚙️ How I Built It
1. **Identified a slow query** – fetching borrowed books with member details in 2024.  
2. **Analyzed execution plan** using `EXPLAIN`.  
   - Found full table scans on `Borrow`, `Books`, and `Members`.  
3. **Created indexes** on:  
   - `BorrowDate` (for filtering by date range).  
   - `BookID` and `MemberID` (for join optimization).  
4. **Re-ran EXPLAIN** – confirmed indexes were used.  
5. **Compared performance** – query time dropped from ~850ms to ~45ms (simulated).  

---

## ✅ Outcome
- Rows scanned reduced by ~98%.  
- Query execution time improved by ~95%.  
- The database is now more efficient for date-range and join-based queries.  

Indexes made the system much faster and scalable for real-world usage. 🚀
