---
sidebar_position: 2
---
# Settings

## **1. Obtaining of API key**

After registering on the E-fakture portal you need to select the "API management" section from the “Settings” menu.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-5bc6fe29-a500-4b0e-b6a3-61fd8c639da4.png)

Once the new page opens you need to toggle the “Active” button and copy the autogenerated password from the “Authentication key” field into the “API Key” field in the E-Fakture service settings within 365 Business Centre.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-16cfa0a6-b72f-4687-a617-7a0d908a96a2.png)

After the settings have been adjusted, the user does not have to log into the E-Fakture portal in order to send an invoice since they will be able to regularly create and post documents through Business Central as usual. Logging into the E-Fakture portal is only necessary if there arises a need for more detailed document checks or changes to the settings.

## **2. Service Connections**

After the API key is obtained it is necessary to enter said API key into further settings in Business Central. By entering the Service Connections search you are to select EIN e-Invoice setup.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-e942648d-0509-4dd3-8850-2abbd46cf46e.png)

After selecting it a new page for setting URL addresses opens and the entry is made by clicking the Set URLs to Default, and subsequently by confirming the Enabled function via the toggle button.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-62729b72-73f2-4727-8283-a962e235c427.png)

In the same setting, in the Treasury section, fill in the data essential for integration with the treasury. In the Treasury section, enables us to send created invoices to the central register of invoices. The fields should be filled in as shown in the picture. The Fields are filled in by clicking on Set URLs to Default.

* KJS Usergroup : guests
* KJS Username: guests
* KJS Password: guests
* KJS Types for Sending in CIR: 0,1,2,4,5,6,9,10,11 – KJS is entered, which will be sent to the Central Register of Invoices. Every customer who has a defined KJS number on their card will be sent to the Central Register of Invoices.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-8d82582a-0c07-43af-8ec8-76dbc9b79359.png)

## **3. Electronic Documents Formats**

To access the formats, you need to set the following: Type the keyword Company Information in the search bar and set the user experience to premium. The following image represents the tab page that will open after the search.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-4b77b051-e3a2-4432-a23f-1e6131d91904.png)

For the purposes of automatic sending of invoices during posting, it is necessary to set up profiles for sending on each individual customer's card, explained below. In order to create a profile for sending documents, you first must create an electronic document format. In the quick search find Electronic Documents Formats and create a sales invoice and sales approval format as follows.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-5566e7e2-0c61-4c28-8a4a-082ee59608ed.png)

Enter the format code and select the sales invoice/sales approval and the corresponding object ID, as shown on picture below (For code unit IDs - NPSEIN Generate File, and for delivery code unit IDs - NPSEIN Integration)

Note: It is mandatory that both invoice and approval have the same code in order to be linked with a sending profile.

The next step is creation of Document Sending Profiles. In the search bar type Document Sending Profiles and create a new profile by clicking the “New” button.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-b11b9825-84eb-4147-9ec5-6f1f3ec3ed55.png)

Assign a code to it and choose Document Exchange Service and a format that was previously created in Electronic Document formats, as shown on picture below. By default, the check mark signals that the sending profile will be incorporated for all customers, unless a different sending profile is set in the customer card itself.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-419fb435-b805-4e6d-aa92-9115bb62b53f.png)

Afterwards, in the general section of the customer card, in the sending documents profile field select the created E-Fakture profile.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-c4306fe2-a8f6-463d-88e2-0e89db6981a9.png)

All customers’ cards whose profile is set up in this way can send e-invoices during posting by selecting the Post and Send option. If this setting is not set, sending can be done in one of the following two ways:

1. From the list of posted invoices (in the quick search, type posted sales invoices to get a list) it is necessary to mark the invoice on the list, as shown in picture.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-04ca54b7-66b2-41af-b43f-1a3f1d3b8e85.png)

