import React from 'react';
import clsx from 'clsx';
import styles from './HomepageFeatures.module.css';
import loc from '../../static/img/loc.png';
import ein from '../../static/img/ein.png';
import travel_expenses from '../../static/img/travel expenses.png';
import translation from '../../static/img/translation.png';
import manufacturing from '../../static/img/advancedmanu.png';
import elc from '../../static/img/einloc.png';
import hrmandpayroll from '../../static/img/hrmandpayroll.png';
import SPI from '../../static/img/SPI.png';
import paymentdiscounts from '../../static/img/paymentdiscounts.png';
import { SvgIcon } from '@mui/material';
import { styled } from '@mui/material/styles';
import Card from '@mui/material/Card';
import CardHeader from '@mui/material/CardHeader';
import CardMedia from '@mui/material/CardMedia';
import CardContent from '@mui/material/CardContent';
import CardActions from '@mui/material/CardActions';
import Collapse from '@mui/material/Collapse';
import IconButton from '@mui/material/IconButton';
import Typography from '@mui/material/Typography';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';
import GitHubIcon from '@mui/icons-material/GitHub';
import Link from '@docusaurus/Link';
import {ReactComponent as BusinessCentralIcon} from '../../static/img/BusinessCentral_scalable.svg';
import {ReactComponent as MicrosoftSvg} from '../../static/img/microsoft.svg';


