const path = require('path')
const webpack = require('webpack')
const HtmlWebpackPlugin = require('html-webpack-plugin')
const marked = require("marked");
const renderer = new marked.Renderer();
const script = require('./scrit.js')

const IS_PRODUCTION = process.env.NODE_ENV === 'production'

const ExtractTextPlugin = require('extract-text-webpack-plugin');

const devConfig = {
  entry: {
    home: './src/index.js',
  },
  output: {
    filename: '[name].js',
    path: './',
  },
  module: {
    rules: [{
      test: /\.md$/,
      use: [{
        loader: "html-loader"
      }, {
        loader: "markdown-loader",
        options: {
          pedantic: true,
          renderer
        }
      }]
    }, {
      test: /\.css$/,
      loader:  ExtractTextPlugin.extract({
        loader: 'css-loader?importLoaders=1',
      })
    }, {
      test: /\.jsx?$/,
      exclude: /node_modules/,
      use: [{
        loader: 'babel-loader'
      }]
    },
  ]},
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
      __CODES__: JSON.stringify(script.getFiles("./sample")),
      __HOST__: JSON.stringify(IS_PRODUCTION ? "her0e1c1.github.io" : "localhost:10000"),
      __WEBSOCKET_URL__: JSON.stringify("ws://128.199.158.226:13309/socket")
    }),
    new ExtractTextPlugin("styles.css")
  ]
}

module.exports = devConfig
