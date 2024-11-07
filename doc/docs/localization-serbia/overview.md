---
sidebar_position: 1
---
# Overview

## How to import Localization package

To become acquainted with our Localization, you should perform a package import. This will allow you to receive specific data based on the package you choose to import. For importing a package for Localization, you can choose from three types of packages, depending on your company's needs. Further details are elaborated in the subsequent text.

:::warning Avoid

To avoid replacing your settings within your production environment, it is advisable to use an empty environment or sandbox for package imports. This precautionary measure is due to the fact that the imported package contains data that could potentially substitute your own data and configurations.

:::

The process of importing a package is straightforward and involves just a few simple steps. You can import the package using the function accessible through a search in the assisted setup. The instructions below will guide you through the essential steps.

1. When you're on the Assisted Setup page, select the package.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-99bf435c-2679-4b39-8974-f2d1597323ad.png)

2. Accept warning and next.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-c8fd4582-5b4f-47d3-961c-d52f883c969d.png)

3. Select type of data (Setup Date Only, Complete Sample Data), and next.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-cb9aadb5-6da2-4d95-83aa-4bb74f3e9a8d.png)

**Setup Date Only** - It only includes data with the settings. By choosing this package, you can perform service and expense postings. It includes batch number series and a chart of accounts. You will need to manually create customer and vendor card within your BC.

**Sample Data** - It includes data with the settings and data ready for posting (number series, created customers cards, vendor cards, items, fixed asset, chart of accounts, VAT, etc...)

**Complete Sample Data** - It includes data with the settings and data for created customers cards, vendor cards, item, fixed asset, chart of accounts, VAT, posted inventory and documents. Within the General Ledger, you will find recorded transactions, as this package contains them.

4. Download package

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-39c24a17-229f-40c4-b661-365b200610f2.png)

5. It asks the question only the first time you download the package. - Allow Always

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-5f6964cc-f8f4-434a-9d0a-c3ded80f5384.png)

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-05146bf9-092e-4479-b226-cebd47b2d93e.png)

6. Apply Package and next.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-d7805bfe-1787-4f4b-977e-3c3dbfc3b7dd.png)

7. Finish

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-90be332f-16db-4e25-beae-2000ef4c2d6f.png)

The package will be ready in a matter of minutes, allowing you to resume your work in Business Central.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-a3e9056b-d8bf-4c12-af1b-4574a1d9878d.png)

When you've finished following all the steps to import the package, an additional tuning is required under  **Company Information → User Experience → Premium** , as shown in the image. Enter Company Information into the search.

 **Help Assumes Premium Experience** - All the features mentioned in the user documentation for Business Central are designed with the assumption of the Premium experience, implying that these features encompass the entire range of User Experience elements.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-976e1556-72d1-4231-8282-35a10be6c42a.png)

## NBS - NBS web service integration

This extension provides connection to National bank of Serbia service, in purpose of downloading and updating the following information:

*1. Partners data (customers and vendors)*

*2. NBS currency exchange list*

*3. Local banks list*

*4. Industrial activities*

*5. Territory regions/countries*

*6. Customer/vendor bank accounts update*

| Feature                                                                                                                  | Description                                                       | Release |
| ------------------------------------------------------------------------------------------------------------------------ | ----------------------------------------------------------------- | ------- |
| [Service setup](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-service-setup)               | The first steps of adjustment are explained below                 |         |
| [How to use](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-how-to-use)                     | In further steps, you will be instructed how to use and adjust it |         |
| [Import data from NBS](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-import-data-from-nbs) | Fast way to enter data                                            |         |

## EPE - Banking and Electronic Payment

This functionality is created to help in keeping records of transactions of electronic payments, cash balance and bank account balances.

| Feature                                                                                                                                        | Description                                                                                                                                                                                                                   | Release |
| ---------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| [Set up bank accounts](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-set-up-bank-accounts)                       | This functionality requires the creation of a No. Series                                                                                                                                                                      |         |
| [Payments suggestions](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-payment-suggestions)                        | This functionality calls for vendor or employees open entries to make payment suggestions and import payment journal lines                                                                                                    |         |
| [Payment import and export files](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-payment-import-and-export-files) | It is set up to export payment journal lines through the file that is further imported throughout banking application; the same programming serves to import bank statement file in program and post payments and withdrawals |         |
| [Sales &amp; Receivables Setup](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-sales--receivables-setup)          | The standard code for the reference credit formula will be defined there                                                                                                                                                      |         |

## INS - Instalment on Sales and Purchase

This functionality has been developed as a result of the need for document archiving with different dates of arrival. **How to set up Instalment:** Setting changes are performed in the Payment Terms table. In search type Payment Terms. A new term of payment needs to be created, enter the code in the tab and select in the field Type -Installments. After which a new Action called Installment calculator is initiated, in which you populate the number of installments and period length. In the field length of the period enter duration of periods. For example: one month - 1M, one year - 1Y, needs to be entered.

