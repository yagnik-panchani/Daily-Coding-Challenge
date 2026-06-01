# Duplicate Opportunity Validation

## Scenario

Prevent users from creating an Opportunity if another Opportunity with the same Name already exists under the same Account.

### Example

#### Existing Record

| Account  | Opportunity Name |
| -------- | ---------------- |
| ABC Corp | Laptop Deal      |

#### New Record

| Account  | Opportunity Name |
| -------- | ---------------- |
| ABC Corp | Laptop Deal      |

**Result:** Validation Error

---

## Business Requirement

When a user creates a new Opportunity:

* The Account must be checked.
* Existing Opportunities under that Account must be verified.
* If an Opportunity with the same Name already exists, the record should not be saved.
* A meaningful error message should be displayed to the user.

---

## Solution Approach

1. Collect all Account Ids from Trigger.new.

2. Query existing Opportunities related to those Accounts.

3. Create a composite key using:

   AccountId + Opportunity Name

4. Store existing records in a Set.

5. Compare incoming Opportunities against the Set.

6. Use addError() to prevent duplicate records.

---

## Apex Concepts Used

* Trigger Framework
* Before Insert Trigger
* Collections (Set)
* SOQL
* Bulkification
* addError()
* Composite Key Logic

---

## Files

### Trigger

OpportunityTrigger.trigger

### Handler Class

OpportunityTriggerHandler.cls

---

## Sample Error Message

Duplicate Opportunity Name already exists for this Account.

---

## Learning Outcome

Through this challenge, I practiced:

* Writing bulkified Apex code
* Preventing duplicate data
* Using Sets effectively
* Handling Trigger.new records
* Salesforce Trigger best practices

---

## Author

Yagnik Panchani

Salesforce Developer | Apex | LWC | Agentforce Enthusiast
