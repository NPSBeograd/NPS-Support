---
sidebar_position: 6
---
# FAM - Fixed Assets Management

## FA History

Functionality enables tracking of Fixed assets location and responsible employee/customer changes. Functionality also includes report, with the purpose to verify where specific FA is/was or to whom it is/was assigned.

**Fixed Asset Setup**

To enable FA history entries and therefore the following report, it is necessary to activate field *Enable FA History* on the page Fixed Asset Setup.

1. Open Fixed Asset Setup.
2. Set field Enable FA History to enable posting of FA History Entries when Location or Responsible Employee is changed on Fixed Asset Card.

**:::tip**

**How to update information on FA Location Code - Responsible Employee - Responsible Customer on Fixed Asset Card**

For each fixed asset, you must set up a card, containing information about the asset. If you want to log changes that are made on Fixed Asset, you should check the steps below.

1. Open Fixed Asset Card.
2. Enter or change a value in the field FA Location Code - Responsible Employee - Responsible Customer. The program shows a message to assign a change to Fixed Asset. By choosing an option "Yes", FA Location Code - Responsible Employee - Responsible Customer is changed/entered. The program automatically creates a new entry in FA History table with all related data.
3. The program also shows a message to print FA Assignment/Discharge. This report can be printed by choosing a button Preview.
4. You can check new entries by choosing History Entries on button History on Navigate Tab.

:::

**Print FA Assignment/Discharge Report**

If you want to print changes about FA Location Code, Responsible Employee or Responsible Customer, you can do that any time.

1. Open Fixed Asset card.
2. Go to *Report* tab and find/print FA Assignment/Discharge report.
3. This report can be filtered by FA History entry:

* Type: Location, Employee, Customer
* Additional filters: Date, Old value, New value, Entry no…

**How to check FA history entries**

FA history enabling provides that all the changes of Location, Customer or Employee are recorder and available through FA History entries.

1. Go to search option and type FA history entries
2. Entries will enlist by No., Type, FA No., Old value, New value, Creation date and some extra information.

**How to print FA history report:**

FA history entries can be analysed through FA history report.

1. Find and open FA history report
2. *Group by* : Location, Responsible employee, Responsible customer
3. *As of date* : type the date after the changes are made in order to get information
4. *Filter: FA history entry*

* You can choose between FA No., Creation date, Type, New value, Old value

## FA Preparation posting type

Analytical record of fixed assets is extended by additional setting and extension for fixed assets that are not yet being active and in use. These fixed assets should be posted through separate account for FA in preparation,  *Preparation account* .

**How to set up FA posting groups:**

To set up and use this functionality, it is necessary to update information within FA posting groups. Therefore, new Preparation account is to be defined in the same column name.

1. Go to FA posting groups. Write down the Preparation account in the column Preparation
2. As a result, if selected on Purchase documents, among with Acquisition cost, posting will go through Preparation account instead of Acquisition cost account

**How to choose Preparation on Purchase documents:**

As previously mentioned, it is necessary to post FA purchase differently if your fixed asset is not planned for immediate activation and usage.

1. On the Purchase order lines, FA posting type is to be Acquisition cost
2. Next step is to find column FA preparation and check in order to activate new posting functionality

**How to activate FA:**

1. For FA activation go to FA list, select the FA for activation and choose button “ *Activate Fixed asset* ” on the Action ribbon
2. The same action is possible within FA card through Actions – “ *Activate Fixed asset* ”
3. This posting creates two FA/GL journal lines, for each fixed asset and two FA and G/L entries accordingly. This amount transfers from FA preparation account to FA Acquisition account, and FA is ready in use

## FA Details

Functionality is enabled for overview and analyses of Fixed assets posting transactions types and dates such as: preparation, activation, depreciation, acquisition cost, maintenance, insurance.

1. Open Fixed asset details report and set filters:
2. *Options* :

* *Depreciation book* : choose entries to print
* *New page per asset* : check if yes
* *Include reversed entries* : check for reversed entries in report
* *Starting date, Ending date* : enter to define period for your report

3. *FA filters* :

* *No* : if you want to choose one, or a few fixed assets
* *FA* class code: FA group listed by class code
* *FA subclass code* : FA group listed by subclass code
* *Budgeted asset* : choose whether to show budgeted fixed assets

Some of the additional filters to use for your report optimisation are  *Acquisition date, FA posting group, FA posting date filter, Location code, Under maintenance etc* .

The report can be printed, reviewed, or sent to pdf, Word or Excel format for further analyses.

## Set depreciation on FA classes and subclasses

**FA classes depreciation setup**

Our feature provides with possibility to define depreciation book, method and percentage by each FA class and subclass. It makes it easier to fill in all necessary information regarding depreciation by only choosing the right class/subclass, instead of filling out each FA detail card separately.

Every company can define FA subclasses in accordance to their particular classification and this functionality will provide simple and easy set up of depreciation types and percentages, set in advance for each particular sublass.

In addition, by local law and regulations, companies are obliged to keep records on tax depreciation book. In that case, you can easily set up classes for tax book along with percentages and by doing so, define in advance important information for this separate depreciation record.

1. **Search for FA classes** : here you can define different classes and depreciation percentages for tax depreciation book. By selecting the class when you create new FA on card, it will automatically set up tax depreciation details
2. **Search for FA subclasess** : with subclasses there is a possibility to set equal depreciation method and percentage for different FA sublasses within the company. There by selecting the subclass, you automatically define depreciation details for your fixed asset
