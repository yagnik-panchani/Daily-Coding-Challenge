# Day 37 - Customer Support Management System (Ticket List LWC)

## Overview

Today I built the first module of my Salesforce Customer Support Management System portfolio project.

The goal of this module is to display support tickets in a Lightning Web Component (LWC) datatable by fetching records from a custom Apex controller.

## Features Implemented

* Custom Object: Ticket__c
* Apex Controller: ticketHandler.cls
* SOQL query to retrieve ticket records
* Lightning Web Component (ticketList)
* Lightning Datatable implementation
* Display Ticket Number, Subject, Status, and Priority
* Client-side Apex call using JavaScript Promises
* Error handling using catch()

## Technologies Used

* Salesforce Apex
* Lightning Web Components (LWC)
* SOQL
* Lightning Datatable
* JavaScript
* Salesforce DX

## Project Structure

classes/

* ticketHandler.cls

lwc/

* ticketList

  * ticketList.html
  * ticketList.js
  * ticketList.js-meta.xml

## Learning Outcomes

Through this challenge I practiced:

* Creating Apex methods for LWC
* Using @AuraEnabled(cacheable=true)
* Writing SOQL queries
* Fetching data from Apex in LWC
* Displaying records in a Lightning Datatable
* Handling asynchronous operations using Promises

## Next Steps

In the next phase of the project, I will build a Create Ticket module that allows users to create support tickets directly from a Lightning Web Component.

## Author

Yagnik Panchani

Salesforce Developer Portfolio Project
Day 37 Coding Challenge