![image](https://private-user-images.githubusercontent.com/141014255/283843815-9cd97bd8-6fc4-4851-a38b-1d2c61c5f5b2.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Mjk3ODI1OTEsIm5iZiI6MTcyOTc4MjI5MSwicGF0aCI6Ii8xNDEwMTQyNTUvMjgzODQzODE1LTljZDk3YmQ4LTZmYzQtNDg1MS1hMzhiLTFkMmM2MWM1ZjViMi5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQxMDI0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MTAyNFQxNTA0NTFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT02YWRjYTk1MjliNjQzMTJiNGU1OGRhMDcyYTQxODg5YmM2NzI1MTBmNTdkN2ZkNzNmNzY4NWYyMjQyZWY0NWQ2JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.UCJ_RPV71vkZ1Cx9JBg5brM2vFCNor81YePzNgBPrHU) ![image](https://private-user-images.githubusercontent.com/141014255/283844660-0f35c2a4-9009-4a81-8882-4e90f57bc4b4.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Mjk3ODI1OTEsIm5iZiI6MTcyOTc4MjI5MSwicGF0aCI6Ii8xNDEwMTQyNTUvMjgzODQ0NjYwLTBmMzVjMmE0LTkwMDktNGE4MS04ODgyLTRlOTBmNTdiYzRiNC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQxMDI0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MTAyNFQxNTA0NTFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1iYThkMTlkNTBhNGQzNmMzMWYxY2UxYzc3MGRiMDBiZjgxYTkzYjc4ODY4NzYxZDQxZDg4OGQzMzU0OTY3ODMyJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.e09Sve69Lc2OcA22Y4dAD9p93FrZzBYBsWZKhCQYOtM) ![image](https://private-user-images.githubusercontent.com/141014255/283844606-aef9f235-8cd3-4028-8acd-ca9e528ac567.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Mjk3ODI1OTEsIm5iZiI6MTcyOTc4MjI5MSwicGF0aCI6Ii8xNDEwMTQyNTUvMjgzODQ0NjA2LWFlZjlmMjM1LThjZDMtNDAyOC04YWNkLWNhOWU1MjhhYzU2Ny5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQxMDI0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MTAyNFQxNTA0NTFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT04MmJiNjgxMGE5OGY4MzQwMGEwMjJmYWJhMTcxMWJlZDU2MTM1Zjc4OTFjYmUxYTk4YTE5MjU5MTkwMzY5NzU2JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.xcJ-GH0r0KpXPZdDYOdsUPknIcV4KWyjVzEPI9gKPas)

**How to use Instalments:**

This functionality is used in the same manner for both sale and purchase. After entering all the necessary data, in the header and lines of the document in the Invoicing tab, you need to select the code for the payment terms code that we have created earlier. If is necessary you can change the number of installments, level of installments or the due date in the document by clicking on the statistic; in the Installments tab it is possible to make any required changes before posting document. After posting, the same number of customer-vendor entries is being created as per the number of installments, with different due dates.

![image](https://private-user-images.githubusercontent.com/141014255/283845407-281be75a-8045-4509-adb3-ea5eacba119a.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Mjk3ODI1OTEsIm5iZiI6MTcyOTc4MjI5MSwicGF0aCI6Ii8xNDEwMTQyNTUvMjgzODQ1NDA3LTI4MWJlNzVhLTgwNDUtNDUwOS1hZGIzLWVhNWVhY2JhMTE5YS5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQxMDI0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MTAyNFQxNTA0NTFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT0yM2ViNmFjMzJjY2E1NzU1MTE3NjQ1OWEyODZiOWNlNGM5NTc0MGQ1NTIyNGIxNDgzZDA2YzhkZTZhMDUxNTNlJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.8FLz-7vXBssvsaQfVirrM0YXyDASXp_sGz-TBLXujX0) ![image](https://private-user-images.githubusercontent.com/141014255/283845527-c818e670-f76b-410d-a6f1-1d1d2f4d3512.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Mjk3ODI1OTEsIm5iZiI6MTcyOTc4MjI5MSwicGF0aCI6Ii8xNDEwMTQyNTUvMjgzODQ1NTI3LWM4MThlNjcwLWY3NmItNDEwZC1hNmYxLTFkMWQyZjRkMzUxMi5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQxMDI0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MTAyNFQxNTA0NTFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT03MzA4OTA0NTA5Yzk4NDZiNzE3ODliM2UwODFkYTRkZjQxNWVlOTg3ZDc0MDc2ODJjYzIxZWJjYTI5NzQ1MjAyJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.YyYuZa7aRJDvisNJojrQtAeZdSXZl-swxl6VjU2EiNs)

## CCV - Contact Customer Vendor same No

**This** functionality was developed due to the need that when creating a Customer/Vendor from a contact card (existing or newly created), the number series does not increase, that is, that the same number series is used for both the contact and the Customer/Vendor created from that contact, and vice versa, when a Customer/Vendor has created first, the Contact will be created automatically (or through processing Create contacts and will have the same number series as the previously created Customer/Vendor. This refinement enables the need to record the relationship with one business partner as a Customer/Vendor, and also enables an overview of the Balance (outstanding liabilities) of the Customer as a Vendor and vice versa.

**Setup**

New Vendors can be created in two ways:

* [From the Contact table.](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-creating-a-vendor-from-a-contact-card)
* [Directly from the Vendor table.](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-create-contacts-from-vendors)

New Customers can be created in two ways:

* [From the Contact table.](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-creating-a-customer-from-a-contact-card)
* [Directly from the Customers table.](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-create-contacts-from-customers)

When entering a contact, it is possible to enter additional information, e.g. economic sector of business, type of business relationship, mail groups, addresses. If the Customer/Vendor is created from the contact card, all data that already exists on the contact will be transferred to the Customer/Vendor card, and vice versa, if the contact is created from the Customer/Vendor card, all data that exists on the Customer/Vendor will be transferred to the contact.

In order to be able to create a new vendor/customer/contact same No, it is necessary to enter the keyword ***Marketing settings*** in the quick search, then on ***the Numbering tab*** mark the fields **Vendor same No.** and  **Customer same No** .

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-9156270c-738b-4dd1-9022-98d0355a5ebc.png)

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-925d2e86-50be-4e0e-9525-0821d4efe20d.png)

It is necessary to set the number series in the field  **Vendor Nos** . This is done from the Purchases & Payables Setup page.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-53feeeb1-f2b1-4b0b-ae5a-427fdfba4470.png)

It is necessary to set the number series in the field  **Customer Nos** . This is done from the Sales & Receivables Setup page.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-e218078b-9de6-416e-b0a0-eec07d6f5d99.png)

## PRA - Payables Receivables Accounts

The functionality will not allow apply entries two different posting groups.

* The Customer Posting Group is added to Detailed Customer Ledger Entries.
* The Vendor Posting Group is added to Detailed Vendor Ledger Entries.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-c20a2b49-6e23-4470-83b5-cdeb722ec110.png)

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-75e22e65-f911-4878-a3bd-12487a26390a.png)

Filtering by posting group is enabled on the following reports:

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-7895283d-a498-45bd-924a-0b50c60c2af2.png)

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-a4ac3fa5-1b98-469b-96ec-b8f0efab5d37.png)

## PHI - Physical inventory posting

This functionality secures possibility to check for inventories on hand and compare them with real inventories count, with the purpose of posting discovered surplus or shortage.

Also, it provides possibility to reclassify items, regarding changing items dimension, location code, serial no., lot no. or variant.

**In this section:**

| **Feature**                                                                                                                      | **Description**                                                                                                                      | **Release** |
| -------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ | ----------------- |
| [Physical inventory orders](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-physical-inventory-order)      | Inventories can be counted multiple times for one order/location, for example when item groups need to be assigned to different employees. |                   |
| [Item reclassification](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-items-reclassification-journals)   | Items reclassification, change of dimensions, tracking codes, variants or location codes                                                   |                   |
| [Physical inventory posting](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-physical-inventory-posting-1) | Physical inventories calculation and comparison to items on hand, posting of surpluses or shortages                                        |                   |

## DPO - Document-Printout

Every company needs efficient tools to keep track on its assets and obligations and have simple and fast ways to gain those information.

Our reporting functionality provides you with such tools and simplifies your everyday analyzing processes.

**In this section:**

