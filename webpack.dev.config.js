const path = require('path')
const webpack = require('webpack')
const HtmlWebpackPlugin = require('html-webpack-plugin')

const devConfig = {
  entry: {
    home: './src/index.js',
  },
  output: {
    filename: '[name].js',
    path: './',
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
  devServer: {
    port: 8080
  },
  plugins: [
    new HtmlWebpackPlugin({
      filename: 'index.html',  // build時に、この名前のファイル生成
      template: './src/index.html',
      inject: true,
      minify: {
        removeComments: true,
        collapseWhitespace: true
      }
   }),
    new webpack.DefinePlugin({
      __WEBSOCKET_URL__: JSON.stringify("ws://128.199.158.226:13309/socket")
    })
  ]
}

module.exports = devConfig