2. From the very posted document itself (the posted document is opened by clicking the invoice number from the posted invoices list), as seen in the picture below

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-4f81cc5c-849c-4034-ac47-489e48bdab16.png)

In both of these cases, sending is always initiated from the Actions -> Electronic Invoicing -> Send Sales Invoice

## **4. VAT Posting Setup**

On the VAT posting setup, each combination of VAT posting that is used for invoicing should be marked with a corresponding letter in the "Tax category" field. In the search, type VAT Posting Setup, select the VAT Business Post. Group and add the tax category on the VAT posting setup tab itself, as in the picture.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-25bdf9dd-9ad5-4ad4-8569-29f4e174bb94.png)

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-5bd17c6c-0e0b-429c-8f75-911cf8111d08.png)

According to the current Tax Administration instructions, VAT categorize are defined in the following manner

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-98cd96bd-e16e-484a-a7a5-0e19bf3ea8ed.png)

Based on the previously listed categories, the settings should be set so that 20% VAT can indicate the letter "S", exemption from VAT can be indicated by the letter combination "AE", etc.

## **5. VAT Product Posting Groups**

In the case of a sales invoice with a line of 0% VAT, it is mandatory that the code of the article of the law according to which the right to calculate VAT of 0% is acquired is entered in the description of the product posting group for VAT on the group used when posting invoices with 0% VAT. The code must be entered in the exact format mandated by the Ministry of Finance.

In the search type VAT Product Posting Groups, find your code for exempt VAT calculation on the list and change the description as shown in the picture.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-8adc8dbd-a530-4198-b5e9-af29e95f8cb3.png)

After this setting, you move on to the setting of posting for VAT, where the corresponding tax category is entered (from the previous chapter). It is necessary to set a category for the VAT Posting Business group (in the example it is KDOM) and the VAT Prod. Posting Group (in the example it is OSLPDV). Shown below.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-a73f2ccd-d033-4ba9-b388-210d9baa6545.png)

## **6. Standardize codes for units of measure**

In order to standardize codes for the units of measure, possible units of measure that will be used when creating invoices are defined on the E-Faktura portal. In order for the exchange of documents on the NAV/BC-SEF relationship to be possible, it is necessary to standardize the units of measure in the "Units of measure" table. Possible units of measure are:

* kom – Piece
* kg – Kilogram
* km – Kilometres
* g – Gram
* m – Meter
* l – Liter
* t – Ton
* m2 – Square meter
* m3 – Cubic meter
* min – Minute
* h – Hour
* d – day
* M – Month
* God – Year Adjustment in NAV/BC is done by adding one of the mentioned units of measure to the column "International standard code".

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-6a8dc2a7-a2dd-4c45-b930-ffa6a24ca053.png)

## **7. EU country/region code**

As the working principle of E-Fakture is based on the exchange of data that is in accordance with the European exchange system, the country codes must also be defined according to precisely mandated standards. Until now, the encryption standards of the countries were not taken into account, so the existing codes cannot be changed. In the search, type the country/region because a new setting is required in the fields:

• EU country/region code - Since the exchange of invoices is done only with domestic customers, this field must be filled in only for the country of Serbia, so the abbreviation in this field should be "RS".

• VAT scheme - Also, for Serbia, fill in "9948".

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-2d0dde98-0a34-4f28-8ee3-81630287db2f.png)

If the exchange of invoices is extended to other countries, the same setting must be made for each new country.

## **8. Customer Card – Public companies**

If we work with clients who are public companies (they have a JBKJS number - a unique number of users’ of public funds), it is necessary to fill in their cards with JBKJS number as well as the PIB number. JBKJS is transferred over from the Treasury Administration portal into the JBKJS field in the customer's card.

All customers who have a KJS Type defined on their card will be sent to the Central Register of Invoices.

![alt](https://github.com/NPSBeograd/NPS-Support/raw/main/.attachments/image-76bf5d7a-b512-468f-a3f8-43a5da3b08aa.png)
