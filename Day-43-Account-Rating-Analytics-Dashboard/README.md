# Day 43 - Account Rating Analytics Dashboard

## 📌 Scenario

Build an Account Rating Analytics Dashboard using Lightning Web Components (LWC) and the Wire Service.

The dashboard automatically retrieves Account records from Salesforce and displays key business metrics based on Account Ratings.

Instead of simply displaying records, this application analyzes the returned data and generates meaningful statistics for users.

---

## 🚀 Business Requirements

Retrieve all Account records using the @wire decorator.

Display:

* Total Accounts
* Hot Accounts
* Warm Accounts
* Cold Accounts

Calculate counts dynamically based on the Account Rating field.

---

## 🔗 Object Used

### Account

Fields Used:

* Name
* Type
* Rating

---

## 🚀 What This Application Does

✅ Retrieves Account Records Automatically

✅ Uses @wire Function

✅ Calculates Business Metrics

✅ Counts Rating Categories

✅ Displays Dashboard Analytics

✅ Updates Automatically When Data Changes

---

## 🧠 Technical Concepts Used

* Lightning Web Components
* @wire Decorator
* Wire Function
* Apex Integration
* JavaScript Loops
* Conditional Logic
* Dashboard Metrics
* Data Processing
* Reactive UI

---

## 💡 Business Use Case

Sales teams often categorize customers based on Ratings.

Examples:

* Hot Customers
* Warm Customers
* Cold Customers

Managers need quick visibility into customer distribution without manually reviewing every Account.

This dashboard provides instant analytics for decision-making.

---

## 🔥 Key Learning Outcome

Through this challenge, I learned:

* How to use a Wire Function
* How to process data returned from Apex
* How to loop through records using JavaScript
* How to calculate custom dashboard metrics
* How to display analytical information in LWC
* How to transform raw Salesforce data into business insights

---

## 🚀 Salesforce Concepts Practiced

✔ @wire Decorator

✔ Wire Function

✔ Apex Integration

✔ Data Processing

✔ JavaScript Loops

✔ Conditional Statements

✔ Dashboard Analytics

✔ Dynamic UI Updates

---

## 🔄 Application Flow

Page Loads

↓

@wire Executes Apex Method

↓

Account Records Retrieved

↓

Store Records in Component

↓

Loop Through Accounts

↓

Count Hot Accounts

↓

Count Warm Accounts

↓

Count Cold Accounts

↓

Calculate Total Accounts

↓

Display Dashboard Metrics

---

## 📋 Example

Account Records:

| Account Name | Rating |
| ------------ | ------ |
| Tata Motors  | Hot    |
| Reliance     | Warm   |
| Infosys      | Hot    |
| HDFC Bank    | Cold   |

Dashboard Output:

Total Accounts: 4

Hot Accounts: 2

Warm Accounts: 1

Cold Accounts: 1

---

## ⭐ Why This Scenario Is Important

Most beginner applications only display data.

Real-world Salesforce dashboards require developers to:

* Analyze Data
* Generate Metrics
* Calculate Statistics
* Present Insights

This challenge introduces data transformation and analytical thinking using the Wire Service.

---

## 🎯 Learning Progression

### Day 40

Basic Wire

```javascript
@wire(getData)
accounts;
```

### Day 41

Reactive Wire

```javascript
@wire(getData,{
    addType:'$selectedType'
})
accounts;
```

### Day 42

Wire Function

```javascript
@wire(getData,{
    rating:'$selectedValue'
})
wiredAccounts(result)
{
    this.accounts = result.data;
}
```

### Day 43

Wire Function + Analytics

```javascript
for(let i = 0; i < this.accounts.length; i++)
{
    // Count Hot, Warm and Cold Accounts
}
```

---

⭐ Daily Salesforce LWC Practice Journey

Building real-world Salesforce dashboards and strengthening Wire Service concepts one day at a time 🚀
