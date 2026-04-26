USE b2b_project;

-- =================================================================
-- QUERY 1: THE B2B TARGET DEMOGRAPHIC
-- Question: What are the most common types of businesses in our database?
-- =================================================================
SELECT 
    APPLICATION AS Store_Type, 
    COUNT(*) AS Total_Stores
FROM stores
GROUP BY APPLICATION
ORDER BY Total_Stores DESC
LIMIT 10;


-- =================================================================
-- QUERY 2: THE TRANSPORTATION HUBS
-- Question: Which neighborhoods have the highest density of transport vehicles?
-- =================================================================
SELECT 
    LOCATION, 
    COUNT(*) AS Total_Vehicles
FROM vehicles
GROUP BY LOCATION
ORDER BY Total_Vehicles DESC
LIMIT 5;


-- =================================================================
-- QUERY 3: FLEET MODERNIZATION TARGETS
-- Question: Are these vehicles old or new? (Crucial for EV Sales Teams)
-- =================================================================
SELECT 
    CASE 
        WHEN `MANUFACTURE DATE` < 2015 THEN 'Old Fleet (Pre-2015) - High Target'
        WHEN `MANUFACTURE DATE` BETWEEN 2015 AND 2020 THEN 'Mid-Age Fleet (2015-2020)'
        ELSE 'New Fleet (Post-2020) - Low Target'
    END AS Fleet_Condition,
    COUNT(*) AS Total_Vehicles
FROM vehicles
GROUP BY Fleet_Condition
ORDER BY Total_Vehicles DESC;


-- =================================================================
-- QUERY 4: THE "MEGA-HUB" SYNERGY (USING CTEs and JOINs)
-- Question: Which neighborhoods are our absolute best markets, having BOTH high store density AND high transport vehicle density?
-- Skill showcased to employers: Common Table Expressions (WITH clauses) and JOINs
-- =================================================================
WITH StoreDensity AS (
    SELECT LOCATION, COUNT(*) as Store_Count
    FROM stores
    GROUP BY LOCATION
),
VehicleDensity AS (
    SELECT LOCATION, COUNT(*) as Vehicle_Count
    FROM vehicles
    GROUP BY LOCATION
)
SELECT 
    s.LOCATION,
    s.Store_Count,
    v.Vehicle_Count,
    (s.Store_Count + v.Vehicle_Count) AS Total_B2B_Leads
FROM StoreDensity s
JOIN VehicleDensity v ON s.LOCATION = v.LOCATION
ORDER BY Total_B2B_Leads DESC
LIMIT 5;


-- =================================================================
-- QUERY 5: THE HYPER-TARGETED SALES LIST
-- Question: The EV Sales team wants to call owners of old 'Bajaj RE' autos specifically in the Peenya and Yeshwanthpur industrial hubs. Give us the exact call list.
-- Skill showcased to employers: Multi-condition filtering and practical business application
-- =================================================================
SELECT 
    NAME AS Contact_Person,
    PHONENUMBER AS Contact_Number,
    LOCATION,
    MODEL,
    `MANUFACTURE DATE` AS Vehicle_Year
FROM vehicles
WHERE MODEL = 'Bajaj RE' 
  AND `MANUFACTURE DATE` <= 2015
  AND LOCATION IN ('Peenya', 'Yeshwanthpur')
ORDER BY Vehicle_Year ASC;