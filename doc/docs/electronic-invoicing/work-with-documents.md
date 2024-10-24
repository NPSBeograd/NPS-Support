---
sidebar_position: 3
---
# Work with documents

## Purchase

**1. Get Purchase Invoice**

In order to get electronic invoices from the portal, we enter Purchase e-Invoices in the search box, then select Electronic Invoicing -> Get purchase invoice from the Actions tab.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-715da585-c6bd-43d2-8de0-cabc18a7095b.png)

After confirming we want to get invoices from the portal, a new window pops up offering us the option to choose which invoice we want to download.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-69589da0-03c2-4ed5-85f2-2a1e0b8ad86a.png)

If we want to download an individual invoice, then we enter the ID which is found on the portal in the designated field. The ID for the individual purchase invoice can be copied from the URL, as seen in the picture.

![image.png](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-1de56b31-ce14-45d6-a8a2-89bce70644a6.png)

Once the download is done, you get a confirmation that the download was successful, as shown in the picture

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-f085c079-c879-4d50-910f-77594a07083f.png)

When we open the downloaded invoice (2x click on the invoice) in order to accept it we start the process of posting the purchase invoice. In addition to accepting, we also have the option of rejecting incoming invoices on the same page.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-0a01a0d5-8fcd-466d-a94a-cbd8d023696b.png)

After accepting it, we will receive a confirmation message, as shown in the picture

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-a521d5fc-eac1-4b2b-b6bd-43e379a7ddfb.png)

**2. Create incoming document**

After the invoices have been downloaded from the portal, we create the incoming document from the same page where we confirmed the accepting of the invoice by clicking on the function Related -> Incoming document -> View document, as shown in the picture.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-fc5841d3-0366-4bf4-b9dc-21c2090f3655.png)

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-ea1bee4c-dbde-4a71-b592-317dd0fcdf75.png)

Once the window opens, we get a document for posting by clicking the record.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-dca8671e-c999-497e-b2e3-b537386a95af.png)

After entering the lines, we can post the document.

## Sales

**1. Invoices**

The process of creating sales invoices is done in a standardized procedure by entering sales invoices in the search bar and creating your new sales invoice for the respective customer. For the purposes of sending the data specification together with the sales invoice/order document, it is necessary to define the tax liability method field. The tax liability method field is located in the output document in the electronic invoicing section. The field gives us following options to choose from: trade date, issue date, payment date.

The standard value is set to "trade date" which means that the invoice will be submitted to the portal in the tax period with the date the document is posted in the system.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-935e8273-5c65-4b8d-b5be-03ccc6a95a3a.png)

After filling in both the header and invoice lines, by clicking on “Post and Send” the invoice is posted and sent to the E-Fakture portal.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-407943b5-4f07-4178-a4db-04c2d308f166.png)

If the sending of invoice is successful, after posting, l the system will provide information about the document being successfully sent.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-517de80c-34ae-4abe-b287-ca5eac9204eb.png)

If the posted sales invoice we intended to send over to the E-Fakture portal is rejected during sending the system will report an error, depending on what the error is.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-fab6142c-9ee1-4837-ab70-d877ba5268df.png)

In the same (posted) document, located in the electronic invoicing section, there are fields showing the sending status and the code under which the invoice was registered on the E-Fakture portal.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-0f32d7ca-7ed0-4405-957d-c16b8079ec53.png)

**The E-Invoice error text field** - shows the description of the error if the invoice was not successfully sent
**The E-Invoice status** - Shows the eInvoice statuses on the E-Fakture portal (Sent, Cancelled, Rejected, Approved...)

**2. Get invoice status**

Once the invoice is sent to E-Fakture, the first status of the invoice reads "Sending". When the customer either approves or rejects the invoice, this document gets a new status on the portal, but this does not mean that the status of the invoice in Business Central will change at the same time. The status of the invoice can be updated by clicking the "Get invoice status" command in the posted document. On the action tab, select Electronic Invoicing, followed by Get Invoice Status.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-2462abf9-3c23-4490-8a20-0fe603ad7855.png)

If we want to get the status of several issued invoices, we can do so from the list of posted invoices by selecting several invoices from the list, also on the action card, as shown below.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-1838da60-1f41-4b0b-b61d-a56df6c91ee5.png)

After getting the status, the system will confirm that the processing is completed as shown in the picture.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-670e80ae-55fd-4b92-afda-07c2eda842a8.png)

If our customer is a public company, both PIB and JBKJS numbers are sent from the customer’s card, on the basis of which SEF will then make the transfer to SUF (Serbian: SUF - Invoice management system).

 **3** . **Credit memo**

This type of document is created in the same way as a sales invoice. The only difference is that the document must be marked as a “Debit Document Type” by toggling the "Debit document type" button in the sales invoice’s electronic invoicing section as shown in the picture.

We always select the invoice related to the charge memo, the invoice whose value should be increased by the amount of the Charge memo. When we marked that it is Debit Document Type, we must select Source Invoice No. or to enter a date (period, month, day) in the Date Period field.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-8ea822c6-a740-4deb-9c0a-372ac8baf794.png)

The further steps of filling out and posting the document are identical to regular invoices.

**4. Prepayment invoices**

When it comes to working with the prepayment invoices given to the customers, it is necessary to set the tax category in the VAT Posting Setup field, as shown in the picture. Enter the VAT posting setup in the search section and when you find a line with the customer VAT Bus Posting Group (in the example, KDOM) as well as the VAT Product Posting Group (in the example A10 and A20), in the Tax Category, it is necessary to enter category S.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-893a0dfb-92a8-4e6c-adab-dc8248994c6f.png)

The process of creating a prepayment invoice remains unchanged. The header of the document as well as the lines with the amount of VAT are filled out. The E-Fakture portal will recognize that a payment invoice is being sent as the document is marked as “prepayment” in the part where the payment is linked to the prepayment invoice. When creating a prepayment invoice and before sending the invoice itself, it is necessary to set the Tax Liability Method in the electronic invoicing section. When it comes to the prepayment invoice, the payment date is selected, as shown in the picture.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-45323bd3-cdbf-4ee0-85c1-412c5d284519.png)

**5. Credit memo**

The creation of a credit memo also remains unchanged. If the memo is created by copying the sales invoice, in the credit memo header, the field called "Applies-to Doc. No” is filled out with the invoice number to be reversed/accepted. The same number that is filled in Applies-to Doc. No will be filled in independently in the Electronic Invoicing section in the Source Invoice No field.


Date Period - enter the date or previous (months). Date Period will be filled in if we do not have filled in Source Invoice No. When we have the Invoice Source field filled in, we don't need to fill in the Date Period field.

After filling in the header and rows, the memo can be posted further and then sent to the E-Fakture portal.

In order to successfully create a credit memo, it is necessary that the account we want to reverse is in the accepted status accepted by our customer. When the account has the status approved, then it is possible to make a correction, i.e. reduction or desk account.
