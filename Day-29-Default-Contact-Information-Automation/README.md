# Day 29 - Default Contact Information Automation

## 📌 Scenario

Whenever a new Contact record is created, the system should automatically populate default values for important fields if the user leaves them blank.

This helps maintain data quality and ensures mandatory contact information is always available.

---

## 🚀 Business Requirement

When a Contact is inserted:

### Rule 1

If Email is blank:

Populate:

```text
notprovided@company.com
```

### Rule 2

If Phone is blank:

Populate:

```text
9999999999
```

---

## 🚀 What This Automation Does

✅ Detects missing Email values

✅ Detects missing Phone values

✅ Automatically populates default information

✅ Improves CRM data quality

✅ Eliminates incomplete Contact records

✅ Demonstrates Before Insert Trigger logic

---

## 🧠 Technical Concepts Used

* Apex Trigger
* Before Insert Trigger
* Trigger.new
* Null Checking
* Field Population
* Bulkified Apex Logic

---

## 💡 Business Use Case

In real-world CRM systems, users frequently create records with incomplete information.

Missing contact details can lead to:

* Communication issues
* Reporting inaccuracies
* Poor data quality

This automation ensures every Contact record contains minimum required information.

---

## 🔥 Key Learning Outcome

Through this challenge, I learned:

* How Before Triggers work
* How to update records without DML
* How to validate and populate fields dynamically
* How to improve CRM data quality using Apex

---

## 🚀 Salesforce Concepts Practiced

✔ Before Insert Trigger

✔ Trigger.new

✔ Null Validation

✔ Dynamic Field Population

✔ Bulkification Best Practices

---

## ⭐ Why This Scenario Is Important

Although simple, this is a very common pattern in Salesforce development.

Many enterprise implementations automatically populate default values to maintain clean and consistent business data.

---

⭐ Daily Salesforce Apex Practice Journey

Building real-world CRM automation scenarios step by step 🚀