| Feature                                                                                                                            | Description | Differences from standard reports |
| ---------------------------------------------------------------------------------------------------------------------------------- | ----------- | --------------------------------- |
| [Sales - Quote](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-sales-quote)                           |             |                                   |
| [Sales - Invoice](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-service-invoice)                     |             |                                   |
| [Sales - Credit Memo](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-sales-credit-memo)               |             |                                   |
| [Sales - Shipment](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-sales-shipment)                     |             |                                   |
| [Sales Pro Forma Invoice](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-sales-pro-forma-invoice)     |             |                                   |
| [Purchase - Credit Memo](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-purchase-credit-memo)         |             |                                   |
| [Purchase - Receipt](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-purchase-receipt)                 |             |                                   |
| [Service - Invoice](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-service-invoice)                   |             |                                   |
| [Service - Credit Memo](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-service-credit-memo)           |             |                                   |
| [Service - Shipment](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-service-shipment)                 |             |                                   |
| [Warehouse Posted Shipment](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-warehouse-posted-shipment) |             |                                   |
| [Warehouse Posted Receipt](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-warehouse-posted-receipt)   |             |                                   |
| [Internal Invoice](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-internal-invoice)                   |             |                                   |

**Set up NPS Report**

A wizard **NPS Report Selection Setup Wizard** has been created that asks if the user wants to use localization reports or standard documents.

