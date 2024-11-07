---
sidebar_position: 11
---
# DCT - Document Subtypes

## Purchase document subtype

Here is the example with new Purchase document subtype for transactions of return of goods sold. According to specific VAT regulation, in a certain situations this return is to be considered as new outgoing net change and requires new VAT settings.

Therefore, new VAT business posting group is POVDOBIZFA, set up to post this return through outgoing VAT account for sales (470001), instead of incoming account(270001). It is necessary to enter this account in Purchase VAT account field.

Also, there is a new Posting no.series created for this transaction type, PKFPOVDOB.

| **Code** | **Description**               | **Doc.type** | **VAT gen.buss.post.gr.** | **Posting no.series(Purchase hdr)** |
| -------------- | ----------------------------------- | ------------------ | ------------------------------- | ----------------------------------------- |
| POVDOBIZFA     | Povrat dobavljacu izl.fakt. izl.pdv | Credit memo        | POVDOBIZFA                      | PKFPOVDOB                                 |

If we select this new Purchase document subtype code, in Purchase credit memo General tab, posting result would look like in the table below:

| **G/L account** | **Debit amount** | **Credit amount** |
| --------------------- | ---------------------- | ----------------------- |
| 96000                 | -                      | 1000,00                 |
| 10009                 | 1000,00                | -                       |
| 10000                 | -                      | 1000,00                 |
| 470001                | -                      | 200,00                  |
| 43500                 | 1200,00                | -                       |
| 96000                 | 600,00                 | -                       |
| 10009                 | -                      | 600,00                  |

## Sales document subtype

In our example, there is a new sales document subtype for items in use to test new machine.

| **Code** | **Description**                      | **Doc.type** | **Gen.buss.post.gr.** | **VAT buss.post.gr.** | **Payment method code** | **Post.no.series** |
| -------------- | ------------------------------------------ | ------------------ | --------------------------- | --------------------------- | ----------------------------- | ------------------------ |
| POTZTPM        | Items expenditure for new machines testing | Invoice            | POTZTPM                     | PRESKPDVV                   | POZTPM                        | PFKRAS                   |

Defined sales account for this combination is set to be 62106 ( *Revenues from activating products to test the operation of a new machine* ).

VAT buss. post. group is PRESKPDV – VAT is defined to be 0% and new posting no. series is PKFRAS.

New payment method code is created as POTZPM, with Balance account type set to be *G/L cost account* 511400 ( *Spent products for testing new machine* ). Here we want to post this transaction as an expenditure, since the revenue will be equal to our expenses and to "close" customer balance with posting the transaction. You can create customer for internal purposes to post similar transactions.

As we post our invoice and choose subtype POTZPM in general tab on our sales invoice document, we get G/L entries from the table below:

| **G/L account** | **Debit amount** | **Credit amount** |
| --------------------- | ---------------------- | ----------------------- |
| 96000                 | -                      | 10000,00                |
| 98000                 | 10000,00               | -                       |
| 62106                 | -                      | 10000,00                |
| 20400                 | 10000,00               | -                       |
| 511400                | 10000,00               | -                       |
| 20400                 | -                      | 10000,00                |
