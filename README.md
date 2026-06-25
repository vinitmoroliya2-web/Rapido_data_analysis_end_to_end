# 📊 Rapido Urban Mobility Analysis (End-to-End Data Analytics)

An end-to-end data analytics project focused on diagnosing operational ride friction, marketplace cancellations, vehicle efficiency, and revenue distribution channels for a transactional ride-hailing dataset of **39.15K entries** across Bengaluru.

This project showcases a complete business intelligence pipeline: engineering relational schema constraints and logic tiers inside **MySQL Workbench**, and delivering dynamic, high-impact tracking visuals via **Power BI Desktop**.

---

## 🛠️ Tech Stack & Skills Demonstrated

* **Database Management & Processing Engine:** MySQL Workbench
* **Business Intelligence & Dashboard Engineering:** Power BI Desktop
* **Advanced SQL Operations:** Database View Architecture, Sub-Queries, Custom Value Groupings, Numerical Aggregations, String-Matching Filters, Volume Auditing.
* **Core Analytics Competencies:** Data Pipeline Structuring, Marketplace Attrition Profiling, Fleet Unit Economics, Strategic Business Forecasting, KPI Design.

---

## 🚀 Interactive Dashboard Layouts

*Below are the core strategic insights surfaced from the five primary dashboard view frames constructed within Power BI:*

### 1. Overall Performance View

* **Total Booking Attempts ($N$):** 39.15K instances.
* **Platform Booking Value Gross:** ₹13M.
* **Market Fulfillment Rate (Success):** 62.16% (~24.33K journeys successfully completed).
* **System Churn Metric:** 37.84% drop-off rate (14.81K unfulfilled requests).
  <img width="1080" height="617" alt="Screenshot 2026-06-26 031230" src="https://github.com/user-attachments/assets/3db9cfc3-0c3a-4e0f-96b5-072dffcf5f32" />


### 2. Vehicle Class Performance View

Exposes a hidden unit-economics discovery: **The Auto Efficiency Paradox**. Auto segments pull in gross revenues on par with full-sized Sedans and SUVs (~₹3.04M) while running **less than half the wear-and-tear distance** (34.85K km vs. ~89K km). This marks a highly profitable, low-overhead operations cluster.
<img width="1086" height="608" alt="Screenshot 2026-06-26 031256" src="https://github.com/user-attachments/assets/34a8fd97-366c-47df-9730-2ad234b03aab" />


### 3. Revenue & Channel Insights View

* **Payment Mix:** Cash commands the absolute highest volume of booking values, directly followed by UPI gateways. Digital plastic options (Credit/Debit) sit at negligible margins.
* **VIP Segments:** Identifies high-velocity power users who drive consistent monthly recurring booking value.
<img width="1092" height="631" alt="Screenshot 2026-06-26 031318" src="https://github.com/user-attachments/assets/0c10a246-edec-45d7-b4e1-bca21f57022c" />



### 4. Marketplace Cancellation Deep-Dive View

Isolates systemic friction occurring immediately pre-trip (overall cancellation rate sitting at **10.73%**):

* **Driver Drops:** Dominated by personal car breakdowns/maintenance downtime (34.42%) and rider mismatch coordinates (29.55%).
* **Customer Drops:** Primarily triggered by drivers actively refusing to move toward pins (29.99%) or asking riders to drop the trip manually to pass platform fines (25.96%).
<img width="1075" height="602" alt="Screenshot 2026-06-26 031344" src="https://github.com/user-attachments/assets/78ded105-23a7-4717-b6f8-92eb21102927" />


### 5. Quality Assurance View

Both driver and customer feedback streams scale uniformly across all 7 separate service classes, grouping heavily around a stable **3.98 to 4.02-star band**. This mathematically confirms that inner-city fulfillment is highly satisfying once active; platform friction exists purely within dispatch and pickup cycles.
<img width="1100" height="612" alt="Screenshot 2026-06-26 031405" src="https://github.com/user-attachments/assets/06fb99a1-b4d6-4b89-8b75-127017d0f221" />


---

## 📑 Analytical Framework: How SQL Was Used

To ensure efficient modeling, heavy data mutations, validation steps, and logical aggregations were computed directly at the database level using optimized **MySQL queries**, bypassing heavy runtime lag inside Power BI.

```sql
CREATE DATABASE Rapido;
USE Rapido;

-- 1. Base Volume Verification
SELECT COUNT(*) FROM bookings;

-- 2. Performance Tracking Layer
CREATE VIEW Successful_Booking AS 
SELECT * FROM bookings WHERE Booking_Status = "Success";

-- 3. Operations & Mileage Metrics
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_type, AVG(Ride_Distance) AS Average_distance 
FROM bookings GROUP BY Vehicle_type;

-- 4. Customer Churn Monitoring
SELECT COUNT(*) FROM bookings WHERE Booking_Status = 'Canceled by Customer';

-- 5. VIP Customer Tier Segmenting (Top 5 Accounts)
CREATE VIEW top_5_customers AS 
SELECT Customer_ID, COUNT(Booking_ID) AS total_booking
FROM bookings GROUP BY Customer_ID ORDER BY total_booking DESC LIMIT 5;

-- 6. Infrastructure & Mechanical Failure Tracking
SELECT COUNT(*) FROM bookings WHERE canceled_Rides_by_Driver = 'Personal & Car related issue';

-- 7. Premium Segment Quality Audits
CREATE VIEW Max_Min_Driver_Rating AS
SELECT MAX(Driver_Ratings) AS max_rating, MIN(Driver_Ratings) AS min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

-- 8. Gateway Revenue Tracing (UPI Channels)
CREATE VIEW UPI_Payment AS
SELECT * FROM bookings WHERE Payment_Method = 'UPI';

-- 9. Category Experience Auditing
CREATE VIEW AVG_Cust_Rating AS
SELECT Vehicle_Type, AVG(Customer_Rating) AS avg_customer_rating
FROM bookings GROUP BY Vehicle_Type;

-- 10. Financial Capital Realization
CREATE VIEW total_successful_ride_value AS
SELECT SUM(Booking_Value) AS total_succesful_ride_value
FROM bookings WHERE Booking_Status = 'Success';

-- 11. Mid-Trip Attrition Analytics
CREATE VIEW Incomplete_Rides_Reason AS
SELECT Booking_ID, Incomplete_Rides_Reason FROM bookings WHERE Incomplete_Rides = 'Yes';

```

---

## 💡 Data-Driven Strategic Recommendations

* **Automate Deflective Re-Routing:** Over 55% of customer dropouts stem from stationary drivers or cancellation forcing. Implement GPS tracking logic: if a driver doesn't move toward a pin within 3 minutes, automatically shift the ride to another operator without customer penalties.
* **Scale High-Margin Auto Assets:** Because Autos yield matching revenues to Sedans over half the travel distance, allocate localized onboarding incentives to expand the Auto fleet in dense commercial areas.
* **Incentivize UPI Payments:** Cash dependency slows down transaction flow and leads to settlement friction. Run small wallet-backed wallet promotions on UPI options to safely secure digital escrow balances.
* **Establish VIP Priority Matching:** Build dedicated high-priority tracking rules for the platform's top spenders (isolated via the `top_5_customers` view). Ensure zero driver cancellation penalties apply to these transactions to safeguard premium recurring business.

---

## 📂 Repository Structure

```text
├── Data_Sources/               # Raw transaction files (.pdf / .csv parsed inputs)
├── SQL_Scripts/                # Production code for view building and validation
├── BI_Dashboards/              # Complete Power BI files (.pbix) containing all 5 views
└── README.md                   # Portfolio summary and operational report

```
