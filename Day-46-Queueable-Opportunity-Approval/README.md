# Day 46 - Queueable Apex Opportunity Approval

## 📌 Scenario

Build an asynchronous automation using Queueable Apex.

Whenever an Opportunity is updated with a discount greater than **30%** and the Approval Status is **Pending**, Salesforce should approve the Opportunity asynchronously using Queueable Apex.

Instead of performing the update directly inside the Trigger, the records are processed in the background using a Queueable Job.

---

## 🚀 Business Requirements

When an Opportunity is updated:

* Discount__c > 30
* Approval_Status__c = Pending

Then:

* Collect Opportunity Ids.
* Enqueue a Queueable Job.
* Query the selected Opportunities.
* Update:

  * Approval_Status__c = Approved
  * Approved_Date__c = Today's Date

---

## 🔗 Object Used

### Opportunity

Fields Used:

* Discount__c
* Approval_Status__c
* Approved_Date__c
* OwnerId

---

## 🚀 What This Application Does

✅ Detects High Discount Opportunities

✅ Uses Queueable Apex for asynchronous processing

✅ Processes records in the background

✅ Updates Approval Status automatically

✅ Stores Approval Date

✅ Demonstrates enterprise-level asynchronous processing

---

## 🧠 Technical Concepts Used

* Apex Trigger
* Trigger.new
* Trigger.oldMap
* Queueable Apex
* System.enqueueJob()
* Queueable Interface
* QueueableContext
* Constructor
* SOQL
* Bulk Processing
* DML Operations

---

## 💡 Business Use Case

Large organizations often require approval for Opportunities that have significant discounts.

For example:

* A Sales Representative offers a 40% discount.
* The Opportunity enters a Pending Approval state.
* Instead of processing the approval immediately inside the Trigger, Salesforce sends the work to a Queueable Job.

This keeps the user transaction fast while processing approval logic asynchronously.

---

## 🔥 Key Learning Outcome

Through this challenge, I learned:

* How Queueable Apex works
* How to implement the Queueable interface
* How to create a Queueable class
* How constructors pass data to asynchronous jobs
* How execute() processes queued records
* How to enqueue jobs using System.enqueueJob()

---

## 🚀 Salesforce Concepts Practiced

✔ Queueable Apex

✔ Queueable Interface

✔ QueueableContext

✔ Constructor

✔ System.enqueueJob()

✔ Trigger Framework

✔ SOQL

✔ Bulk Processing

✔ Asynchronous Processing

---

## 🔄 Application Flow

Opportunity Updated

↓

Discount > 30%

↓

Approval Status = Pending

↓

Collect Opportunity Ids

↓

System.enqueueJob()

↓

Queueable Job Created

↓

Constructor Receives Ids

↓

execute() Runs

↓

Query Opportunities

↓

Update Approval Status

↓

Update Approved Date

↓

Save Records

---

## 📋 Example

### Before Update

| Opportunity | Discount | Approval Status |
| ----------- | -------- | --------------- |
| ABC Deal    | 35%      | Pending         |
| XYZ Deal    | 15%      | Pending         |
| PQR Deal    | 40%      | Pending         |

---

### Queueable Job Executes

| Opportunity | Discount | Approval Status |
| ----------- | -------- | --------------- |
| ABC Deal    | 35%      | Approved        |
| XYZ Deal    | 15%      | Pending         |
| PQR Deal    | 40%      | Approved        |

Approved Date is automatically populated with today's date.

---

## ⭐ Why Queueable Apex?

Queueable Apex is more flexible than Future Methods.

It allows developers to:

* Pass data through constructors
* Store data in instance variables
* Build more organized asynchronous logic
* Chain additional Queueable jobs
* Monitor job execution using the Job ID

Because of these advantages, Queueable Apex is the preferred asynchronous pattern for many modern Salesforce applications.

---

## 🔄 Future Method vs Queueable Apex

### Future Method

```text
Trigger

↓

@future Method

↓

Background Processing

↓

Update Records
```

---

### Queueable Apex

```text
Trigger

↓

System.enqueueJob()

↓

Queueable Class

↓

Constructor

↓

execute()

↓

Background Processing

↓

Update Records
```

---

## 🎯 Interview Questions Practiced

### What is Queueable Apex?

Queueable Apex is an asynchronous Apex framework that allows developers to execute background jobs with greater flexibility than Future Methods.

---

### Why use Queueable instead of Future Methods?

Queueable Apex provides:

* Better code organization
* Constructor support
* Instance variables
* Job chaining
* Job monitoring

---

### What is the purpose of execute()?

The execute() method contains the asynchronous business logic that Salesforce runs after the job is placed in the queue.

---

### What does System.enqueueJob() do?

It places a Queueable job into Salesforce's asynchronous job queue and returns a Job ID that can be used for monitoring.

---

## ⭐ Daily Salesforce Async Apex Journey

Learning real-world asynchronous processing one challenge at a time and building enterprise-level Salesforce solutions. 🚀
