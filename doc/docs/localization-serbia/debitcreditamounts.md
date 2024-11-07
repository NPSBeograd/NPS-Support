---
sidebar_position: 7
---
# DCA - Debit Credit Amounts

## Change debit credit side

This functionality allows you to change posting side of transactions. It is provided to change in Customer ledger entries, Vendor ledger entries, Bank account ledger entries and FA ledger entries.

### ▪️ **How to change debit credit side:**

1. Go to G/L ledger entries
2. Choose entry you want to change
3. Go to Actions - Functions - Change debit/credit
4. It will automatically change side of your entry.

:::tip Example

1. Find posted purchase invoice
2. Choose entries to change side, for example vendor ledger entry
3. Check if it is adjusted in Vendor ledger entries

:::

## Red reversal posting

Sometimes a user wants to *Undo* shipment or a receipt. In these cases, it is more suitable to post this undo as  **red reversal** , causing opposite sign transaction on the same side, instead of making new net change entry on the related account.

**General Ledger Setup**

To use this functionality, you need to set up some fields on table General Ledger Setup.

1. Open General Ledger Setup.
2. On field Show Amounts on General tab choose the option All Amounts.

To simplify, in a standard transaction posting, take Purchase credit memo as an example. Without this option, posting entries would show:

| **G/L account** | **Debit amount** | **Credit amount** |
| --------------------- | ---------------------- | ----------------------- |
| 53100                 | -100,00                | -                       |
| 43500                 | 100,00                 | -                       |

If you choose and activate *Correction* on the Purchase credit memo general tab, posting will change:

| **G/L account** | **Debit amount** | **Credit amount** |
| --------------------- | ---------------------- | ----------------------- |
| 53100                 | -100,00                | -                       |
| 43500                 | -                      | -100,00                 |

It posts correction of vendor balance account on the same credit side, with minus as an opposite sign of the original invoicing posting.

 *Note* : In this example assumption is that our cost account 53100 has already set up posting only on debit side, as cost account usually have.

**Example with inventories**

The same functionality will correct posting on the same side, without creating new net change. Bellow you will find the example for Purchase credit memo.

*Purchase credit memo (inventories)*

| **Account number** | **Debit amount** | **Credit amount** |
| ------------------------ | ---------------------- | ----------------------- |
| 43500                    | -                      | -1200                   |
| 27000                    | -200                   | -                       |
| 13200                    | -                      | 1000                    |
| 13009                    | 1000                   |                         |
| 13000                    | -1000                  | -                       |

*13200 - Inventory account; 13009 - Inventory adjustment account; 13000 - Purchase account*

## "One-side"-posting

▪️ **How To Post G/L Accounts only on Debit or Credit Amount**

Most financial transactions are posted to the general ledger as they are entered on documents or journals. For example, if the amount is entered in the journal window as Debit Amount than the amount is posted on Debit Amount in General Ledger Entry.

For some accounts, there is a need to post the amount only on one side, for example, a Credit amount. For these cases, we can set posting only for a certain side on G/L Account Card.

**General Ledger Setup**

To enable functionality, you need to set some fields on table General Ledger Setup.

1. Open General Ledger Setup
2. Go to General tab
3. Find field Show amounts and select *All amounts*

As a result, both credit and debit side will show on different ledger entries: *G/L Entries Preview, General Ledger Entries, Apply Customer Entries, Apply Vendor Entries, Bank Account Ledger Entries, FA Ledger Entries, FA Error Ledger Entries, Fixed Asset G/L Journal, Fixed Asset Journal, Recurring Fixed Asset Journal, Maintenance Ledger Entries, Chart of Accounts (Analysis View), Chart of Accounts (G/L), G/L Entries Dim. Overview Matrix*

**Set up default posting on G/L Account Card**

Before posting general ledger entries, you should prepare setup on G/L Account Card.

1. Open G/L Account Card
2. Go to General tab
3. Choose Debit/Credit from options:

* **Both** : Posting of all general ledger entries as they are entered on General Journal
* **Debit** : Posting all general ledger entries only in Debit Amount side
* **Credit** : Posting all general ledger entries only in Credit Amount side

### ▪️ **I** **Post Journal**

Let’s set up one example by choosing G/L account that has a set up to post only on debit side. Our example G/L account will be 51201.

1. Open General Journal.
2. Enter G/L Account, that has setup for Debit posting
3. Enter the Credit Amount
4. Enter the G/L Balance Account
5. Choose Post action

| **G/L Account** | **Debit Amount** | **Credit Amount** | **G/L Balance Account** |
| --------------------- | ---------------------- | ----------------------- | ----------------------------- |
| 51201                 | -                      | 100,00                  | 70000                         |

**Check Ledger Entries**

1. Open General Ledger Entries.
2. Check if the amount is posted on Debit Amount (as a negative amount), which was set on G/L Account Card as default posting.

| **G/L Account** | **Debit Amount** | **Credit Amount** |
| --------------------- | ---------------------- | ----------------------- |
| 51201                 | -100,00                | -                       |
| 70000                 | 100,00                 | -                       |

### ▪️ **II Posting Sales Credit Memo**

If your Sales credit memo account is set to have posting on credit side, that will create the following situation:

1. Open Sales credit memo and create a new document.
2. Enter data about customer number, posting date, document date on General tab. Uncheck field Correction on General tab.
3. Choose Copy document to select the posted invoice you want to reverse and all change if necessary needed data on Lines Tab.
4. Post Sales Credit memo by choosing a post on the action.

:::info **Check Posted Sales Credit Memo**

1. Go to Posted Sales Credit Memo. Open document.
2. Choose button Navigate and open General Ledger Entries.
3. Amounts are posted on Credit Amount (as a negative amount), as defined in G/L Account Card defined for sales credit memo postings

| **G/L account** | **Debit amount** | **Credit amount** |
| --------------------- | ---------------------- | ----------------------- |
| 61400                 | -                      | -100,00                 |
| 20400                 | -                      | 100,00                  |

:::

### ▪️ **III Posting Purchase Credit Memo**

If your Purchase credit memo account is set to have posting only on debit side, that will create the following situation:

1. Open a Purchase credit memo and create a new document.
2. Enter data about vendor number, posting date, document date on General Tab. Uncheck field Correction on General Tab.
3. Choose G/L Account that is set as Debit posting and all needed data on Lines Tab.
4. Post Purchase credit memo by choosing a post on the action.

:::info **Check Posted Purchase Credit Memo**

* Go to Posted Purchase Credit Memo. Open document.
* Choose button Navigate and open General Ledger Entries.
* Amounts are posted on Debit Amount (as a negative amount), as defined in G/L Account Card.

| **G/L account** | **Debit side** | **Credit side** |
| --------------------- | -------------------- | --------------------- |
| 53100                 | -100,00              | -                     |
| 43500                 | 100,00               | -                     |

:::
