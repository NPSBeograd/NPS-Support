const plugin = require('tailwindcss');

const lightCodeTheme = require('prism-react-renderer').themes.github;
const darkCodeTheme = require('prism-react-renderer').themes.dracula;

// With JSDoc @type annotations, IDEs can provide config autocompletion
/** @type {import('@docusaurus/types').DocusaurusConfig} */
(module.exports = {
  title: 'NPS docs',
  tagline: 'Documentation for app-source applications ',
  url: 'https://npsbeograd.github.io',

  baseUrl: '/NPS-Support/',
  stylesheets: [
    {
      href: '/css/tailwind.css',
      type: 'text/css',
    },
  ],
  trailingSlash:false,
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.ico',
  organizationName: 'NPSBeograd', // Usually your GitHub org/user name.
  projectName: 'NPS-Support', // Usually your repo name.
  plugins: [
    function postCssPlugin() {
      return {
        name: "custom-postcss-plugin",
        configurePostCss(postcssOptions) {
          postcssOptions.plugins.push(require("tailwindcss"));
          postcssOptions.plugins.push(require("autoprefixer"));
          return postcssOptions;
        },
      };
    },  'webpack-loaders'

  ],
  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          editUrl: 'https://github.com/NPSBeograd/NPS-Support/edit/main/doc/docs/',
        },
        blog: {
          showReadingTime: true,
          editUrl: 'https://github.com/NPSBeograd/NPS-Support/edit/main/doc/blog/',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
      
        },
      },
    ],
  ],
  

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      navbar: {
        title: 'NPS docs',
        logo: {
          alt: 'nps docs',
          src: 'img/logo.svg',
        },
        items: [
          {
            type: 'doc',
            docId: 'intro',
            position: 'left',
            label: 'Documentation',
          },
          {to: '/blog', label: 'What\'s new', position: 'left'},
          {
            href: 'https://github.com/NPSBeograd/NPS-Support',
            label: 'GitHub',
            position: 'right',
          },
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            title: 'Docs',
            items: [
              {
                label: 'Tutorial',
                to: '/docs/intro',
              },
            ],
          },
          {
            title: 'Community',
            items: [
              {
                label: 'Stack Overflow',
                href: 'https://stackoverflow.com/questions/tagged/docusaurus',
              },
              {
                label: 'Discord',
                href: 'https://discordapp.com/invite/docusaurus',
              },
              {
                label: 'Twitter',
                href: 'https://twitter.com/docusaurus',
              },
            ],
          },
          {
            title: 'More',
            items: [
              {
                label: 'Blog',
                to: '/blog',
              },
              {
                label: 'GitHub',
                href: 'https://github.com/facebook/docusaurus',
              },
            ],
          },
        ],
        copyright: `Copyright © ${new Date().getFullYear()} My Project, Inc. Built with Docusaurus.`,
      },
      prism: {
        theme: lightCodeTheme,
        darkTheme: darkCodeTheme,
      },
    }),
});
