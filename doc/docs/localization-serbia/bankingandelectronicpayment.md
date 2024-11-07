# EPE - Banking and Electronic Payment

## Set up bank accounts

The first setting when creating a bank account is the number series. Entering the search bar No. Series.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-5c30694b-49d8-414d-ab97-0c2d6bd7b1a1.png)

After that enter in the search Electronic Payment menu. Action New will open a new bank card.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-5469d6b3-c04d-4831-993b-ac3d700c2b53.png)

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-5d5c3e55-4a5b-4a6d-a7fc-f46725a63c8e.png)

### **How to set up bank accounts**

It is necessary to set up bank accounts – posting groups, currency, account number, no. series, source codes. For each bank you can set up  **General journal template** , defining type – Electronic payment, Bal. Account type – Bank account, No. series, and Source code.

![image.png](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-42d60968-ee34-423e-9377-56c2cc02a7bf.png)

You can set up *General journal batches* for each bank:

* *Copy VAT setup to journal lines* (whether the program calculates VAT for accounts and balancing accounts on the journal lines of the selected journal batch)
* *Insert XML data ports* requires to complete setup, depending on bank client, both for file imports and exports

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-f57f2548-a530-4f5b-b77b-a2929a47b035.png)

No series and XMPL port need to be entered on General Journal Batch.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-41f42cd1-aa94-4e77-9d6e-d37ca94381bf.png)

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-3a2ce683-5ea3-44a1-8026-cf33a7386f74.png)

## Payment suggestions

### **How to create vendors payment suggestion**

Go to  *Electronic payment menu* . Select bank you want to work with. Next step is to choose Preparation - El. payment journal will open. Choose option *Prepare/Suggest*  *vendor payments* . In new window, define important filters:

* *Last payment date* : Last invoice date that will be included in payment suggestions; all entries before that date and on the date will be included
* *Use vendor priority* : if there are limited payment funds, type in Available amount LCY and along with this filed the system will suggest lines by priority until this limit is entirely used
* *Posting date*
* *Summarize per vendor* : activate this option if all vendor entries need to show as summarized in one line
* *New doc. no. per line* - type manually if no. series are not set up If there are already suggested lines in other journal batch, the system will show warning, escaping the possibility to have duplicated payments:

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-36743dc0-ab18-4f5b-94e1-23c8ef7b936b.png)

**Vendor payments confirmation**

Next step is to select and confirm lines for payment. If all the lines need to be selected, choose  *Related/Payments/Confirmation* :

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-aa4b5efb-13da-4061-8bac-3ebfaaab325d.png)

Payment lines will be found in *Confirmation* at the Electronic payment menu:

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-cbf8f88c-de97-4002-a1d8-700a2e109763.png)

**How to create employee payment suggestion**

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-c30bec29-2ec4-4a79-a5d1-71a988be407d.png)

Similar to Vendor payment suggestion, go to Electronic payment menu, choose Preparation :

1. Suggest Vendor Payments.
2. Suggest Employee Payments.

Next thing to fill in is the request page

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-d1a785a7-1d7b-4510-98b7-98fc6245bbda.png)

## Payment import and export files

### **How to export payment journal lines file**

After the payment lines for vendors and/or employees are confirmed, these can be exported as txt. file, ready for import within the electronic payment app.

To export this file, go to  *Confirmation/Related/Payments/E-Payment export* :

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-ad47fcbd-125d-4563-8582-d5475136063f.png)

### **How to import bank statement**

From Electronic payment menu select  *Statement* :

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-518a276a-51c3-4c0e-99ac-653c78f046b8.png)

Next, go to *Related/Payments/E-payment import*

New window will appear, choose file for import (previously exported from el. payment app). During importing process, the system searches for customers/vendors by bank account. If there is no bank account on customer/vendor card, there will be a notification warning.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-ea5d9778-f75f-49b7-ac66-1c153d3c4eb7.png)

Even though some customer/vendors have not been found, all the transaction will be imported. Depending on side (Debit/Credit), the system will choose Account type (Vendor or Customer) leaving account no. empty if those lines have not been found.

If payment needs to post as prepayment, there is a filed *Prepayment* that has to be checked.

Vendor and customer ledger entries that are found by credit reference no. will be selected for application in "Applies to doc. no". If desired, further entries application can be completed through this journal.

After regular control of the statement, it can be posted through "Post" action on header.

## Sales & Receivables Setup

On the Sales & Receivables Setup page there is a field Def. Credit Ref. Formula Code. The field is adjusted and the formula is defined for further recognition. The field will be filled in on sales invoices and on posted sales invoices.

![image.png](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-856fe800-a28f-430f-96ec-7c1dfdb5bb51.png)

To create a code, choose select from full list.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-7a61bda3-1953-4965-a2ee-584e3b134a0d.png)

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-901db977-fe3b-49f3-8ec0-01fda55cb7df.png)

1. Code name is entered
2. Enter the description for the code
3. Model - it can be filled in, it is not a mandatory field
4. Formula - gives us a list where we can choose parameters
5. The maximum number of parameters allowed to be selected

Sales invoices - Invoice Detailes ![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-92aa0fc9-7589-4b9d-86c6-3a1261287799.png)

Posted sales invoice - Invoice Detailes ![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-b5d02bde-9982-40ba-888c-1bcb8b28e8f7.png)

The Credit Reference No field will also be filled in on the statement. When importing txt format.
