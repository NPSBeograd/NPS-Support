# One Drive Integration manual

## 1. How To Setup

First go to imported flow , visit [power automate](https://make.powerautomate.com/) and go to solutions.

![1758991729636](image/OneDriveIntegrationManual/1758991729636.png)

Then click on your solution One Drive Attachment Integration.

![1758991828487](image/OneDriveIntegrationManual/1758991828487.png)

Then enter your flow with the same name. And then Edit

At the bottom you can see all yours flow runs

![1758991939341](image/OneDriveIntegrationManual/1758991939341.png)

Make sure your flow is Turned On! When you first import flow from solution flow will be Turned OF! You have to check this field to show

![1758992695262](image/OneDriveIntegrationManual/1758992695262.png)

This means flow is  Turned On and ready!

When you click Edit you will enter the flow to copy URL!

When you Enter your flow for the first time you will need to successfully save it in order for valid URL to appear.

Click on manual action from diagram and pop up form the left will appear.

![1758992073629](image/OneDriveIntegrationManual/1758992073629.png)

After successful save URL will be generated which you will need to copy.

![1758992193898](image/OneDriveIntegrationManual/1758992193898.png)

Copy whole URL and go to Business Central-> Serivce Connections-> E-Invoice Setup and scroll down to the last tab Attachment and

paste URL in Save attachment URL field.

Attachment Save Path is Optional, Default Path where attachments will be saved on OneDrive is /BusinessCentral folder. You can change to whatever you want up to 4 depth for example /BusinessCentral/Environment/Company/E-Invoice.

![1758991489813](image/OneDriveIntegrationManual/1758991489813.png)

![1758992761121](image/OneDriveIntegrationManual/1758992761121.png)

## 2. Change Variables and Connections in Solution

Return to your solution and click on Environment Variables

![1758992997805](image/OneDriveIntegrationManual/1758992997805.png)

These two variables are the same variables you entered when you imported your soulution. If you want to change it wihich Environment should you connect with in Bussiness Central Click on it and change two fields Default value and Current Value.

![1758992997805](image/OneDriveIntegrationManual/1758992997805.png)

![1758993185652](image/OneDriveIntegrationManual/1758993185652.png)

You can copy Environment name from business central url .

![1758993481841](image/OneDriveIntegrationManual/1758993481841.png)

Second variable Company ID is company id from Business Central you can find it if you  search Companies or Preduzeca is Serbian

![1758993636131](image/OneDriveIntegrationManual/1758993636131.png)

Click on your company you want to integrate to and press keyboard ctrl+alt+F1 it will popup on the left all record fields.

Search for id field and copy it

![1758993824729](image/OneDriveIntegrationManual/1758993824729.png)

This will be your Company ID value in variables

![1758993899343](image/OneDriveIntegrationManual/1758993899343.png)

Now that variables are set you can change connection references.

From solution go to Connection References

![1758994035584](image/OneDriveIntegrationManual/1758994035584.png)

These two are connections to Connectors in power automate. Here you can change which user connection will be used to save attachments on OneDrive!

Click on your connection and popup will appear on the right

![1758994200299](image/OneDriveIntegrationManual/1758994200299.png)

Here you can click New Connection and login to a diferent user where OneDrive Attachment will be saved!

## 3. Check OneDrive Sharing Policy

Depending what company policy is when sharing OneDrive files, you have to change flow option how to generate sharing link.

Enter the flow , click on Edit.

Click on Condition and expand it until you get to action that create shared link on OneDrive

![1758996278147](image/OneDriveIntegrationManual/1758996278147.png)

![1758996390622](image/OneDriveIntegrationManual/1758996390622.png)

![1758996600881](image/OneDriveIntegrationManual/1758996600881.png)

Change the scope depending on your OneDrive Share policy if it's Anonymus but policy is diferent error will appear and Integration will Fail

![1758996718702](image/OneDriveIntegrationManual/1758996718702.png)

After you change option value save the flow to update it!.

## 4. Start Retroactive Attachment Transfer to OneDrive

When Everything is setup you can Enable Attachment Integration!

![1758994448935](image/OneDriveIntegrationManual/1758994448935.png)

From E-Invoice Setup page you can shedule Retroactive Attachment Transfer to OneDrive. This is runned as a background proccess with task sheduler. All attachments from E-Invoice will be transfered to onedrive and content removed in Business Central. In Incomming Doc Attachment shared url link will be available.

Only users in this tenant will be able to run this action! Delegated Admins cannot create sheduled tasks! Or open OneDrive drive if shared policy is setup to Orgranization Only!

![1759004272431](image/OneDriveIntegrationManual/1759004272431.png)

To run this action Navigate to Related tab in Ein Setup page.

![1759004332741](image/OneDriveIntegrationManual/1759004332741.png)

![1759004359576](image/OneDriveIntegrationManual/1759004359576.png)![1759004378249](image/OneDriveIntegrationManual/1759004378249.png)

To see process running go to Sheduled Tasks or Planirani Zadaci in search bar

![1759004489887](image/OneDriveIntegrationManual/1759004489887.png)

Here you can find sheduled tasks, when its completed it will automacally be deleted or when error has happened!

> [!TIP]
>
>
> If Batch transfer fails, you can check in Sheduled Tasks or Planirani Zadaci if there is a codeunit (49021566)
>
> if there is not that means eather batch processing is finished or error was thrown during transfer. Somethimes transfer can TIMEOUT if there are too many requsts to OneDrive. OneDrive has a throttling limit up to 100 requsts per minutes.
>
> If error has happened then you can START batch processing AGAIN and it will continue where it left off!
