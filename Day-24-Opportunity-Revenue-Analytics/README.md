# Day 24 - Opportunity Revenue Analytics

## 📌 Scenario

Whenever an Opportunity is updated to **Closed Won**, the system should automatically analyze the sales performance of the related Account.

The automation calculates:

* Total Revenue generated from all Closed Won Opportunities
* Largest Deal amount won by the Account
* Strategic Customer identification based on revenue

If an Account becomes a high-value customer, the system automatically creates a follow-up Task for the Account Owner.

---

## 🔗 Object Relationship

Account → Parent Object

Opportunity → Child Object

Task → Activity Object

---

## 🚀 Business Requirements

When an Opportunity becomes **Closed Won**:

### Step 1

Calculate the total revenue generated from all Closed Won Opportunities related to the Account.

Update:

* Total_Revenue__c

### Step 2

Find the largest Closed Won Opportunity amount for that Account.

Update:

* Largest_Deal__c

### Step 3

If total revenue exceeds:

1,000,000

Create a Task:

* Subject = Strategic Customer Review
* Priority = High
* Status = Not Started

for the Account Owner.

---

## 🚀 What This Automation Does

✅ Tracks Account revenue automatically

✅ Calculates largest deal value dynamically

✅ Identifies strategic customers

✅ Creates executive review tasks

✅ Demonstrates business analytics automation

✅ Simulates real-world sales reporting workflows

---

## 🧠 Technical Concepts Used

* Apex Trigger
* Trigger.oldMap
* Aggregate SOQL
* AggregateResult
* SUM()
* MAX()
* GROUP BY
* Cross Object Updates
* Task Automation
* Bulkified Apex Logic

---

## 💡 Business Use Case

Sales leaders often need visibility into:

* Total customer revenue
* Largest deals won
* Strategic customer accounts
* High-value customer management

Instead of manually generating reports, Salesforce can automatically maintain these business metrics whenever opportunities are won.

This improves:

* Revenue tracking
* Executive reporting
* Customer segmentation
* Sales performance monitoring

---

## 🔥 Key Learning Outcome

Through this challenge, I learned:

* How AggregateResult works in Apex
* How to use SUM() and MAX() in SOQL
* How to group records using GROUP BY
* How to calculate business metrics dynamically
* How to update parent records using aggregate data
* How to automate strategic customer workflows

---

## 🚀 Salesforce Concepts Practiced

✔ Aggregate SOQL

✔ SUM()

✔ MAX()

✔ GROUP BY

✔ AggregateResult

✔ Trigger.oldMap

✔ Parent Child Relationships

✔ Task Automation

✔ Cross Object DML

✔ Bulkification Best Practices

---

## ⭐ Why This Scenario Is Important

Most beginner Apex challenges focus on simple record updates.

This challenge introduces a completely different skill:

Business Analytics.

Instead of simply updating records, the system analyzes sales performance and generates business insights automatically.

This type of logic is frequently used in:

* Executive Dashboards
* Revenue Reporting
* Strategic Customer Programs
* Enterprise Salesforce Implementations

---

⭐ Daily Salesforce Apex Practice Journey

Building real-world CRM automation scenarios step by step 🚀
