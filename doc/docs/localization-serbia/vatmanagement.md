---
sidebar_position: 8
---
# VAT - VAT Management

## VAT Book Groups

VAT Book Groups In order to be able to define the lines of a VAT reporting form, it is necessary to define VAT Book Groups.

In one VAT Book Group, all [VAT identifiers](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-vat-identifiers) belonging to that VAT Book Group are defined.

VAT Book Groups Setup

1. In quick search type _VAT Book

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-940d982d-819a-4b52-b41c-e007faf39ae4.png)

2. Enter: Code, Book Link Code, Description
3. In a field *Group Type* choose *VAT entries* if VAT data is to be entered or *Total* if the entered data are to be calculated
4. In the field *Totaling* enter the range of VAT Book Groups to be calculated if the *Group Type* is Total (choose from list ". . .") or leave blank if the *Group Type* is VAT entries.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-4930109e-0b6a-492a-b65f-74b227154961.png) VAT Book Groups Identifiers

When the lines of a VAT Book Groups are defined, it is necessary to state the VAT Book Groups Identifiers belonging to that group for each row:

1. Select certain line
2. Choose *VAT Identifiers*
3. Select from the list the [VAT Identifiers](https://github.com/NPSBeograd/NPS-Support/wiki/Localization-features-(Serbia)#-vat-identifiers) required

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-168f1636-840c-4142-96cd-f56f107e4374.png)

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-bdf237d2-8324-4dee-a47d-3d7e70c80159.png)

## VAT Identifiers

VAT Identifiers

This topic describes the posting of VAT Identifier when posting VAT entries for a certain combination of VAT Product Posting Group and VAT Business Posting Group from VAT Posting Setup that is entered on an unposted document to VAT Entries.

In order for the amount of VAT to be correctly displayed in a certain VAT book, it is necessary to create the corresponding VAT identifiers. They will be listed later in the VAT identifier field when creating and setting up a VAT book. For easier connection, the Identifier should have the same code as the field in the POPDV form.

VAT Identifiers Setup:

1. In quick search type *VAT Identifiers*
2. Choose *New*
3. Enter *Code* and *Description*

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-dcf0b3c0-a784-442f-bdfc-27a85153784c.png)

## VAT Books

VAT Books In accordance with the valid legal regulations related to VAT, in Serbia, there is an obligation to keep appropriate VAT records. In order for the VAT to be adequately calculated and reported, the functionality of the VAT book has been created, which users can adjust themselves for the necessary reports such as KUF, KIF, POPDV ... VAT Books Setup

To access the setting of VAT books, type VAT books in the quick search

POPDV

Books should be defined so that each unit within the POPDV form makes one VAT book.

For each VAT book, it is necessary to set:

* column names,
* VAT book groups and identifiers,
* set amount displays,
* export tags in XML.

1. Click *New* to create a new book
2. Enter the VAT book code (1,2,3… 11) in the code field
3. In the *Description* field enter the name of that book.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-3212c8d2-05f9-404f-92e8-bef9bdd9c507.png)

After entering the new VAT book, as one unit of the POPDV form, it is necessary to set the appropriate columns:

Go to process->Column Name Setup

1. Click New to create a new line
2. Enter Column No. and Description

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-136cbf7a-fe9b-4e52-ba92-bce05ed37649.png)

After adjusting the columns, the lines of the form are adjusted. This is done through  *[VAT Book Groups](https://dev.azure.com/npsbeograd/NPS-public/_wiki/wikis/NPS%20Home/136/VAT-Book-Groups)* . Each line of the POPDV form should be defined as one group within the VAT book.

Finally, it is necessary to define a formula for adding the amount:

1. Go to Process->VAT Book Setup
2. Clicking on the field defines the amount to be calculated in that field. Offered options:

* Operator 1 - Sign for the amount to be displayed in the Value 1 column. It contains two options (- and +). Depending on whether it is purchase or sales VAT.
* Value 1 - Clicking the arrow in this field opens a list of options that contains:

* [ ] Base Amount
* [ ] VAT Amount
* [ ] Amount Inc. VAT
* [ ] Base Amount (retro)
* [ ] Unrealized Base
* [ ] Unrealized Amount
* [ ] Unrealized Amount Inc. VAT
* [ ] VAT Retro
* [ ] Amount Inc. VAT (retro)

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-1a44e258-cec4-40d9-b558-87c1fdc8830a.png)

Once the POPDV form has been set up, a report review can be run:

1. Go to VAT Books-> Reportrs-> VAT Calculation Details
2. Enter the date filter (for example 010120..310120)

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-70471f2f-5aa4-4718-b4af-88cb5e4a246e.png)

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-16245974-c1d5-49d3-85f9-7991a44bd9ae.png)

