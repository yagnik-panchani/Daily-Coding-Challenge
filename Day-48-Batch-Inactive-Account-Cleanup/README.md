# Day 48 - Batch Apex Inactive Account Cleanup

## 📌 Scenario

Build a Batch Apex job to process a large number of inactive Account records.

The company wants to archive inactive Accounts every month. Since there may be thousands of Account records, processing them in a single transaction could exceed Salesforce governor limits.

To solve this problem, Batch Apex is used.

---

## 🚀 Business Requirements

Find all Accounts where:

* Status__c = Inactive

For each Account:

* Update the Description field with:

```
Archived on Today's Date
```

The records should be processed in batches rather than all at once.

---

## 🔗 Object Used

### Account

Fields Used:

* Status__c
* Description

---

## 🚀 What This Application Does

✅ Retrieves all inactive Accounts

✅ Processes records using Batch Apex

✅ Updates the Description field

✅ Handles large data volumes efficiently

✅ Uses Salesforce asynchronous processing

---

## 🧠 Technical Concepts Used

* Batch Apex
* Database.Batchable<SObject>
* Database.QueryLocator
* start()
* execute()
* finish()
* SOQL
* Bulk Processing
* DML Operations

---

## 💡 Business Use Case

Many organizations archive inactive customer accounts periodically.

Instead of manually updating thousands of records, Salesforce automatically processes them in the background using Batch Apex.

Examples:

* Archive inactive customers
* Update old records
* Data cleanup
* Monthly maintenance jobs

---

## 🔥 Key Learning Outcome

Through this challenge, I learned:

* How Batch Apex works
* The purpose of start(), execute(), and finish()
* How Database.QueryLocator retrieves large data sets
* How Salesforce automatically processes records in batches
* How to update records efficiently using Batch Apex

---

## 🚀 Salesforce Concepts Practiced

✔ Batch Apex

✔ Database.Batchable Interface

✔ Database.QueryLocator

✔ start()

✔ execute()

✔ finish()

✔ Bulk Processing

✔ SOQL

✔ DML

---

## 🔄 Batch Apex Flow

Start Batch Job

↓

start()

↓

Query Inactive Accounts

↓

Salesforce Splits Records into Batches

↓

execute()

↓

Update Description Field

↓

Repeat Until All Records Are Processed

↓

finish()

↓

Batch Job Completed

---

## 📋 Example

### Before

| Account | Status   | Description      |
| ------- | -------- | ---------------- |
| ABC Ltd | Inactive | *(blank)*        |
| XYZ Pvt | Active   | Premium Customer |
| PQR Inc | Inactive | *(blank)*        |

---

### After Batch Execution

| Account | Status   | Description            |
| ------- | -------- | ---------------------- |
| ABC Ltd | Inactive | Archived on 2026-06-28 |
| XYZ Pvt | Active   | Premium Customer       |
| PQR Inc | Inactive | Archived on 2026-06-28 |

---

## ⭐ Why Batch Apex?

Batch Apex is designed for processing very large numbers of records without exceeding Salesforce governor limits.

Instead of processing every record in one transaction, Salesforce automatically divides the work into smaller batches, making the process more scalable and reliable.

---

## 🎯 Interview Questions Practiced

### What is Batch Apex?

Batch Apex is an asynchronous processing framework that allows developers to process large volumes of records in manageable batches.

---

### What is the purpose of start()?

The start() method identifies which records should be processed.

---

### What is the purpose of execute()?

The execute() method contains the business logic that runs for each batch of records.

---

### What is the purpose of finish()?

The finish() method executes once after all batches have been processed and is commonly used for logging, notifications, or starting another process.

---

### Why use Database.QueryLocator?

Database.QueryLocator allows Batch Apex to process very large data sets efficiently, beyond the limits of a normal SOQL query.

---

## ⭐ Daily Salesforce Async Apex Journey

Building scalable Salesforce solutions by mastering Batch Apex and enterprise-level asynchronous processing one challenge at a time. 🚀
