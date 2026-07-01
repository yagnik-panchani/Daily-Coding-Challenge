# Day 51 - Scheduled Apex Opportunity Follow-Up Task

## 📌 Scenario

Build a Scheduled Apex job that automatically creates follow-up Tasks for Opportunities that are still in the **Prospecting** stage.

Instead of waiting for a user to perform an action, Salesforce should execute this process automatically every day at **9:00 AM**.

This demonstrates how Scheduled Apex is used to automate recurring business processes.

---

## 🚀 Business Requirements

Every day at **9:00 AM**:

* Find all Opportunities where:

  * StageName = Prospecting

For every Opportunity:

* Create a Task with:

  * Subject = Follow Up Prospect
  * Priority = Normal
  * Status = Not Started
  * Owner = Opportunity Owner
  * Related Record = Opportunity

---

## 🔗 Objects Used

### Opportunity

Fields Used:

* Id
* StageName
* OwnerId

### Task

Fields Used:

* Subject
* Priority
* Status
* OwnerId
* WhatId

---

## 🚀 What This Application Does

✅ Executes automatically on a schedule

✅ Queries Opportunities in the Prospecting stage

✅ Creates follow-up Tasks

✅ Assigns the Task to the Opportunity Owner

✅ Links each Task to its related Opportunity

✅ Demonstrates Scheduled Apex automation

---

## 🧠 Technical Concepts Used

* Scheduled Apex
* Schedulable Interface
* execute(SchedulableContext)
* System.schedule()
* CRON Expression
* SOQL
* Bulk Processing
* DML Operations

---

## 💡 Business Use Case

Sales representatives often forget to follow up with potential customers.

To improve sales efficiency, Salesforce automatically creates daily follow-up Tasks for all Opportunities that are still in the Prospecting stage.

This ensures that no potential customer is overlooked.

---

## 🔥 Key Learning Outcome

Through this challenge, I learned:

* How Scheduled Apex works
* How to implement the Schedulable interface
* How execute() is triggered automatically
* How to schedule Apex jobs using System.schedule()
* How to automate recurring business processes
* How to create related Tasks using Scheduled Apex

---

## 🚀 Salesforce Concepts Practiced

✔ Scheduled Apex

✔ Schedulable Interface

✔ execute()

✔ System.schedule()

✔ CRON Expression

✔ SOQL

✔ Task Creation

✔ Bulk Processing

✔ DML Operations

---

## 🔄 Application Flow

System.schedule()

↓

Salesforce Scheduler

↓

execute()

↓

Query Prospecting Opportunities

↓

Create Follow-Up Tasks

↓

Assign Owner

↓

Link Task to Opportunity

↓

Insert Tasks

---

## 📋 Example

### Before Scheduled Job

| Opportunity        | Stage       |
| ------------------ | ----------- |
| ABC Software Deal  | Prospecting |
| XYZ CRM Project    | Negotiation |
| PQR Implementation | Prospecting |

---

### Scheduled Job Executes

Tasks Created:

| Subject            | Owner             | Related To         |
| ------------------ | ----------------- | ------------------ |
| Follow Up Prospect | Opportunity Owner | ABC Software Deal  |
| Follow Up Prospect | Opportunity Owner | PQR Implementation |

---

## ⭐ Why Scheduled Apex?

Scheduled Apex is used when a business process must run automatically at a specific date or time without user intervention.

Common examples include:

* Daily Follow-Up Tasks
* Nightly Data Cleanup
* Weekly Reports
* Monthly Billing
* Scheduled Batch Jobs
* Record Maintenance

---

## 🎯 Interview Questions Practiced

### What is Scheduled Apex?

Scheduled Apex allows developers to execute Apex code automatically at a specified time using a CRON schedule.

---

### What interface is required?

The **Schedulable** interface.

---

### Which method must be implemented?

```java
public void execute(SchedulableContext sc)
```

---

### How do you schedule a job?

Using:

```java
System.schedule(jobName, cronExpression, schedulableClass);
```

---

### What is a CRON Expression?

A CRON expression defines the date and time when a Scheduled Apex job should execute.

Example:

```text
0 0 9 * * ?
```

This runs the job every day at **9:00 AM**.

---

## ⭐ Daily Salesforce Async Apex Journey

Learning enterprise-level Salesforce automation by mastering Scheduled Apex and building real-world business solutions one challenge at a time. 🚀
