---
sidebar_prepayment: 12
---
# PPE - Prepayment

## **Purchase prepayment credit memo**

If there has been a mistake with posted Prepayment invoice, it can be reversed with credit memo documents, Sales credit memo for Sales prepayment invoices and Purchase credit memo for Purchase prepayment invoice.

The process is similar, here is to be explained on Vendor prepayment example.

**How to undo posted Purchase prepayment invoice**

1. Open new Purchase credit memo document
2. Enter Vendor no, date, document no, and G/L account for Prepayment VAT account in document line (27200) and type 1 in Quantity column field
3. On tab General, choose Applies - to Doc. Type (payment, invoices...) and Applies-to Doc. No.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-b848ff1c-9c52-4113-a29d-a1d2fb1b2290.png)

4. Go to Invoice Details tab, check Prepayment “yes” and choose prepayment no.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-5436608e-93ea-40c5-8415-e44018bd11b4.png)

5. Post Purchase credit memo; as a result, prepayment invoice will be reversed and linked to purchase credit memo

## Purchase prepayments

The settings are similar to sales prepayment, only with different accounts and posting groups.

**Purchase prepayment settings**

1. Go to Purchase & Payables setup
2. *Check advance prepayment before posting* : activate this option of you want the system to recognize before posting if prepayment % is defined on Sales document lines is actually paid/connected to sales order/invoice

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-ae96ed13-2dd0-416a-ae9c-a81dceb00830.png)

3. On Numbering tab, set series nos. for Prepayment purchase invoices and Prepayment purchase credit memos

**Vendor posting groups setup**

It is necessary to create Prepayment posting group and Prepayment invoice posting group for purchase and to combine them with standard vendor posting groups expected to send prepayments to.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-52b72354-4134-405f-b1d6-f04cf5217570.png)

**VAT posting group settings**

It is required to set up new VAT product posting group and VAT sales account for prepayments and to create relations with vendor posting groups.

VAT product posting group needs to be set with, there is an example with domestic vendor:

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-e9248306-9422-4934-8d2d-4021e15fc2b0.png)

**Purchase prepayment posting**

Purchase prepayments are posted through bank statement. Within Payment journal lines, there is a field to mark payment as a prepayment. With that field and selected Vendor/vendor posting group combination, prepayment will post as previously defined through vendor posting groups settings.

After prepayment posting, next step is to create and post purchase prepayment invoice, to show VAT amount within the prepayment. This can be done through Purchase order or purchase invoice documents.

**Create prepayment invoice through Purchase invoice:**

1. Open new purchase invoice document
2. Fill in General tab fields as usual
3. Go to purchase invoice lines and type Purchase prepayment VAT account (from this example it will be 27200)
4. Go to Invoice detailes tab, check Prepayment “yes” and choose prepayment no. This will automatically fill in amount without VAT filed in purchase invoice line

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-eb5ee381-76d3-4a15-a8c9-e595176b678d.png)

5. Post the document and check for G/L entries

**Create final purchase invoice**

1. Open Purchase orders/Purchase invoices list and create a new one
2. Fill in standard General tab fields and document lines
3. On tab *Actions – Functions – Apply entries*
4. Choose payment you want to apply invoice with and go to *Process – Set applies to ID*

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-6cf1d83e-f92a-4fbd-bcf5-1582515251fc.png)

6. Post Purchase order/Invoice
7. Check Vendor ledger entries

## Sales prepayments

▪️ **Sales prepayment settings**

1. Go to *Sales & Receivables setup*
2. On Numbering tab, set series nos. for Prepayment invoices and Prepayment credit memos

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-5654040e-e662-4ae3-b3d7-98e2ee7e1b15.png)

**Customer posting groups setup**

Type in the search bar Customer posting groups. It is necessary to create *Prepayment posting group* and *Prepayment invoice posting group* and to combine them with standard posting groups expected to receive prepayments from.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-be8870e9-a3bc-42c9-9d75-4640bd4a3996.png)

**VAT posting group settings**

:::warning

It is required to set up new *VAT product posting group* and *VAT sales account* for prepayments and to create relations with customer posting groups.

:::

VAT product posting group needs to be set with:

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-2b07f3a1-4253-4cec-856a-c65468e68266.png)

**Prepayment posting**

Sales and purchase prepayments are posted through bank statement. Within Payment journal lines, there is a field to mark payment as a prepayment. With that field and selected Customer/customer posting group combination, prepayment will post as previously defined through customer posting groups settings.

After prepayment posting, next step is to create and post prepayment invoice. This can be done through Sales order or Sales invoice documents.

**Create prepayment invoice through Sales invoice:**

1. Open new sales invoice document
2. Fill in General tab fields as usual
3. Go to sales invoice lines and type Sales prepayment VAT account (from this example it will be 47200)
4. Go to Invoice Details tab, check Prepayment “ *yes* ” and choose prepayment no. This will automatically fill in *Amount without VAT* field in Sales invoice line.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-76e0eaa0-2cd0-4147-baf2-2e08a0f70513.png)

5. Post the document and check for G/L entries

**Create final sales invoice**

1. Open Sales orders/Sales invoices list and create a new one
2. Fill in standard General tab fields and document lines
3. On tab *Actions – Functions – Apply entries*
4. Choose payment you want to apply invoice with and go to New – Set applies-to ID

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-b82b1206-81e8-48db-bb1b-1fea0d075c74.png)

5. Go back to original document and Post Sales order/Invoice
6. Check Customer ledger entries
