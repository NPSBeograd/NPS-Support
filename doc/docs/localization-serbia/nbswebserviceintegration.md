---
sidebar_position: 2
---
# NBS web service integration

## Service setup

There are pre-conditions for this extension to be activated.

* Company's membership in National bank of Serbia web system
* Installation of digital certificate

Find from the menu or search for  *Setup&Extensions* ,  *Service connections* /*NBS Setup.*

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-0b41cdd3-9882-4269-bd09-65cecee501c3.png)

Click on NBS Setup, then  *Setup* .

Enter  *NBS user name* ,  *NBS password* ,  *NBS licence ID* . The rest will be automatically filled in by clicking on  *Set URLs to default* .

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-b4e15ed0-fcab-417f-8dd6-ee6798749bae.png)

Click on " *Test connection* " action.

If needed, check "Block customer if bank is blocked" and/or "Block vendor is bank is blocked".

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-a47f10ac-a088-4f2d-83fa-c1f8b1077b9d.png)

## How to use

Below is the list of all available actions included within this functionality.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-0a2fbf2c-947c-482e-b111-5bf766ffa336.png)

### **Local banks**

This action will import all the information about state registered banks - name, address, contact info, homepage.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-2cb4e417-1154-4196-9c33-26d2ae6e3ef3.png)

### **Currencies**

This action provide complete exchange currency list.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-d7d5ec3c-b31c-42e2-84de-7bea101b71f9.png)

It also provides NBS exchange rates import - through daily job, or action when needed. Daily jobs settings are placed within Job queue entry, where parameters can be edited if necessary.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-a64a14bc-1724-41ae-a13a-99e646b19f61.png)

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-fbca2187-78ec-4670-b099-ed2afb61958b.png)

### **Activities**

Provides info of designated industry groups.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-586304f8-5c16-4848-a0f1-5bbad73f51ff.png)

### **Territory regions**

Updates information about state regions:

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-b9ee9757-9c75-4093-b9be-857dcd55212d.png)

### **Countries**

It downloads countries database.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-1d25ee03-b7bd-41b9-89af-c57a675bf3f3.png)

**Partner data**

This action can be called through customers/vendors cards:

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-132daba1-a8fa-4b1c-898d-844d41cccedd.png)

It updates partner's data information - name, address, region, registration date, activity ...It is necessary to have Registration no. recorded on Customer/Vendor card in order for this action to work. It can also help to create new contact - by adding only registration no., the rest of data will be inserted.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-120f9134-f91b-48fa-a21b-8cebc6dcb3fa.png)

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-a3536f95-a525-4d0e-973a-580f310fed1f.png)

It also serves to link industry activity to contacts and can be used further for marketing segmentation for different industry activities. New contact can be also created from the Contact list:

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-f856d4b2-ca9a-4938-9462-5cb78eb5ef69.png)

New window will open, to type either Registration no, or VAT registration no.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-daf44b76-6b8a-4739-ab3f-ad75afac8657.png)

With confirmation, company data will show, and with confirmation, new contact is created.

### **Customer/Vendor bank accounts**

It is enabled to insert and update partner's bank accounts. This action can be initiated for all customers and vendors, or for particular ones, through customer/vendor cards. It works only if VAT registration number is familiar.

### **Daily jobs for currencies and bank list update**

It is possible to set up daily jobs, actions that will occur on daily basis, on the exact time, to update the last published exchange currency list and bank list.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-b1b7d61c-537f-4f59-91c5-4b1a770cdb92.png)

## Import data from NBS

Importing a list of contacts could be done by invoking these two actions:

1. Download Excel template
2. Customer/Vendor from Excel

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-ae3e5529-0250-4523-b5c3-45c4524dc909.png)

***1.Download Excel template*** - Excel contains all important data for creating a contact card (customer and vendor)

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-e76fbe1a-9082-4f87-96e8-759881271639.png)

The following fields should be filled in:

* VAT Registration No.
* Registration No.
* Customer Templates
* Vendor Templates
* Old customer No - if you transfer data from the previous software
* Old customer name if you transfer data from the previous software
* Old vendor No - if you transfer data from previous software
* Old vendor name - if you transfer data from the previous software

Mandatory fields that need to be filled in are VAT Registration No. or Registration No., Customer Templates and Vendor Templates. If there isn't  such data, contact, customer and vendor won't be created . Other fields from the table should be  filled in if you need that data.

***2.Customer/Vendor from Excel*** - Invoking this action the data will be imported from Excel

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-c00ca2e9-3058-434d-b163-52173861aafa.png)

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-d8cd3694-f996-402c-b37f-0f44be42c5fd.png)

On the request page button choose will allow us to select the excel document that we want to import. If any vat registration number is not correct, you will receive error message.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-eb0d8f60-f94b-4d47-b91d-ee575b1b5725.png)
