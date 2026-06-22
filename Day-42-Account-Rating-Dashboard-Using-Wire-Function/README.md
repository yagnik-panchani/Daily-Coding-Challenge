# Day 42 - Account Rating Dashboard Using Wire Function

## 📌 Scenario

Build an Account Rating Dashboard using the @wire decorator with a Wire Function.

The application allows users to select an Account Rating from a dropdown list and automatically retrieve matching Account records from Salesforce.

In addition to displaying records in a datatable, the application also calculates and displays the total number of matching Accounts.

This challenge focuses on understanding how to process data returned from a Wire Function.

---

## 🚀 Business Requirements

Display a dropdown containing:

* Hot
* Warm
* Cold

When a user selects a rating:

* Automatically call Apex using @wire
* Retrieve matching Account records
* Display the records in a datatable
* Display the total number of returned Accounts

No button click should be required.

---

## 🔗 Object Used

### Account

Fields Used:

* Name
* Type
* Rating

---

## 🚀 What This Application Does

✅ Displays Account Rating Filter

✅ Uses Reactive Parameters

✅ Uses Wire Function

✅ Retrieves Records Automatically

✅ Displays Account Records

✅ Calculates Total Accounts

✅ Updates UI Dynamically

---

## 🧠 Technical Concepts Used

* Lightning Web Components
* @wire Decorator
* Wire Function
* Reactive Parameters
* Apex Integration
* lightning-combobox
* lightning-datatable
* Data Processing
* Dynamic UI Updates

---

## 💡 Business Use Case

Sales Managers often want to quickly analyze customers based on their Rating.

Examples:

* Hot Customers
* Warm Customers
* Cold Customers

Using a reactive dashboard allows users to filter records instantly without requiring page refreshes or button clicks.

---

## 🔥 Key Learning Outcome

Through this challenge, I learned:

* How to use @wire with a function
* How to process returned data
* How reactive parameters work
* How to calculate values from wire results
* How to build dynamic dashboards
* How to update UI automatically when filter values change

---

## 🚀 Salesforce Concepts Practiced

✔ @wire Decorator

✔ Wire Function

✔ Reactive Parameters

✔ Apex Integration

✔ lightning-combobox

✔ lightning-datatable

✔ Dynamic Filtering

✔ Dashboard Metrics

---

## 🔄 Application Flow

User Selects Rating

↓

selectedValue Changes

↓

Reactive Parameter Updates

↓

Wire Function Executes

↓

Apex Method Runs

↓

Matching Accounts Retrieved

↓

Total Account Count Calculated

↓

Datatable Updated

↓

Dashboard Refreshed Automatically

---

## 📋 Example

Selected Rating:

Hot

Returned Records:

| Account Name        | Type     | Rating |
| ------------------- | -------- | ------ |
| Tata Motors         | Customer | Hot    |
| Reliance Industries | Partner  | Hot    |
| Infosys Ltd         | Customer | Hot    |

Dashboard Output:

Total Accounts : 3

---

Selected Rating:

Warm

Returned Records:

| Account Name   | Type     | Rating |
| -------------- | -------- | ------ |
| HDFC Bank      | Customer | Warm   |
| Tech Solutions | Partner  | Warm   |

Dashboard Output:

Total Accounts : 2

---

## ⭐ Why This Scenario Is Important

Most developers start with:

@wire(getData)

However, real-world applications often require additional processing of the returned data.

Wire Functions allow developers to:

* Calculate totals
* Transform data
* Build dashboards
* Perform conditional logic

This makes Wire Functions one of the most important concepts in Lightning Web Components.

---

## 🎯 Difference Between Day 40, Day 41 and Day 42

### Day 40

Basic Wire

Fetch Records Automatically

```javascript
@wire(getData)
accounts;
```

---

### Day 41

Reactive Wire

```javascript
@wire(getData,{
    type:'$selectedType'
})
accounts;
```

---

### Day 42

Wire Function

```javascript
@wire(getData,{
    rating:'$selectedValue'
})
wiredAccounts(result)
{
    this.accounts = result.data;
    this.totalAccounts = result.data.length;
}
```

---

⭐ Daily Salesforce LWC Practice Journey

Learning Salesforce one concept at a time and building real-world applications 🚀