## Postponed VAT

The Postponed VAT feature is used every time the VAT amount is to be suspended as it is not possible to settle it at a given time. In case when posting purchase invoice is in one accounting period and VAT is in another, it is necessary to postpone the deduction of the VAT amount.

Postponed VAT is used in sales and purchases.

VAT Posting Setup Before posting postponed VAT on purchase or sales invoice, VAT posting Setup should be created existing combinations should be changed.

SALES

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-a3005659-4074-42de-a06f-cb32843dde3c.png)

PURCHASE

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-87315732-e9ab-4262-a526-b2f5e34af210.png)

Post Purchase or Sales Invoice

1. Open Purchase or Sales Invoices and create a new document.
2. Enter data about vendor number, posting date, document date on General Tab.
3. Field VAT Date on General Tab must be empty, then description in field Postponed Vat on General Tab will be „Postponed VAT“

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-e16de340-b172-4617-a609-d40e5df89fad.png)

* Check General Ledger Entries for posted Purchase or Sales Invoice. VAT Amount is posted on the Purchase or Sales Postponed VAT Account.

PURCHASE

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-a68a7591-8eda-41b5-94f8-bbd6da901320.png)

SALES

* Check VAT Entries for posted Purchase Invoice.

| VAT Bus. Posting Group | Posting Date | Document Type | Type     | Base | Amount | Unrealized Amount | Unrealized Base |
| ---------------------- | ------------ | ------------- | -------- | ---- | ------ | ----------------- | --------------- |
| DDOM                   | 13.07.2020   | Invoice       | Purchase | 0,00 | 0,00   | 1.000,00          | 5.000,00        |

Realize postponed VAT on Posted Purchase Invoice

1. Go to Posted Purchase Invoices. Open document.
2. Choose Navigate->Invoice->Functions->Post Postponed VAT and enter VAT Date that should be posted for the Purchase Invoice.
3. Choose button OK to post realization of VAT to VAT Entries and to General Ledger Entries.

Check General Ledger Entries that are posted on realized VAT Date.

| G/L Account No. | Debit Amount | Credit Amount | Posting Date |
| --------------- | ------------ | ------------- | ------------ |
| 43500           | 0,00         | 6.000,00      | 13.07.2020   |
| 28990           | 1.000,00     | 0,00          | 13.07.2020   |
| 28990           | 0,00         | 1.000,00      | 13.07.2020   |
| 27000           | 1.000,00     | 0,00          | 15.07.2020   |
| 10000           | 5.000,00     | 0,00          | 15.07.2020   |

VAT Entries must be posted on realized VAT Date

| VAT Bus. Posting Group | Posting Date | Document Type | Type     | Base     | Amount   | Unrealized Amount | Unrealized Base |
| ---------------------- | ------------ | ------------- | -------- | -------- | -------- | ----------------- | --------------- |
| DDOM                   | 13.07.2020   | Invoice       | Purchase | 0,00     | 0,00     | 1.000,00          | 5.000,00        |
| DDOM                   | 15.07.2020   | Invoice       | Purchase | 5.000,00 | 1.000,00 | 0,00              | 0,00            |
| Correct postponed VAT  |              |               |          |          |          |                   |                 |

1. Go to posted Purchase invoice
2. Choose Navigation->Invoice->Functions->Correct postponed VAT
3. Enter VAT Date that should be corrected
4. Choose button OK to post VAT Entries and General Ledger Entries.

Check General Ledger Entries that are posted on realized VAT Date.

VAT Entries must be posted on corrected VAT Date.Additional VAT Entry is created but original entry is updated with Remaining Corrected Base and Remaining Corrected Amount.

## Reverse Charge VAT

Reverse Charge Vat applies to some purchases from abroad. Purchases will be calculated according to Reverse Charge VAT, which is defined by the VAT Law.

For posting Reverse Charge Vat you need VAT posting Setup. Enter in the search bar VAT posting Setup.

Following fields need to be set:

• VAT Business Posting Group

• VAT Prod. Posting Group

• VAT Calculation Type

• VAT %

• VAT Identifier

• VAT % (retrograde)

• Reverse Chrg. VAT Acc.

• Purchase VAT Account

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-5d7e96ba-c28e-4f7a-8f67-1a60bcd4204c.png)

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-cbb0f3e6-4ace-410a-8c38-4bed800e17d7.png)

When you make this setup, you can post a purchase invoice. Two VAT entries will be created in the general ledger.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-4c743804-ed04-4c99-9872-3013ea67cfd9.png)

## Reverse Charge VAT - LCY
