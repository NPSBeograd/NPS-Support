---
sidebar_position: 9
---
# RVE - Reverse

## Reverse orders

▪️ **How to set up reverse order functionality:**

1. First step is to set Locations for source type – Vendor, Customer or Employee. Search Locations and add a new one. The field „Location for outside goods“ is to be set with the value of source type and „Use as transit location“ needs to be checked.
2. It is necessary to adjust  *Inventory posting setup* . New locations/items combination is to be created fot posting items you want to enable transfering from/to.

:::tip *Example*

If our location is for Employees, and we want to transfer Minor assets, this item posting group has to be defined as in correlation with Employees location

| Location code | Inventories posting group | Inventory account |
| ------------- | ------------------------- | ----------------- |
| EMPL_LOC      | Minor assets              | 10100             |

:::

### ▪️ **How to create Reverse order:**

Go to search and find Reverse order list and select  *New* . There is a set of fields to enter data:

1. *No* : revers order number
2. *Transfer-from code* : specifies the code of the location items are transfered from
3. *Transfer-to code* : specifies the code of the location items are transferred to after items is returned from source type(employee, customer or vendor).
4. *In-transit code* : specifies the transit location where the item is located by the assignment, according to source type, this location correlates with the source type.

By choosing In-transit code, the field source type is automatically filled in. Next step is to choose source no – employee, vendor or customer number.

5. *Source type* : It will be employee, customer or vendor
6. *Source no* : Choose employee, customer or vendor number
7. *General business posting group:* choose business posting group for reverse orders
8. *Posting date* : the date when item release is posted  *Return date* : the date when item is expected to be returned from employee, customer or vendor

With reverse order header completed, next is to add items for transfer in Reverse lines tab:

1. *Item no* .: choose item
2. *Quantity* : choose quantity
3. *Unit of measure code* : write in unit of measure code

:::note

 When assigning item with tracing by lot or serial number, it is necessary to fill in tracing lines (*Lines – Item tracking lines – shipment)*

:::

### ▪️ **Releasing items – posted reverse shipment:**

After you have assigned items to specific source type and location accordingly, the next step is posting on path *Process – Post – Ship.*

It will create posted reverse shipment, assigning this item to the source type. The following status change changes *to* *Released* and field *Quantity shipped* is changed in Reverse lines.

With posted shipment reverse, two item ledger entries are posted:

1. Taking off quantity from *Transfer-from* location
2. "Placing" that quantity in *In-transit* location

Posted reverse shipment can be found from reverse order, through menu *Navigate – Documents – Shipments* and it is possible to print out the document.

### ▪️ **Return of items – posted reverse receipt**

When the source type (customer, employee or vendor) returns the item, it is necessary to post reverse receipt and return items to original *From-to* location. The steps for this action are from  *Reverse order – Process – Post - Receive* .

As a result, our reverse order is being deleted, since the process circle is completed, and we have two additional item ledger entries showing:

1. The quantity of items returned from source type *In-transit* location
2. "Placing" this quantity to initial *Transfer-from* location. There is an option to print  *Posted reverse receipts* , accordingly.

## Inventory reverse preview

In every moment, there is possibility to check items location (source type) according to reverse assignment/discharge. There is a report called  *Inventory reverse review* .

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-c465c6a1-1ff5-4964-8a74-cf42b9228a0b.png)

1. Search for this report and choose filters:
2. *Options–Print details* : choose "Yes" if needed to print even posted shipment/receipt reverse numbers and lines. If not, it will only show item quantity assigned with the source type
3. *No* .: number of posted reverse shipment
4. *Source type* : Employee, Customer or Vendor
5. *Location code* : choose one of the locations, for employees, customers or vendors
6. *Item no.* : if we want to check for the reverse order details for particular item no.
7. *Posting date* : it is possible to filter by posting date

Among all filters, Location code is obligatory for report processing.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-af90079f-1c2d-4349-8b76-7bcbf8ebfbe3.png)

As usual, there is an option to Send to, Print or Preview the report.
