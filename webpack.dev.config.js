const path = require('path');
const webpack = require('webpack');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const ExtractTextPlugin = require('extract-text-webpack-plugin');
const marked = require("marked");
const renderer = new marked.Renderer();

const IS_PRODUCTION = process.env.NODE_ENV === 'production';
const SITE = process.env.SITE;
const DEV_PORT = IS_PRODUCTION ? 10001 : 10000;

const devConfig = {
  entry: {
    home: './src/index.tsx',
  },
  output: {
    filename: '[name].js',  // [hash], [id]
    path: path.resolve('./'),
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
      test: /\.tsx?$/,
      use: [{
        loader: "awesome-typescript-loader?configFileName=tsconfig.json"
      }]
    }, {
      test: /\.jsx?$/,
      exclude: /node_modules/,
      use: [{
        loader: 'babel-loader'
      }]
    },
  ]},
  resolve: {
    extensions: [".js", ".jsx", ".ts", ".tsx"],
    plugins: [
      // new TsConfigPathsPlugin(/* { tsconfig, compiler } */)
    ],
    alias: {
      assets: path.resolve('./assets'),
      src: path.resolve("./src"),
    }
  },
  devServer: {
    port: DEV_PORT
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
    new HtmlWebpackPlugin({
      filename: 'chart',  // build時に、この名前のファイル生成
      template: './src/index.html',
      inject: true,
      minify: {
        removeComments: true,
        collapseWhitespace: true
      }
   }),
   new webpack.DefinePlugin({
     __HOST__: JSON.stringify(IS_PRODUCTION ? "her0e1c1.github.io" : `localhost:${DEV_PORT}`),
     __MOCK__: JSON.stringify(SITE === "mock"),
     __PYSTOCK_HOST__: JSON.stringify(IS_PRODUCTION ? `ws://${process.env.PYSTOCK_HOST}/` :"ws://localhost:10002/"),
     __WEBSOCKET_URL__: JSON.stringify("ws://45.76.187.197:13309/socket")
   }),
   new ExtractTextPlugin("styles.css")
  ]
}

module.exports = devConfig