const buttonStyle = {
  color: "blue",
  fontSize: "1rem",
  padding: "1.5rem",
  // Add any other CSS styles as needed
};
const FeatureList = [
  {
    title: 'Localization features (Serbia)',

    subtitle: 'Microsoft Dynamics 365 Business Central',
    shortdescription: 'This extension allows businesses to quickly achieve compliance with government regulations without investing in weeks of custom development. This solution is suitable for any business operating in Republic of Serbia. \'Localization features (Serbia)\' application also includes some optional features.',
    techGithubLink: 'https://npsbeograd.github.io/Business-Central-Localization/',
    techGithubLinkCaption: 'Github doc',
    Img: loc,
    description: `
        Serbian localization for Dynamics 365 BC; ensures compliance with local laws and regulations.
        Microsoft Dynamics 365 Business Central is a comprehensive business solution designed specifically to meet the needs of small and mid-sized businesses. As such, it is an ideal solution for a Serbian market, offering deep financial and business management capabilities that are quick to implement and easy to use. 
        Based on this premise, NPS has created a Serbian localization that makes your Microsoft Dynamics 365 Business Central compliant with all the local laws and regulations of Serbia.
    `,
    link: 'https://appsource.microsoft.com/en-us/product/dynamics-365-business-central/PUBID.npsdoo1580466836471%7CAID.localbase%7CPAPPID.554b40d8-456d-4eac-956d-b825f4debc57?tab=Overview'
  
  },
  {
    title: 'Electronic Invoicing (Serbia)',
    subtitle: 'Microsoft Dynamics 365 Business Central',
    techGithubLink: 'https://npsbeograd.github.io/Electronic-Invoicing/',
    shortdescription: 'This extension allows businesses to quickly achieve compliance with government regulations without investing in weeks of custom development. This solution is suitable for any business operating in Republic of Serbia. \'Electronic Invoicing (Serbia)\' application also includes some optional features.',
    techGithubLinkCaption: 'Github doc',
    Img: ein,
    description: `
        E-invoicing app for Dynamics 365 BC; integrates with Serbia’s E-invoice system for compliance.
        Microsoft Dynamics 365 Business Central is a comprehensive business solution designed specifically to meet the needs of small and medium-sized businesses.

        You can send several sales invoices at the same time. After you have created your sales invoices, you can send all created sales invoices in batch send.
        In addition, it offers the possibility of the easy download of the status of sales invoices and purchase invoices in your Business Central.
        The possibility to download status and invoices can also be automated, and in this way, you achieve an up-to-date system.
        When you make settings for automation, the system will transfer all data from the E-invoice portal, you will no longer need to connect to the E-invoice portal.


        Based on this premise, NPS created an application for electronic invoicing (Serbia) that adds functionality for integration and legal compliance with the E-invoice system of the Republic of Serbia.
      `
    ,
    link: 'https://appsource.microsoft.com/en-us/product/dynamics-365-business-central/PUBID.npsdoo1580466836471%7CAID.npsein%7CPAPPID.48c134b4-d138-45f3-ab83-8195ed47ed72?tab=Overview'
  },
  {
    title: 'Serbian language (Serbia)',
    subtitle: 'Microsoft Dynamics 365 Business Central',
    shortdescription: 'Microsoft Dynamics 365 Business Central is available in many languages. By installing this app you add the capability of viewing the base application in Serbian language (Serbia).',
    Img: translation,
    techGithubLink: 'https://npsbeograd.github.io/Serbian-Translation-W1/',
    techGithubLinkCaption: 'Github doc',
    description:
      `
       This application adds the Serbian language (Serbia) to Microsoft Dynamics 365 Business Central
        Introducing our app for Microsoft Dynamics 365 Business Central - Serbian Language (Latin, Serbia).

        With our app, you can seamlessly add the capability of viewing and using Business Central in the Serbian language.
        Experience a localized interface that aligns with your business needs and enables your team to navigate and interact with the system effortlessly.

        Installing and removing our Serbian Language Pack is quick and hassle-free.
        The app seamlessly integrates into your existing Business Central environment, allowing for easy installation and setup.
        Should you need to remove it in the future, our app can be easily uninstalled without impacting your system or data.

        In addition to providing translation for Base components, our app goes beyond by offering translations for key Microsoft-made apps in Business Central.
        From Version 22 onwards, enjoy comprehensive translations for additional translations.
      `
    ,
    link: 'https://appsource.microsoft.com/en-us/product/dynamics-365-business-central/PUBID.npsdoo1580466836471%7CAID.npsserbian%7CPAPPID.7980d617-416c-44ac-a2c0-dd01aa49fc86?tab=Overview'
  },
  {
    title: 'HRM and Payroll (Serbia)',
    subtitle: 'Microsoft Dynamics 365 Business Central',
    shortdescription: 'This extension allows businesses to quickly achieve compliance with government regulations without investing in weeks of custom development. This solution is suitable for any business operating in Republic of Serbia. \'HRM and Payroll (Serbia)\' application also includes some optional features.',
    techGithubLink: 'https://npsbeograd.github.io/HRM-and-Payroll/',
    techGithubLinkCaption: 'Github doc',
    Img: hrmandpayroll,
    description:
      `
       Enhances and legally complie D365BC Human Resources and payroll capabilities for companies (Serbia)
      Microsoft Dynamics 365 Business Central is a comprehensive business solution designed specifically to meet the needs of small and mid-sized businesses. 
      As such, it is an ideal solution for a Serbian market, offering deep financial and business management capabilities that are quick to implement and easy to use.
      Based on this premise, NPS has created a HRM and Payroll extension that greatly expands the capabilities of Microsoft Dynamics 365 Business Central to accommodate your HRM and Payroll needs.
      `
    ,
    link: 'https://appsource.microsoft.com/en-us/product/dynamics-365-business-central/PUBID.npsdoo1580466836471%7CAID.payroll-srb%7CPAPPID.d1b8b3d8-32a2-4e61-a7cc-d07d30d44e1a?tab=Overview'
  },
  {
    title: 'Travel Expenses',
    subtitle: 'Microsoft Dynamics 365 Business Central',
    shortdescription: 'This extension allows businesses to keep track of travel expenses of employees without investing in weeks of custom development. This solution is suitable for any business operating in the world. \'Travel Expenses\' application also includes some optional features.',
    Img: travel_expenses,
    techGithubLink: 'https://npsbeograd.github.io/Travel-Order/',
    techGithubLinkCaption: 'Github doc',
    description:
      `
       Travel Order & Expense app for Dynamics 365 BC; manage travel orders, tax, expenses, and reporting
      Microsoft Dynamics 365 Business Central is a comprehensive business solution designed specifically to meet the needs of small and mid-sized businesses. 
      It offers deep financial and business management capabilities that are quick to implement and easy to use.
      Based on this premise, NPS has created Travel Expenses App that adds functionalities for creation of Travel Orders that enable tracking of Travel Expenses.
      Now you can enter costs and daily allowances, calculate tax amounts, post and print Travel Order Reports.
      `
    ,
    link: 'https://appsource.microsoft.com/en-us/product/dynamics-365-business-central/PUBID.npsdoo1580466836471%7CAID.travelexpenses_nps%7CPAPPID.1f5fbf17-bc41-4e19-b2c6-45843ac47421?tab=Overview'
  },
  {
    title: 'Advanced Manufacturing Cost Calculation',
    subtitle: 'Microsoft Dynamics 365 Business Central',
    shortdescription: 'This extension allows businesses to quickly achieve compliance with government regulations without investing in weeks of custom development. This solution is suitable for any business operating in Republic of Serbia. \'HRM and Payroll (Serbia)\' application also includes some optional features.',
    techGithubLink: 'https://npsbeograd.github.io/Manufacturing-Management/',
    techGithubLinkCaption: 'Github doc',
    Img: manufacturing,
    description:
      `
      Advanced cost management solution for manufacturing companies using Dynamics 365 Business Central.
      The Advanced Manufacturing Cost Calculation App by NPS is designed to enhance the existing manufacturing module within Microsoft Dynamics 365 Business Central Premium. 
      Targeted at small and mid-sized manufacturing companies with complex production needs, this app introduces advanced cost-calculation features, giving users comprehensive insights and control over production expenses.
      It seamlessly integrates into Business Central, allowing companies to optimize their manufacturing processes by accurately mapping, managing, and adjusting production costs.
      `
    ,
    link: 'https://appsource.microsoft.com/en-us/product/dynamics-365-business-central/PUBID.npsdoo1580466836471%7CAID.amcc-nps%7CPAPPID.d27900dd-8e3f-4438-8005-b87826aad6d1?tab=Overview'
  },
  {
    title: 'Electronic Invoicing and Localization Connector',
    subtitle: 'Microsoft Dynamics 365 Business Central',
    shortdescription: 'This extension allows businesses to quickly achieve compliance with government regulations without investing in weeks of custom development. This solution is suitable for any business operating in Republic of Serbia. \'Electronic Invoicing (Serbia)\' application also includes some optional features.',
    techGithubLink: 'https://npsbeograd.github.io/CON_EIN_NPSLoc/',
    techGithubLinkCaption: 'Github doc',
    Img: elc,
    description:
      `
      Electronic Invoicing and Localization features (Serbia) Connector for Dynamics 365 Business Central
Microsoft Dynamics 365 Business Central is a comprehensive business solution designed specifically to meet the needs of small and medium-sized businesses.
This application connects two of our applications: Localization features (Serbia) and Electronic Invoicing (Serbia).
You can send individual and summarize VAT to the E-invoice portal. You can also send advance invoices and invoices with related advances.
Based on this premise, NPS created an application that extends the functionalities of the Electronic Invoicing (Serbia) for integration and legal compliance with the E-invoice system of the Republic of Serbia.
      `
    ,
    link: 'https://appsource.microsoft.com/en-us/product/dynamics-365-business-central/PUBID.npsdoo1580466836471%7CAID.npselc%7CPAPPID.cdde85dc-106f-4c1f-b806-edc6155ed818?tab=Overview'
  },
  ,
  {
    title: 'Sales Price Inventory Value',
    subtitle: 'Microsoft Dynamics 365 Business Central',
    shortdescription: 'This extension contains all the necessary legal regulations for keeping records of inventory values in retail.',
    techGithubLink: 'https://npsbeograd.github.io/CON_EIN_NPSLoc/',
    techGithubLinkCaption: 'Github doc',

    Img: SPI,
    description:
      `
      Sales Price Inventory Value for Microsoft Dynamics 365 Business Central
      Sales Price Inventory Value is a part of the retail module in Business Central.
      This functionality enables the calculation of the value of goods in retail and provides the accurate selling price of items. It ensures that all price changes are immediately recorded in the system, providing accurate and up-to-date postings.
      This significantly improves the accuracy of financial reporting and facilitates inventory tracking. Additionally, it allows businesses to quickly respond to market changes and adjust their pricing strategies.
      `
    ,
    link: 'https://appsource.microsoft.com/en-us/product/dynamics-365-business-central/PUBID.npsdoo1580466836471%7CAID.spvi%7CPAPPID.22aea465-c444-4f74-b0b5-2b687048efab?tab=Overview'
  },
  {
    title: 'Payment Discounts',
    subtitle: 'Microsoft Dynamics 365 Business Central',
    shortdescription: 'This extension allows businesses to quickly achieve compliance with government regulations without investing in weeks of custom development. This solution is suitable for any business operating in Republic of Serbia. \'Payment Discounts\' application also includes some optional features.',
    Img: paymentdiscounts,
    techGithubLink: 'https://npsbeograd.github.io/Payment-Discounts/',
    techGithubLinkCaption: 'Github doc',

    description:
      `
      A discount that the customer can receive if they pay the invoice by a predetermined deadline.
      Microsoft Dynamics 365 Business Central is a comprehensive business solution designed specifically for the needs of small and mid-sized enterprises.
      It offers advanced financial and business functionalities that are quick to implement and easy to use.
      Based on this platform, NPS has developed a Payment Discounts App that simplifies the discount management process.
      Now you can easily apply and track discount rates, automatically post discount approvals, and generate reports on payment discounts.
      `
    ,
    link: 'https://appsource.microsoft.com/en-us/product/dynamics-365-business-central/PUBID.npsdoo1580466836471%7CAID.npspyd%7CPAPPID.651fe6ae-0220-43ee-a859-814feacbca19?tab=Overview'
  },
];

