# Day 52 - Scheduled Apex Calling Batch Apex

## 📌 Scenario

Build an enterprise-level automation where a Scheduled Apex job automatically starts a Batch Apex job every night.

The organization wants to archive inactive Contact records daily at **2:00 AM** without any manual intervention.

Since there may be thousands of Contact records, the Scheduled Apex class should **not process the records directly**. Instead, it should launch a Batch Apex job to handle the large data volume.

---

## 🚀 Business Requirements

Every day at **2:00 AM**:

* Scheduled Apex executes automatically.
* Scheduled Apex starts a Batch Apex job.
* Batch Apex queries all inactive Contacts.
* Batch Apex updates the Description field.

Update:

```text
Description = 'Archived by nightly cleanup'
```

---

## 🔗 Objects Used

### Contact

Fields Used:

* Active__c (Checkbox)
* Description (Long Text Area)

---

## 🚀 What This Application Does

✅ Executes automatically every night

✅ Uses Scheduled Apex for scheduling

✅ Calls Batch Apex using `Database.executeBatch()`

✅ Processes inactive Contact records

✅ Updates the Description field

✅ Demonstrates enterprise-level asynchronous processing

---

## 🧠 Technical Concepts Used

### Scheduled Apex

* Schedulable Interface
* execute(SchedulableContext)
* System.schedule()
* CRON Expression

### Batch Apex

* Database.Batchable<Contact>
* Database.QueryLocator
* start()
* execute()
* finish()
* Bulk Processing

### Integration Between Both

* Database.executeBatch()
* Calling Batch Apex from Scheduled Apex

---

## 💡 Business Use Case

Many companies schedule maintenance jobs to run automatically during off-business hours.

Examples include:

* Nightly Data Cleanup
* Archive Inactive Customers
* Monthly Billing
* Membership Expiration
* Loyalty Score Calculation
* Report Generation

Instead of requiring an administrator to start these jobs manually, Salesforce automatically schedules them.

---

## 🔥 Key Learning Outcome

Through this challenge, I learned:

* How Scheduled Apex works
* How Batch Apex works
* How Scheduled Apex starts a Batch Apex job
* How to use `Database.executeBatch()`
* How Salesforce automates recurring background jobs
* How to process large amounts of data efficiently

---

## 🚀 Salesforce Concepts Practiced

✔ Scheduled Apex

✔ Batch Apex

✔ Database.executeBatch()

✔ System.schedule()

✔ CRON Expressions

✔ Database.QueryLocator

✔ Bulk Processing

✔ SOQL

✔ DML Operations

---

## 🔄 Application Flow

Administrator Schedules Job

↓

System.schedule()

↓

Scheduled Apex Executes

↓

Database.executeBatch()

↓

Batch Apex Starts

↓

start()

↓

Query Inactive Contacts

↓

Salesforce Splits Records into Batches

↓

execute()

↓

Update Description

↓

finish()

↓

Batch Job Completed

---

## 📋 Example

### Before Execution

| Contact | Active | Description      |
| ------- | ------ | ---------------- |
| Rahul   | False  | *(blank)*        |
| Amit    | True   | Premium Customer |
| Neha    | False  | *(blank)*        |

---

### After Scheduled Batch Execution

| Contact | Active | Description                 |
| ------- | ------ | --------------------------- |
| Rahul   | False  | Archived by nightly cleanup |
| Amit    | True   | Premium Customer            |
| Neha    | False  | Archived by nightly cleanup |

---

## ⭐ Why Combine Scheduled Apex and Batch Apex?

Scheduled Apex is responsible for deciding **when** a process should run.

Batch Apex is responsible for deciding **how** to process a large number of records efficiently.

Combining both technologies creates a scalable and maintainable automation solution for recurring business processes.

---

## 🎯 Interview Questions Practiced

### Why use Scheduled Apex?

Scheduled Apex is used to execute Apex code automatically at a specific date and time.

---

### Why use Batch Apex?

Batch Apex is used to process large numbers of records asynchronously without exceeding Salesforce governor limits.

---

### Why call Batch Apex from Scheduled Apex?

Scheduled Apex determines **when** the job should run, while Batch Apex efficiently processes the records.

This combination is commonly used for recurring background jobs in enterprise Salesforce applications.

---

### Which method starts the Batch Job?

```java
Database.executeBatch(new ContactCleanupBatch(), 200);
```

---

### What is the execution sequence?

```text
System.schedule()

↓

Scheduled Apex

↓

Database.executeBatch()

↓

Batch Apex

↓

start()

↓

execute()

↓

finish()
```

---

## 🌟 What I Learned Today

Today's challenge taught me one of the most common asynchronous patterns used in Salesforce.

I learned that Scheduled Apex should not process large datasets directly. Instead, it should trigger a Batch Apex job using `Database.executeBatch()`. This approach improves scalability, follows Salesforce best practices, and is widely used for recurring maintenance and cleanup tasks in enterprise applications.

---

## ⭐ Daily Salesforce Async Apex Journey

Building enterprise-level Salesforce solutions by combining Scheduled Apex and Batch Apex to automate recurring business processes efficiently. 🚀