![image](https://private-user-images.githubusercontent.com/141014255/286593699-41e93695-b6e7-4311-b482-8c281cf2e6f4.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Mjk3ODI1OTEsIm5iZiI6MTcyOTc4MjI5MSwicGF0aCI6Ii8xNDEwMTQyNTUvMjg2NTkzNjk5LTQxZTkzNjk1LWI2ZTctNDMxMS1iNDgyLThjMjgxY2YyZTZmNC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQxMDI0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MTAyNFQxNTA0NTFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT00MmRhNTRmZDQ0MjExZTJkMGRkYmIyYmZiOTdkNWFjMTY0M2Q5MmUxNTMyY2M5MmQ0MjYzYjA2YjU0YWU1M2ZmJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.oAMruqnFdYeQa1ctayiQO8eLTNaO2sQxOZexkDJwnAQ)

After you accept warning and privacy notice you are able to step forward on selecting the right package for you.

There are three options:

* ***Empty*** ,
* ***Standard Report*** - use standard document prints,
* ***Localization Report*** - use localization document prints

![image](https://private-user-images.githubusercontent.com/141014255/286594474-f879e376-0afc-46e9-bda6-24ef00a030f6.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Mjk3ODI1OTEsIm5iZiI6MTcyOTc4MjI5MSwicGF0aCI6Ii8xNDEwMTQyNTUvMjg2NTk0NDc0LWY4NzllMzc2LTBhZmMtNDZlOS1iZGE2LTI0ZWYwMGEwMzBmNi5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQxMDI0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MTAyNFQxNTA0NTFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT01YzJiODJlMDNkYTNmNzQ0YzUwOTdiM2NlMTI3MjhlZmEzOGYzMzlkZjY1ODZhM2Y2ZmY0Yzg0ZGZmYjBlZDNhJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.WbvW7McNtCfFOMp2oA3ijbmg9Yxrhh-NWG6PVKvLnyw)

After you select desired package data click on *Download* package first, then after it is downloaded check *Apply Package* option and then you are ready to proceed forward, click Next.

![image](https://private-user-images.githubusercontent.com/141014255/286594765-f96c78bf-8f6f-4f7c-b5c7-e0ff79a4fcf4.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Mjk3ODI1OTEsIm5iZiI6MTcyOTc4MjI5MSwicGF0aCI6Ii8xNDEwMTQyNTUvMjg2NTk0NzY1LWY5NmM3OGJmLThmNmYtNGY3Yy1iNWM3LWUwZmY3OWE0ZmNmNC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQxMDI0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MTAyNFQxNTA0NTFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT05MjIyMGI4MWVmMTllODI4MjEyMzI0M2Q4MGU2YmU1NWU3YTM5YmVmYWUyMmZjNTY5N2NjOTYzNmRmNjE1MWNhJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.5eKCF8ChzOM3CjoI9ORXQ5dsZ6fzSZ-Yk5z7_7BjPDk)

That's it! You have required data. Depending on what the user chooses in the background, the corresponding package will be imported automatically. After you click Finish the package will be applied to your company.

Substitute Document Report The following standard reports have been replaced in the ***Localization Report*** package:

| Standard Report ID | Standard Report Name           | New Report ID | New Report Name                |
| ------------------ | ------------------------------ | ------------- | ------------------------------ |
| 1304               | Standard Sales - Quote         | 49021061      | NPS Standard Sales - Quote     |
| 1306               | Standard Sales - Invoice       | 49021041      | NPS Standard Sales - Invoice   |
| 1307               | Standard Sales - Credit Memo   | 49021046      | NPS Sales - Credit Memo        |
| 208                | Sales - Shipment               | 49021045      | NPS Sales - Shipment           |
| 1302               | Standard Sales - Pro Forma Inv | 49021053      | NPS Sales - Pro Forma Invoice  |
| 407                | Purchase - Credit Memo         | 49021054      | NPS Purchase - Credit Memo     |
| 408                | Purchase - Receipt             | 49021050      | NPS Purchase - Receipt         |
| 5911               | Service - Invoice              | 49021048      | NPS Service - Invoice          |
| 5912               | Service - Credit Memo          | 49021055      | NPS Service - Credit Memo      |
| 5913               | Service - Shipment             | 49021056      | NPS Service - Shipment         |
| 7309               | Whse. - Posted Shipment        | 49021049      | NPS Whse. - Posted Shipment    |
| 7308               | Whse. - Posted Receipt         | 49021059      | NPS Whse. - Posted Receipt     |
| 5704               | Transfer Shipment              | 49021086      | NPS Transfer Shipment          |
| 5705               | Transfer Receipt               | 49021087      | NPS Transfer Receipt           |
| 5875               | Phys. Invt. Order Diff. List   | 49021070      | NPS Phys. Invt. Ord. Diff. Ls. |
| 5878               | Phys. Invt. Recording          | 49021065      | NPS Phys. Invt. Recording      |

## REP - Reporting

Every company needs efficient tools to keep track on its assets and obligations and have simple and fast ways to gain those information.

Our reporting functionality provides you with such tools and simplifies your everyday analyzing processes.

**In this section:**

| Feature                                                                                                                                                            | Description                                                                                                                                                                                                                                      | Differences from standard reports                                                  |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------------- |
| [Customer - IOP](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-customer-iop)                                                         | Customer - IOP is a report that shows customer's invoices that are partially paid or not paid.                                                                                                                                                   |                                                                                    |
| [Vendor - IOP](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-vendor-iop)                                                             | Vendor - IOP is a report that shows vendor's invoices that are partially paid or not paid.                                                                                                                                                       |                                                                                    |
| [Purchase Price Calculation](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-purchase-price-calculation)                               | The purchase calculation shows the item charge costs associated with that receipt as well as the unit cost.                                                                                                                                      |                                                                                    |
| [NPS Inventory - Transaction Detail](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-nps-inventory-transaction-detail)                 | This report shows the value and quantity changes in the condition of items by locations and document numbers.                                                                                                                                    | Added columns                                                                      |
| [Stock List](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-stock-list)                                                               | Stock list is a report that shows the availability of items by location in the quantity expressed in their units of measure.                                                                                                                     |                                                                                    |
| [NPS Customer - Detail Trial Balance](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-nps-customer-trial-balance)                      | This report enlists all transactions by document type and date, providing possibility to check and analyse amounts in both local and foreign currencies.                                                                                         | Customer posting group filter                                                      |
| [NPS Customer - Summary Aging Simp](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-nps-customer-summary-aging-simp)                   | This report shows the amounts due by period, for the selected customer during the selected period.                                                                                                                                               | Customer posting group filter, extended customers balances due up to over 360 days |
| [NPS Customer - Sales list](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-nps-customer-sales-list)                                   | Valuable report when it comes to getting fast information about sales in one place.                                                                                                                                                              | Customer posting group filter                                                      |
| [NPS Customer Balance to Date](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-nps-customer-balance-to-date)                           | This report helps to inquire information about balance per customer on the specific date. It shows all customers that have open balance.                                                                                                         | Customer posting group filter                                                      |
| [NPS Customer - Trial Balance](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-nps-customer-trial-balance)                             | It shows changes in receivables balances over a certain time period, both on credit and debit side, with possibility to filter by customer posting groups.                                                                                       | Customer posting group filter                                                      |
| [NPS Vendor - Balance to Date](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-nps-vendor-balance-to-date)                             | This report helps to inquire information about balance per vendor on the specific date. It shows all vendors that have open balance.                                                                                                             | Vendor posting group filter                                                        |
| [NPS Vendor - Detail Trial Balance](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-nps-vendor-detail-trial-balance)                   | This report enlists all transactions by document type and date, with possibility to check amounts in two currencies.                                                                                                                             | Vendor posting group filter                                                        |
| [NPS Vendor - Purchase List](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-nps-vendor-purchase-list)                                 | The report pays attention to all the purchases within a certain time period                                                                                                                                                                      | Vendor posting group filter                                                        |
| [NPS Vendor - Trial Balance](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-nps-vendor-trial-balance)                                 | This report helps to inquire information about balance per vendor on the specific date. It shows all vendors that have open balance.                                                                                                             | Vendor posting group filter                                                        |
| [NPS Vendor - Summary Aging Simp](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-nps-vendor-summary-aging-simp)                       | This report shows the amounts due by period, for the selected vendor during the selected period.                                                                                                                                                 | Vendor posting group filter, extended vendors balances due up to over 360 days     |
| [NPS Trial Balance With Start Balance](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-nps-trial-balance-with-start-balance)           | This report shows Credit and Debit Balance, Net Charge and Net Charge Balance for each G/L Account, group and class of G/L Accounts on the specific date.                                                                                        | Added options and columns                                                          |
| [Vendor - Detail Trial Bal. in Curr. and LVT](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-vendor-detail-trial-bal-in-curr-and-lvt) | This report enlists all transactions by document type and date, providing possibility to check and analyse amounts in both local and foreign currencies.                                                                                         |                                                                                    |
| [Customer - Detail Trial Bal. in Curr. and LVT](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-detail-trial-bal-in-curr-and-lvt)      | This report enlists all transactions by document type and date, providing possibility to check and analyse amounts in both local and foreign currencies.                                                                                         |                                                                                    |
| [Commitment Analysis Summary](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-commitent-analysis-summary)                              | This report shows the analysis of Customers, Vendors, Bank Accounts, Employees, Fixed Assets distributed by G/L accounts. The report presents the following data: starting balance, debit amount, credit amount, not due and overdue amounts.    |                                                                                    |
| [Commitment Analysis](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-commitent-analysis)                                              | This report shows the analysis of Customers, Vendors, Bank Accounts, Employees, Fixed Assets distributed by G/L accounts. The report presents the following data: debit amount, credit amount, remaining amount and balance by document numbers. |                                                                                    |

## FAM - Fixed Assets Management

The following topics provide more information on how to use Fixed asset advanced functionality, to post, change and analyse detailed data on fixed assets through Business central.

**In this section:**

| Feature                                                                                                                                                                       | Description                                                                                                                                                                                 | Release |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| [FA history](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-fa-history)                                                                          | Information on changes regarding tracking assignment/discharge of fixed assets by location, employee or customer. It also provides valuable report for review or print out and verification |         |
| [FA preparation posting type](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-fa-preparation-posting-type)                                        | It serves to companies needs to keep track on fixed assets that are purchased but not yet in use                                                                                            |         |
| [FA details](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-fa-details)                                                                          | Detailed information source on fixed assets posted transactions and changes                                                                                                                 |         |
| [Set up depreciation on FA classes and subclasses](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-set-depreciation-on-fa-classes-and-subclasses) | It makes it easier to fill in all necessary information regarding depreciation by only choosing the right class/subclass, instead of filling out each FA detail card separately             |         |

## NIA - Negative Inventory Adjustment Allowance

Negative Inventory Adjustment Allowance

NIA provides that any negative Item Quantity can not be posted on posting date, except in case if on Item Card is set differently (Option “No” on Prevent Negative Inventory on Inventory Tab). This practically means that if a certain Item is on stock today but yesterday was not, the program shows an error when you try to post on that date when that Item was not on stock.

Inventory Setup

Before posting any Item Ledger Entries there should be a setup which defines how to control negative inventory posting.

1. Open Inventory Setup.
2. Set field Prevent Negative Inventory on General Tab to enable standard functionality to prevent negative inventory.

Item Card

1. Open Item Card.
2. Choose Prevent Negative Inventory on Inventory Tab from options:

* Default (Yes): option is used if you want always to prevent negative posting on the Item.
* Yes: option is used if you want always to prevent negative posting on the Item.
* No: option is used if you don't want to prevent negative posting on the Item.

Post Sales Order

Sales Order is used to post items to customers. When posting Sales Order program checks if there is any inventory for Item, on a certain location and on posting date.

1. Open Sales Order and create a new document.
2. Enter Customer No. and all other mandatory data.
3. Choose Item No.
4. Choose Location Code and other mandatory data
5. Post Sales Order by choosing Posting->Post

The program shows error and prevents the negative posting of Item on Location in case there is no Inventory on Location on specified posting date.

Post Sales Invoice

Sales Invoice is used to post items to customers. When posting Sales Invoice program checks if there is any inventory for Item and on a certain location on specified posting date.

1. Open the Sales Invoice and create a new document.
2. Enter Customer No. and all other mandatory data.
3. Choose Item No.
4. Choose Location Code
5. Post Sales Invoice by choosing Posting->Post.

The program shows error and prevents the negative posting of Item on Location in case there is no Inventory on Location on specified posting date.

Post Item Journal

Item Journal is used to post items to and from locations. When posting Item Journal program checks if there is any inventory for Item and on a certain location on posting date.

1. Open Item Journal and create a new line.
2. Enter Document No.
3. Choose Item No.
4. Choose Entry Type Negative Adjmt. or Sale.
5. Choose Location Code
6. Post Journal by choosing Actions->Posting->Post.

The program shows error and prevents the negative posting of Item on Location in case there is no Inventory on Location on specified posting date.

## DCA - Debit Credit Amounts

## COM - Compensation

This functionality is created for planning, contracting and posting obligations fall due by compensating Customers and Vendors, creating related document called  *Compensation proposal* .

Pre-requisites for using this functionality is to set contacts relations between linked Customers and Vendors, which are business partners a company has payables and receivables at the same time.

There are fields, *Balance(DVT) as a vendor* and *Balance(DVT) as a customer* on vendors and customers contact cards. According to these amounts, the system recognizes total amount of payables/receivables with certain partner and can create Compensation proposal.

**How to create Compensation overview:**

Before Compensation proposal is created, you can find Vendors and Customers that have condition for compensation and look for the amount for compensation. This can be done through report called  *Customer/Vendor preview* , with possibility to filter Customer/Vendor.

1. Go to Search window and type Customer/Vendor preview
2. Select No. of contact from Filter-Contact list, if you want overview balances for one or a few partners.
3. You can Filter totals by Date filter, Salesperson filter, Sales cycle filter etc.

| **No** . | **Name**    | **Cust.balance** | **Vend.balance** | **Difference** | **Possible compensation amount** |
| -------------- | ----------------- | ---------------------- | ---------------------- | -------------------- | -------------------------------------- |
| C0050          | Dynamic trade doo | 12000                  | 22000                  | -10000               | 12000                                  |

**How to create  *Compensation proposal* :**

With the list of partners eligible for compensation, next step is to create Compensation proposal. Compensation proposal can be printed as a separate report to send to business partner for confirmation.

1. Go to  *Payment journal – Process – Suggest compensations* . New page will open, it is necessary to set up fields for Posting date, Document number and Description. It is possible to select certain Vendor/Customer, simply enter Ven./Cust. No.
2. Depending on open entries for all or a few Vendors/Customers and payables/receivables due date, the system will create journal lines. You can arrange the journal, having some lines deleted, if not desired to make a compensation for all the payment journal lines.
3. You can check Applies to doc. No. and Applies to doc. Due date. These fields are editable, in case you want to choose a different invoice to apply.
4. Correct amounts to be applied are related to open Customer/Vendor entries. Payment journal balance is to be 0.
5. Then go to *Report – Compensation proposal* to print the report in order to forward it to your business partner for confirmation.

**How to post compensation:**

If your business partner confirms, the final step is to post compensation journal lines from Payment journal.

New Customer/Vendor entries will occur after Payment journal is posted. As a result, original invoices are applied, having payables and receivables settled.

## VAT - VAT Management

VAT is a general consumption tax that is calculated and paid. The Vat in RS is 10% (general percentage) and 20% (special percentage). VAT is calculated for all taxpayers. It is calculated once in a month or once every three months. When VAT will be calculated depends on which category you are. After you finish the VAT calculation, you need to send it to the tax administration. The tax administration controls your VAT, because you will send it.

What is VAT in Business Central and how can we calculate it easily and precisely? It is the right time to find out.

For your VAT calculation to be easier to work with, you should define VAT Identifiers. The VAT Identifiers will be set on VAT Posting Setup. Documents entered and documents created in Business Central will have appropriate VAT identifiers. The VAT Identifiers will help you to define the VAT Book. All VAT books together are a VAT calculation.

| **Feature**                                                                                                    | **Description**                                                                                       | **Release** |
| -------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ----------------- |
| [VAT book groups](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-vat-book-groups)       | Define the lines of a VAT reporting form                                                                    |                   |
| [VAT identifiers](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-vat-identifiers)       | Describes the posting of VAT Identifier when posting VAT entries for a certain combination of Posting Group |                   |
| [Postponed VAT](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-postponed-vat)           | VAT amount is to be suspended as it is not possible to settle it at a given time. .                         |                   |
| [Reverse Charge VAT](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-reverse-charge-vat) | It is calculated on some services from abroad.                                                              |                   |

## RVE - Reverse

With this functionality, companies can use specific document called  *Reverse order* , to assign any item to employees, customers or vendors.

It goes with an option for print out shipments and receipts of reverse transfers and also with possibility to check reverse assignment review showing active reverse orders for certain period.

**In this section:**

| Feature                                                                                                                            | Description                                                                                                    | Release |
| ---------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- | ------- |
| [Reverse orders](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-reverse-orders)                       | Offers possibility for posting and efficient tracking items assigned to either employees, customers or vendors |         |
| [Inventory reverse preview](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-inventory-reverse-preview) | It is a report that provides valuable information on when/to whom are items given for use                      |         |

## MNM - Minor assets management

Minor assets allows the transfer into use after purchasing of minor assets. When put into use, it can then be issued in reverse. To perform entries for minor inventory in use, it's necessary to set up Item Journal Template. Create a new form, and on that form, you will define:

1. No. Series
2. Source Code
3. Subtype

![Items](https://private-user-images.githubusercontent.com/141014255/286590812-4e462605-6b5b-4610-bf78-7584c181cafe.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Mjk3ODI1OTEsIm5iZiI6MTcyOTc4MjI5MSwicGF0aCI6Ii8xNDEwMTQyNTUvMjg2NTkwODEyLTRlNDYyNjA1LTZiNWItNDYxMC1iZjc4LTc1ODRjMTgxY2FmZS5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQxMDI0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MTAyNFQxNTA0NTFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1hMDY4YTg1ZjE1NGExMTNjZmZjOGJmY2QxOTNhZDkyMTgyZjUyNzM1YjhhZDk2ZDE2ZWU1NTc1YzNmNzY5YWQ4JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.ieipw_hgl1F7zC3WRuTxMLtKNiEPhNmjA-CCSMbqo_Q)

The next step is to set up the Batches.

![Items](https://private-user-images.githubusercontent.com/141014255/286590876-aea732eb-728c-4e91-8a43-ce768927080a.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Mjk3ODI1OTEsIm5iZiI6MTcyOTc4MjI5MSwicGF0aCI6Ii8xNDEwMTQyNTUvMjg2NTkwODc2LWFlYTczMmViLTcyOGMtNGU5MS04YTQzLWNlNzY4OTI3MDgwYS5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQxMDI0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MTAyNFQxNTA0NTFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1iOGVkYzcyNjVmYTU1Nzk3NmY2YjA5OGJlZWZkYjJiZTk5MWY0OGFiYThmYWQ3OTk1ZjE3ZWU1MTQyOGU2Y2E1JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.dSVAxahBODFcRnsZ6l8K_VwXhYhtnC6r6Xc_gQgW1bM)

Adjust the General Posting Group and Location Code for Minor Assets in the Item Journal Batches, and finally, enter the Subtype at the bottom of the table.

![Items](https://private-user-images.githubusercontent.com/141014255/286590985-2fb90bbf-8a22-496b-8b60-49d65376ea68.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Mjk3ODI1OTEsIm5iZiI6MTcyOTc4MjI5MSwicGF0aCI6Ii8xNDEwMTQyNTUvMjg2NTkwOTg1LTJmYjkwYmJmLThhMjItNDk2Yi04YjYwLTQ5ZDY1Mzc2ZWE2OC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQxMDI0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MTAyNFQxNTA0NTFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT01Y2FmMWI3M2M5MWIyZTc2ZDg2Mzk0ZWFmOWFlYTU1MWEyMjQ5N2E4YmRhZDljMjc1NGJmM2VkNDY3Njc4NzA5JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.94taBYxl92ubeb1OV-GHi_aE4Sjsb4eYtekvwdHebKA)

General Posting Setup.

![Items](https://private-user-images.githubusercontent.com/141014255/286591874-da004fc2-7640-439f-9ed6-c74eb05d0539.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Mjk3ODI1OTEsIm5iZiI6MTcyOTc4MjI5MSwicGF0aCI6Ii8xNDEwMTQyNTUvMjg2NTkxODc0LWRhMDA0ZmMyLTc2NDAtNDM5Zi05ZWQ2LWM3NGViMDVkMDUzOS5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQxMDI0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MTAyNFQxNTA0NTFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT02NjNhMjFjZTRkN2Y5NTgyOTczM2M4NTE4ZGM1YjdjMjBhOWI1NGQxOWI4YWM4NDc0ODZmM2VmZGRmNTc5Nzc2JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.0duwcndsQjTqOaxVgUznjzCUgNuOlld_0D85KvmXBB8)

![Items](https://private-user-images.githubusercontent.com/141014255/286592047-4fa57f81-0e69-48d4-9d66-3b610bd8a3be.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Mjk3ODI1OTEsIm5iZiI6MTcyOTc4MjI5MSwicGF0aCI6Ii8xNDEwMTQyNTUvMjg2NTkyMDQ3LTRmYTU3ZjgxLTBlNjktNDhkNC05ZDY2LTNiNjEwYmQ4YTNiZS5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQxMDI0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MTAyNFQxNTA0NTFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT00YTM4NjQ2OWM3YzBlMzM4MzJkMzc4Y2NkZjExYTc2ZTk2MmFkMjU0YmU3MjgxYzg2NTE2NmZhOTMxZTAwNjZlJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.TwKT-hmkuLDbipYpstHaSJvXCRd6kRDgITOIVII5n2U)

When you want to transfer minor assets into use, this is done through the Item Journal.

![Items](https://private-user-images.githubusercontent.com/141014255/286592139-9d03c869-67d5-4b83-8fb5-fdf2bef43db8.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Mjk3ODI1OTEsIm5iZiI6MTcyOTc4MjI5MSwicGF0aCI6Ii8xNDEwMTQyNTUvMjg2NTkyMTM5LTlkMDNjODY5LTY3ZDUtNGI4My04ZmI1LWZkZjJiZWY0M2RiOC5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQxMDI0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MTAyNFQxNTA0NTFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT0yNGFhMjdjYmQzMTAxMDVjMjAzZDBmYjI2MzZjOWEyYjg3YTIyZmQ5OTMwYWY3NWVjY2NjY2M4MDcxNGM5Njk3JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.8jN_LrsZBZ4OXARP3wh_UxlIavHA7Zt9KctEGlzKg4I)

Select the created template from the list, as shown in the picture.

![Items](https://private-user-images.githubusercontent.com/141014255/286592243-611feec1-2a23-4bd3-b584-383c43894763.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Mjk3ODI1OTEsIm5iZiI6MTcyOTc4MjI5MSwicGF0aCI6Ii8xNDEwMTQyNTUvMjg2NTkyMjQzLTYxMWZlZWMxLTJhMjMtNGJkMy1iNTg0LTM4M2M0Mzg5NDc2My5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQxMDI0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MTAyNFQxNTA0NTFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT0wZTQ0Y2ZlMGQzYmRkYTAwNDZlYmFmMzIxYzljYjU5N2U3N2JlNWQ0NDVmNDk3YTcwMDAwNzcwNmJjYTNlOWJjJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.8h1nwKI_mUZqd9W0SBDcSwOo5GbH3z_IwTJ_6jpw3g4)

In the Item Journal, Enter Type - Negative Adjustment is entered, and Item No, Location Code, and Quantity are entered.

![Items](https://private-user-images.githubusercontent.com/141014255/286592336-9c77cd60-0552-4c1f-b3a3-47fd75be6976.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Mjk3ODI1OTEsIm5iZiI6MTcyOTc4MjI5MSwicGF0aCI6Ii8xNDEwMTQyNTUvMjg2NTkyMzM2LTljNzdjZDYwLTA1NTItNGMxZi1iM2EzLTQ3ZmQ3NWJlNjk3Ni5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQxMDI0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MTAyNFQxNTA0NTFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1jNzExOWI3ZjdmNWU4ZmFkODY2MTQwNTg2ZGJjMDUxODA0NjgxM2NlZTM0ZGNhM2E5NTIwY2M0NWIwMWJkZTEyJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.5XWPbN9-CzTNV_Y6_qUvN7EfUW4FBaJtFXVFR9uQdD4)

Item Ledger Entries Preview.

![Items](https://private-user-images.githubusercontent.com/141014255/286592390-83d1a7a4-04ae-4da0-bf25-0018369c0b16.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3Mjk3ODI1OTEsIm5iZiI6MTcyOTc4MjI5MSwicGF0aCI6Ii8xNDEwMTQyNTUvMjg2NTkyMzkwLTgzZDFhN2E0LTA0YWUtNGRhMC1iZjI1LTAwMTgzNjljMGIxNi5wbmc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjQxMDI0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI0MTAyNFQxNTA0NTFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1jZWFlNjk0MzAwOGU2YTgwMjdhMmRiNTlmMGNkODQxYjk4ZTBmZjU3MGI3MTA5ZDJjODAyZDA0MjJkYWNjNGYyJlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.ah8bcBiogCRAuSw3Aw_9xCXHjsTtFrFnFfe1ekCY_lA)

## DPS - Double Posting

This functionality is developed for posting transactions of class 9 – calculation of manufacturing cost of goods sold.

It is possible to enter these changes through Double posting settings on Account card using two different ways:

* [ ] Direct double posting on account
* [ ] Double posting through dimension group values

**In this section:**

| Feature                                                                                                                                                                    | Description                                                                                                                                                                       | Release |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| [Direct double posting on account](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-direct-double-posting-on-account)                           | This setting is used in case we want to directly post and create two additional class 9 entries, with each transaction posting, for the accounts pre-defined to have this ability |         |
| [Double posting through dimension group values](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-double-posting-through-dimension-group-values) | Functionality used if needed to set and post double-posting transactions through group dimension values                                                                           |         |

## AXR - Advanced Exchange Rates

Within this functionality, users are allowed to select a separate account for each posting group of customers/vendors, on which the realized and unrealized exchange rate differences will be posted. The need for this functionality arose from the accounting regulations which require that exchange rate differences from relations with Parent, Dependant and related legal entities be recorded in different accounts (about to accounts set in currencies).

An additional advantage that the processing includes is that the general ledger items resulting from the processing of exchange rate differences are recorded by the number of sources (number of customers/vendors).

Before working with this functionality, it is necessary to enter the NBS exchange rate on the day when the processing is done:

1. In quick search find Currencies
2. Select the currency for which you want to enter the exchange rate
3. Choose Process->Exch. Rates and enter the currency

Adjust Exchange Rates Setup

1. In a quick search, type Adjust Exchange Rates Setup
2. Choose New to add a new line
3. Enter posting groups, currency and corresponding accounts of realized / unrealized, gains/losses exchange rate differences

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-0c0b7a11-252b-4066-ab9a-20c0f2787e1f.png)

Lines on this list can be edited or deleted with the appropriate actions. Based on these settings when processing exchange rate, these combinations will be posted to the corresponding accounts.

After these settings, the Adjust Exchange Rates functionality can be started:

1. In a quick search, type Adjust Exchange Rates
2. Enter Starting/Ending Date for which exchange rate differences are to be calculated.
3. Enter other related data
4. Click OK to start the calculation and posting

## PGI - Inventory (Journal) Posting Groups

**Items General business posting groups**

This functionality allows to set gen. bus. posting group on locations that will copy to all item journal lines.

It can be done for different actions with items – transfer, assembly order, physical inventory, opening balance, revaluation, reclassification.

**I How to set gen. bus. posting group on Item journal batch**

This functionality regarding inventories enhancements allows to set up gen. bus. posting groups on *Item journal batches* that will apply to all item journal lines.

1. Find Item journal templates in Quick search engine
2. Choose template for adjustments and on Navigate tab, select *Journal batches*
3. Choose *Gen. bus. posting group* on Item journal batch that will be used as a default value with data in journal lines

**II Assembly orders**

We use assembly order to create items that are a combination of more items/resources and needed to be sold or placed in location as assembly on stock. In order to use this option, it is necessary to create an assembly item and adjust assembly setup.

**How to create assembly item:**

1. Go to items and create a new one. Choose inventory posting group
2. On Replenishment tab find Assembly section, and choose Assembly BOM – “yes”
3. New page will open. Add lines with items/resources to form your assembly item. Here you will define item tracking lines if needed

**Adjust Assembly setup**

1. Go to gen. business posting groups and define one for Assembly orders
2. Find Assembly set up, General tab and on field Gen. bus. posting group select posting group for assembly orders that is previously created
3. *Numbering tab* requires attention, meaning to select new no. series Assembly order nos., Posted assembly order nos. There are additional two fields for Assembly quote nos. and Blanket assembly order nos., if needed to use and adjust

Here you will find additional assembly setup options such as:

* *Stockout warning* : it specifies whether stock availability warning will appear during sales order entry
* *Default location for orders:* specifies in which location assembly order are created by default
* *Copy component dimensions from:* specifies if dimension is to be copied from item/resource card or Order header

**How to create and post Assembly order for stock**

1. Find Assembly orders and create New
2. Choose item assembly and quantity
3. Enter items in Assembly order lines
4. Check Posting tab, it should have pre-defined gen. business posting group for Assemblies
5. Post assembly order. Ledger entries for items/resources spent will show as Assembly consumption entry types, created assembly as Assembly output

**How to create assembly order within the Sales order**

You can create assembly order within Sales order document. Prior to this it is only necessary to have item defined as assembly, as shown in one of the previous sections.

1. Open new sales order
2. Fill in standard General tab fields
3. In Sales order lines, choose your assembly item and go to column  *Quantity to assembly to order* . Fill in with the number of quantity and then on drill down to record, new page will open. On the page, define item/resource lines to compose this assembly order
4. By posting the sales order, in the background, assembly order is created and posted; to check this, go to posted assembly orders, or check item ledger entries
5. Item ledger entries will be posted with Assembly gen. bus. Posting group, as defined in Assembly setup

III **Transfer orders**

Gen. bus. Posting group is to be created for transfer orders. It can be set up on Location card.

1. Go to Location. Create In-transit location and setup field Gen. bus. Posting group for “transfers”
2. Go to Transfer routes and define Transfer routes matrix
3. Set gen. business group for transfers in items journal batch for this activity

**How to create and post Transfer orders**

1. Search for transfer orders and create a new order
2. Set header fields – Transfer from, transfer to location
3. In-transit code should automatically appear, according to previously adjusted transfer routes
4. With previous steps, field Gen. bus. Posting group will automatically fill in, since it is modified within the location for transfer
5. Fill in Transfer order lines, post the shipment and receipt. Two documents will be created: Transfer order shipment and Transfer order receipt
6. Item ledger entries will be posted with Transfer gen. bus. posting group, as defined in header of the transfer order document

## DCT - Document Subtypes

Document subtypes provide possibility to post different types of transactions regardless of current settings on items, customers and vendors.

If any specific situation requires to set up new posting scheme (specific combination of posting groups and new G/L accounts), it can be achieved through this extension.

Companies can create document subtype for each business transaction, having at the same time a benefit of classifying transactions, sorting out and further use in internal analyses.

**How to set up document subtypes:**

There are Sales document subtypes and Purchase document subtypes. Instructions go for both Purchase and Sales documents, with remarks to eventual differences.

Go to search and type Sales document subtypes or Purchase document subtypes.

Click on New and set some of the standard fields:

1. *Document code* – short code for the document type you want to create
2. *Document description* – further details, description on your new document type
3. *General business posting group* – in most of the cases it will be more convenient to create new gen. buss. post. group in order to set up new posting scheme
4. *VAT business posting group* – create a new one if existing are not eligible to make combination
5. *Vendor/Customer posting groups* – this option exists if there is a need to change vendor or customer posting group for the purpose of specific posting scheme
6. *Payment method* – used to define payment method for our document type, it can be chosen as type of balance account (G/L account or Bank account)
7. *Check* if it is for Internal correction – for Credit notes and Return orders
8. *Document type* – it can be a choice between existing document types: offer, order, invoice, credit note, return order, blanket order.

This setting will affect on visibility within different document types. For instance, if our document subtype is for sales invoice, it will not be offered for selection in any other sales document.

10. *Posting number series* – serves to create new posting no. series for your document type
11. *Receiving number series* – if necessary, to define new receiving no. series
12. *Vendor/Customer name* – all can be set up only for a certain customer/vendor

**How to use document subtypes**

Document subtypes can be created and used in various transactions such as:

1. Sales/Purchase return
2. Sales/Purchase prepayment
3. Sales return for sales from the previous fiscal year
4. Debit and credit notes
5. Payment discounts and sales/purchase discounts
6. Different expenses, such as gifts given to customers for presentation of products etc

:::tip Note

 *Note* : It is necessary to add relation between new posting no. series and no. series of the standard posting document type. For instance, if we want to create new sales invoice document subtype, and our new no. series is PNS and our standard no. series for sales invoice is PKF, we need to manage relation between those two.

:::

This can be done through *No. series administration* – find your standard posting sales invoice no. series – go to  *Navigate – Relationships* . Add new no. series code to relate to this standard one.

| Feature                                                                                                                            | Description                                                                                                 | Release |
| ---------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ------- |
| [Purchase document subtype](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-purchase-document-subtype) | New purchase document subtype for returned goods may require updated VAT settings per specific regulations. |         |
| [Sales document subtype](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-sales-document-subtype)       | New sales doc subtype for testing new machine with used items                                               |         |

## PPE - Prepayment

Prepayment functionality enables posting of prepayments and preparing related prepayment documents according to local regulations VAT requirements.

Therefore, this feature requires and correlates with certain VAT functionality extension options.

The rule says that Prepayment sales invoice must be posted if prepayment was received from customers and items were not shipped in a period that prepayment was received. Respectively, prepayment purchase invoice is received from a vendor in case that company has paid for items that were not received within the same period when the prepayment was.

**In this section:**

| Feature                                                                                                                               | Description                                                                                                               | Release |
| ------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ------- |
| [Sales prepayments](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-sales-prepayments)                    | Shows settings and functionality of sales prepayment posting, prepayment invoices and final invoice for items or services |         |
| [Purchase prepayments](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-purchase-prepayments)              | Shows prepayment functionality regarding purchasing activities                                                            |         |
| [Prepayment credit memo](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-purchase-prepayment-credit-memo) | Information on how to reverse posted prepayment invoice                                                                   |         |

## ICA - Item Charge Assignment

Item Charge Assignment ICA is used to order certain items, dependent costs allocated according to certain criteria to those items.

The program can save the charge of the articles, e.g. transport or packaging - which can be added to ordered items.

Using this functionality, the cost of product purchase can be directly determined and analyzed.

By adding item charge (dependent purchase costs) to the order, costs can be allocated directly to the items.

Item Charge Assignment by Tariff Number

If a charge by Tariff number is used, the Tariff number must be defined.

* In the quick search, type Tariff Numbers and there you can enter the tariff numbers to be used:

| No.     | Description          | Rate % |
| ------- | -------------------- | ------ |
| 0210.19 | Komadi pilećeg mesa | 1,5    |

* After defining the tariff numbers, on the Item card enter the appropriate Tariff number for that item on the Cost & Posting tab.

On order/Invoice: Add a new shipping cost line for the newly created Order / Invoice.

1. Select the option Charge (Item) in the field Type.
2. Select in the field No. some Item charge
3. Enter 1 in the field Quantity.
4. Enter the Unit cost as well.
5. Click the button Line->Related Information->Item Charge Assignment. Run the Item Charge->Suggest Item Charge Assignment by Tariff Number.

After that, the costs will be distributed among the items.

After selecting the close button, a window will appear asking "Purchase Line has multiple item charge assignments. Do you want to split line per assigned item charge?" If you select "Yes", the program will split the cost into as many lines as there are items with a tariff no with the corresponding amount, if you select "No" the cost will be in one line with the amount in full.

*Breaking of dependent costs by dimensions* When we have several items with different dimensions on one purchase order/invoice and need to be assigned dependent costs, functionality has been developed that automatically creates separate items for each dimension combination ID when posting dependent cost related to multiple receivers or delivery.

## CSD - Cash Desk

Cash Desk operations include taking, keeping and issuing cash. Transactions cash in one company are done through the cash register . This functionality was developed due to the need to record cash transactions. Cash registers are based on the possibility of posting payment journals.

| Feature                                                                                                                                                | Description                                                                    | Release |
| ------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ | ------- |
| [Cash desk settings](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-cash-desk-settings)                                   | Description of important steps to follow for completion of functionality setup |         |
| [Cash Receipt List](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-cash-receipt-list)                                     | It is the process of opening journal in order to make the posting              |         |
| [Cash Withdrawal List](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-cash-withdrawal-list)                               | It is the process of closing journal in order to make the posting              |         |
| [Correction Select Lines and Reverse](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-correction-select-lines-and-reverse) | It is the process of correction select lines or cash order reverse             |         |
| [Closed and Post Cash Report](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-closed-and-post-cash-report)                 | It is the process closed and posting cash report                               |         |

## IFR - Item - FA Reclassification

This functionality was developed due to the need to record transactions related to fixed assets and items. Functionality was developed due to the need to put a certain item into use as fixed asset and that the system maintains the connection of these transactions through adjustment item cost job.

**How to set up Reclassification:** The path is as follows:

1. Type in search Item FA Reclass. Setup

Setup is done in table Reclass items to FA setup. It`s required to set No. series for documents, as well as posting groups, fixed assets posting type and balance account number for item and fixed asset. After that it’s required to enter source code for Reclass from FA to Item and vice versa.

**How to use Reclassification:**

| Feature                                                                                                                       | Description                            |
| ----------------------------------------------------------------------------------------------------------------------------- | -------------------------------------- |
| [Item to FA Reclassification](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-reclass-item-to-fa) | How to use Item to FA Reclassification |
| [FA to Item Reclassification](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-reclass-fa-to-item) | How to use FA to Item Reclassification |

## DIM - Dimension Management

Modify dimensions on posted entries If some dimension on a document has been posted mistakenly, this functionality enables changing posted dimensions on posted entries.

1. Go to General Ledger Entries and search entry that should be changed.
2. Choose Actions->Modify dimensions
3. Enter the new dimension
4. Press OK button to apply entered changes

Now on that G/L entry there must be a new dimension which was entered.

:::tip Note

If G/L entry, which is modified, has an account schedule (costumer/vendor entries, Fixed Assets entries, etc), modified dimension will be registered on that entries automatically.

:::

## YEP - Yea-End Process

All No. Series that we have created and that we use for easier tracking of all business changes and processes should be reopened for the next year.

| **Feature**                                                                                                           | **Description**                                                                                              | Release |
| --------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ | ------- |
| [Create No. Series Line](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-create-no-series-line) | When opening a new business year in BC, a new No. Series must be created that will be used for the following year. |         |