const ExpandMore = styled((props) => {
  const { expand, ...other } = props;
  return <IconButton {...other} />;
})(({ theme }) => ({
  marginLeft: 'auto',
  transition: theme.transitions.create('transform', {
    duration: theme.transitions.duration.shortest,
  }),
  variants: [
    {
      props: ({ expand }) => !expand,
      style: {
        transform: 'rotate(0deg)',
      },
    },
    {
      props: ({ expand }) => !!expand,
      style: {
        transform: 'rotate(180deg)',
      },
    },
  ],
}));


function Feature({ Img, title, description, link, AppSvgIcon, subtitle, techGithubLink, shortdescription }) {
  const [expanded, setExpanded] = React.useState(false);

  const handleExpandClick = () => {
    setExpanded(!expanded);
  };


  return (
    <Card sx={{ maxWidth: 345 }}>
      <CardHeader
        avatar={
          <SvgIcon>
            <BusinessCentralIcon/>
          </SvgIcon>
        }

        title={title}
        subheader={subtitle}
      />
        <CardMedia
          component="img"
          height="194"
          image={Img}
          alt="App Source app"
          classes={'MuiCardMedia-img'}
          className='card'
        />

      <CardContent>
        <Typography variant="body2" sx={{ color: 'text.secondary' }}>
          {shortdescription}
        </Typography>
      </CardContent>
      <CardActions disableSpacing>
        <IconButton aria-label="github">
          <Link to={techGithubLink}>
            <GitHubIcon color="primary" />
          </Link>
        </IconButton>
          <Link to={link}>
          <SvgIcon> 
            <MicrosoftSvg/>
          </SvgIcon>
          </Link>
        <ExpandMore
          expand={expanded}
          onClick={handleExpandClick}
          aria-expanded={expanded}
          aria-label="show more"
        >
          <ExpandMoreIcon />
        </ExpandMore>
      </CardActions>
      <Collapse in={expanded} timeout="auto" unmountOnExit>
        <CardContent>
          <Typography sx={{ marginBottom: 2 }}>
            {description}
          </Typography>
        </CardContent>
      </Collapse>
    </Card>
  );
}




export default function HomepageFeatures() {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
