const path = require('path');
const webpack = require('webpack');
const marked = require("marked");

module.exports = {
  entry: {
    index: './src/index.tsx',
  },
  output: {
    filename: 'bundle.js',
    path: path.resolve('./'),
  },
  devServer: {
    contentBase: path.resolve(__dirname, './'),
    disableHostCheck: true,
    historyApiFallback: true,
    host: '0.0.0.0',
    port: '8887',
    open: true,
    hot: false,
  },
  module: {
    rules: [{
        test: /\.tsx?$/,
        use: [{
          loader: 'ts-loader'
        }],
      },
      {
        test: /\.css$/,
        use: ['style-loader',
          { /* recommended */
            loader: 'css-loader',
            options: {
              importLoaders: 1
            }
          },
              /* 'postcss-loader' */
        ]
      },
      {
        test: /\.md$/,
        use: [{
          loader: "markdown-loader",
          options: {
            pedantic: true,
            renderer: new marked.Renderer(),
          }
        }],
      },
    ],
  },
  resolve: {
    extensions: ['.ts', '.tsx', ".js", ".json", ".css"],
    alias: {
      assets: path.resolve('./assets'),
      src: path.resolve('./src'),
    },
  }
};

/*
const dockerConfig = {
  ...devConfig,
  resolve: {
    ...devConfig.resolve,
    modules: [
      path.resolve('./src'),
      '/app/node_modules',
    ],
  },
  resolveLoader: {
    modules: [
        '/app/node_modules',
    ]
  }
}
*/
