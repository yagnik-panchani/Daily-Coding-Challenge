# Day 56 - Queueable Apex VIP Customer Upgrade

## 📌 Scenario

Build a Queueable Apex solution that automatically upgrades an Account to **VIP** when a high-value Opportunity is successfully closed.

Whenever an Opportunity is updated, if the Stage changes to **Closed Won** and the Amount is greater than or equal to **1,000,000**, Salesforce should process the Account update asynchronously using Queueable Apex.

Instead of updating the Account directly inside the Trigger, the Trigger should enqueue a Queueable Apex job.

---

## 🚀 Business Requirements

When an Opportunity is updated:

- StageName changes to Closed Won
- Amount >= 1,000,000

Then:

- Collect Account Ids
- Start a Queueable Apex job
- Query related Accounts
- Update:

```
Customer_Type__c = 'VIP'
```

---

## 🔗 Objects Used

### Opportunity

Fields Used:

- StageName
- Amount
- AccountId

### Account

Fields Used:

- Customer_Type__c

---

## 🚀 What This Application Does

✅ Detects high-value Closed Won Opportunities

✅ Uses Trigger Handler Pattern

✅ Starts Queueable Apex asynchronously

✅ Updates related Account records

✅ Upgrades Customer Type to VIP

✅ Processes multiple records using bulk-safe logic

---

## 🧠 Technical Concepts Used

- Apex Trigger
- Trigger Handler Pattern
- Queueable Apex
- Queueable Interface
- QueueableContext
- Constructor
- System.enqueueJob()
- Parent Record Update
- SOQL
- Bulk Processing
- DML Update

---

## 💡 Business Use Case

Many companies classify customers based on the value of their completed deals.

When a customer closes a high-value Opportunity, Salesforce automatically upgrades the related Account to **VIP**.

This automation eliminates manual updates and ensures customer classifications remain accurate.

---

## 🔥 Key Learning Outcome

Through this challenge, I learned:

- How Trigger and Queueable Apex work together
- How to pass Account Ids using a Queueable constructor
- How to update parent records asynchronously
- How to process Account records in Queueable Apex
- How to implement business logic using Opportunity data
- How to build scalable Salesforce automation

---

## 🚀 Salesforce Concepts Practiced

✔ Trigger Handler Pattern

✔ Queueable Apex

✔ Queueable Interface

✔ QueueableContext

✔ Constructor

✔ System.enqueueJob()

✔ Parent Record Update

✔ SOQL

✔ Bulk Processing

✔ DML Operations

---

## 🔄 Application Flow

Opportunity Updated

↓

Trigger

↓

Handler

↓

Check Conditions

- Stage Changed to Closed Won
- Amount >= 1,000,000

↓

Collect Account Ids

↓

System.enqueueJob()

↓

Queueable Constructor

↓

execute()

↓

Query Accounts

↓

Customer_Type__c = 'VIP'

↓

Update Accounts

---

## 📋 Example

### Before

### Opportunity

| Opportunity | Stage | Amount |
|------------|-------|---------|
| Enterprise CRM Deal | Prospecting | ₹1,500,000 |

### Account

| Account | Customer Type |
|---------|---------------|
| ABC Technologies | Regular |

---

### User Updates

```
Stage = Closed Won
```

---

### After Queueable Execution

| Account | Customer Type |
|---------|---------------|
| ABC Technologies | VIP |

---

## ⭐ Why Queueable Apex?

Queueable Apex allows Salesforce to process Account updates asynchronously after the Opportunity is updated.

This keeps the Trigger lightweight, improves scalability, and reduces the risk of governor limit exceptions.

---

## 🎯 Interview Questions Practiced

### Why use Queueable Apex instead of updating the Account directly in the Trigger?

Queueable Apex processes the Account updates asynchronously, keeping the Trigger lightweight and improving application performance.

---

### Why pass Account Ids instead of Opportunity Ids?

The business requirement is to update the Account record. Passing Account Ids allows the Queueable class to directly query and update the required parent records.

---

### Why compare Trigger.new with Trigger.oldMap?

This ensures the Queueable job runs only when the Opportunity Stage actually changes to **Closed Won**, preventing unnecessary processing.

---

### Why use a Trigger Handler Pattern?

The Trigger Handler Pattern separates business logic from the Trigger, making the application easier to maintain, test, and extend.

---

## ⭐ Daily Salesforce Async Apex Journey

Building enterprise-level Salesforce solutions by mastering Queueable Apex and implementing real-world customer automation scenarios. 🚀
