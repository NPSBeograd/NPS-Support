---
sidebar_position: 10
---
# DPS - Double-Posting

## Direct double posting on account

Double posting should be active if one transaction (ex. Cost of materials) is to be recorded both on class 5 and class 9, by defining two additional accounts:  *Double posting – account and Double posting – balance account* .

In cases similar to this one, when one additional cost account is required, it is easy to define two additional double posting accounts (Double posting-account and Double posting-balance account). As a result, we will have regular G/L entries and additionally, class 9 entries.

1. Go to Chart of accounts and find Account number for double-posting. Edit Account card, and on the *Posting tab* activate *Double posting* option
2. Define *Double posting – account* and *Double posting – balance account*

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-9a1c3627-08d0-407b-869f-df3f11a66803.png)

## Double posting through dimension group values

Double posting accounts can depend on a dimension (Cost centre department or any other dimension).

You can select dimensions to be obligatory for double posting and to set up dimension groups codes for dimensions selected for double posting. Groups are related to dimension values. Needed is to define specific accounts for double posting (class 9) for each dimension group code (warehouse, purchase, sales etc).

If, for example, dimension for obligatory double posting was Cost centre dimension, as a result of this setting every posting on cost accounts brings related posting on debit side of class 9, depending on dimension group value for Cost centre that is used on a document.

With dimension group value selection, we practically pre-define posting result, meaning to which account will our transaction double-post after we select certain group dimension value. It is necessary to adjust dimension settings in order to respect this dependence.

1. Go to Dimensions and select dimensions for obligatory double-posting
2. Next search for *Dimensions* page, select *Dimension – Dimension values* from the ribbon, for dimensions previously selected for double posting
3. New page with dimension values will open. On the page, define *Group dimension codes*
4. Go to G/L account card – *Navigation – Double posting setup* and write down account numbers for each group dimension codes

:::note

For cost accounts, it is necessary to set dimension posting as required for cost centre.

:::
