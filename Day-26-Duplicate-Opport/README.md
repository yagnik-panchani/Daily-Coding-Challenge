# Day 26 - Duplicate Opportunity Prevention System

## 📌 Scenario

In many organizations, sales representatives accidentally create multiple Opportunities for the same customer and product combination.

These duplicate records create inaccurate pipeline reports, forecasting issues, and confusion among sales teams.

To solve this problem, this automation prevents users from creating duplicate active Opportunities.

---

## 🚀 Business Requirement

Before creating a new Opportunity:

Check whether another active Opportunity already exists with:

* Same Account
* Same Product_Name__c

And:

* StageName ≠ Closed Lost

If a matching record is found:

Prevent the Opportunity from being saved.

Display an error message:

"An active Opportunity already exists for this Account and Product."

---

## 🔗 Object Relationship

Account → Parent Object

Opportunity → Child Object

---

## 🚀 What This Automation Does

✅ Prevents duplicate sales pipeline records

✅ Protects data quality

✅ Eliminates reporting inaccuracies

✅ Prevents multiple active Opportunities for the same product

✅ Demonstrates real-world validation logic

✅ Improves CRM data integrity

---

## 🧠 Technical Concepts Used

* Apex Trigger
* Before Insert Trigger
* addError()
* SOQL Query
* Sets
* Maps
* Composite Key Logic
* Bulkification Best Practices
* Data Validation Architecture

---

## 💡 Business Use Case

Imagine a sales representative creates:

Account: ABC Corporation

Product: Salesforce CRM

Stage: Prospecting

Later, another sales representative accidentally creates:

Account: ABC Corporation

Product: Salesforce CRM

Stage: Qualification

Now the company has two active Opportunities for the same deal.

This can cause:

* Incorrect forecasting
* Duplicate sales efforts
* Revenue reporting issues
* Customer confusion

This automation prevents those situations automatically.

---

## 🔥 Key Learning Outcome

Through this challenge, I learned:

* How duplicate prevention works in Salesforce
* How to use composite keys for validation
* How to compare multiple fields together
* How to use addError() effectively
* How to enforce business rules before record creation
* How enterprise CRM systems maintain data quality

---

## 🚀 Salesforce Concepts Practiced

✔ Before Insert Trigger

✔ addError()

✔ SOQL Queries

✔ Sets

✔ Maps

✔ Composite Key Design

✔ Data Quality Enforcement

✔ Bulkification

✔ Validation Architecture

---

## ⭐ Why This Scenario Is Important

Most beginner Apex examples focus on updating records.

This challenge focuses on something equally important:

Data Integrity.

A large percentage of real Salesforce development involves:

* Preventing duplicate data
* Enforcing business rules
* Protecting CRM quality
* Validating records before insertion

These are common requirements in enterprise Salesforce projects.

---

## 🚀 Sample Example

### Existing Opportunity

Account: ABC Corporation

Product: Salesforce CRM

Stage: Prospecting

### User Creates

Account: ABC Corporation

Product: Salesforce CRM

Stage: Qualification

❌ Record Blocked

### User Creates

Account: ABC Corporation

Product: Salesforce CPQ

Stage: Qualification

✅ Record Allowed

---

⭐ Daily Salesforce Apex Practice Journey

Building real-world CRM automation scenarios step by step 🚀
