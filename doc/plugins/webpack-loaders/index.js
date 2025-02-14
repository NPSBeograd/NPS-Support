module.exports = function (context, options) {
    return {
      name: 'webpack-loaders',
      configureWebpack(config, isServer) {
        return {
          module: {
            rules: [
            //  {
            //     test: /\.svg$/,
            //     use: [ {
            //         loader: '@svgr/webpack',
            //         options: { svgo: false }, // Isključi svgo optimizaciju
            //       }],
            //   }
            // {
            //   test: /\.svg$/,
            //   use: ['@svgr/webpack', 'url-loader'],
            // }
              
            ],
          },
        };
      },
    };
  };