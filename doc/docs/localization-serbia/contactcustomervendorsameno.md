---
sidebar_position: 4
---
# CCV - Contact Customer Vendor same No

## Create Contacts from Customers

This processing should be started if the Customer was first created from the Customer table and the Customer/Vendor same No. setting was not active (if the setting is active, the contact would be created automatically). So, the Customer (which was entered before the setting) should also be in the contact list. To ensure this, it is necessary to make the previously described settings, and then start processing:

1. In the quick search type: Create Contact from Customer
2. Enter the required Customer filters on the form
3. OK

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-8b8ebd48-d4cb-4b83-aba4-914e3cf63a93.png)

Contact with the same number as the Customer is now in the contact list.

## Create Contacts from Vendors

This processing should be started if the Vendor was first created from the Vendor table and the Customer/Vendor same No. setting was not active (if the setting is active, the contact would be created automatically). So, the Vendor (which was entered before the setting) should also be in the contact list. To ensure this, it is necessary to make the previously described settings, and then start processing:

1. In the quick search type: Create Contact from Vendors
2. Enter the required Vendor filters on the form
3. OK

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-fbcdcecf-085d-4cb5-b198-e795656bdc18.png)

Contact with the same number as the Vendor is now in the contact list.

## Creating a Customer from a Contact card

Setup In order to use this functionality, it is first necessary to define the Number series:

1. In a quick search type Sales and Receivables Setup
2. On the tab Number Series, define the Customer Nos

*Hint:* *Number series for Customers can be the same as for Contacts, or they can be different, in which case if a Customer is created first, Contact with the same Number series as the Customer will be created automatically. [Check link](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-create-contacts-from-customers)*

Creating

1. Go to Contacts
2. Click New, or find an already created contact
3. Fill in the required fields (No., Name, Adress...)
4. Go to Actions-> Functions->Create as->Customer
5. Choose the appropriate Customer template

![image.png](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-378d1aac-5132-459c-9c9f-8a10f4e68c07.png)

Check the Customers list, there should be a Customer with the same number and data as the contact and with the settings as the selected [template](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-customer-vendor-templates).

## Creating a Vendor from a Contact card

▪️ Setup

In order to use this functionality, it is first necessary to define the Number series:

1. In a quick search type Purchase and Payables Setup
2. On the tab Number Series, define the Vendor Nos

*Hint:* __Number series for Vendors can be the same as for Contacts, or they can be different, in which case if a Vendor is created first, Contact with the same Number series as the Vendor will be created automatically. [Check link](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-create-contacts-from-vendors)

### ▪️ Creating

1. Go to Contacts
2. Click New, or find an already created contact
3. Fill in the required fields (No., Name, Adress...)
4. Go to Actions-> Functions->Create as->Vendor
5. Choose the appropriate Vendor template

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-5385b0bf-66dd-4702-be1d-5696bfe4e8a4.png)

Check the Vendors list, there should be a Vendor with the same number and data as the contact and with the settings as the selected.

## Customer Vendor-templates

Customer/Vendor templates are used to map the data from the contact to the Customer/Vendor. The Customer/Vendor card gets some more features that are defined for the group of Customer/Vendor on the template card, e.g. posting groups, country codes, territories, payments... These are additional data, which the contact does not have, and which greatly affect the transactions that will be performed later with the Customer/Vendor.

### ▪️ Setup

Typically, the system offers templates that are created on ***Contact Conversion Templates*** only when creating a customer from a contact card. In order to be able to use appropriate templates for both Customers and Vendors, it is necessary to enable this functionality first. In the quick search, type  ***Feature Management*** , in the newly opened window it is necessary to enable the option ***Feature Update: Conversion templates to convert contacts to vendors and employees***

### ▪️ Vendor templates

Setup

1. In the quick search type ***Vendor templates***
2. Choose New

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-51bb566d-4c4e-45ae-b1f7-0e606a574e1d.png)

3. On ***the ***General tab****** enter Code, Description, Contact Type

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-1c13600d-6ec0-4da0-9b7f-74301b908f68.png)

4. On ***the Invoicing tab*** enter appropriate posting details (such as Gen.Bus.Posting Group, VAT Bus. Posting Group, Customer Posting Group)

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-abfd0455-0087-47c7-9da2-efb3b78988e5.png)

5. On ***the Payments tab*** enter the payment settings.

### ▪️ Customer templates

Setup

1. In the quick search type _**Customer templates**
2. Choose New

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-dff69a1c-989c-402b-8c70-cc276b9d68a8.png)

3. On ***the ***General tab****** enter Code, Description, Contact Type

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-7bfc0492-221f-4873-8839-d64492d6d65d.png)

4. On ***the Invoicing tab*** enter appropriate posting details (such as Gen.Bus.Posting Group, VAT Bus. Posting Group, Customer Posting Group), Prices and Discounts

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-88ed63ad-2830-4bf5-ae61-a4428b272bbe.png)

5. On ***the Payments tab*** enter the payment settings.
