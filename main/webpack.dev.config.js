const path = require('path')
const webpack = require('webpack')
const HtmlWebpackPlugin = require('html-webpack-plugin')

const devConfig = {
  entry: {
    home: './src/index.js',
  },
  output: {
    filename: '[name].index.js',
    path: './dist',
  },
  module: {
    loaders: [{
      test: /\.jsx?$/,
      exclude: /node_modules/,
      loader: 'babel-loader',
    }, {
      test: /\.json$/,
      loaders: [
        'json-loader',
      ]
    }],
  },
  resolve: {
    // extensions: ['', 'js', 'jsx'],
    alias: {
      assets: path.resolve('./assets'),
    }
  },
  plugins: [
    new HtmlWebpackPlugin({
      filename: 'index.html',
      template: './src/index.html',
   }),
  ]
}

module.exports = devConfig
