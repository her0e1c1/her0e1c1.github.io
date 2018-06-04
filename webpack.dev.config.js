const path = require('path');
const webpack = require('webpack');
/* const HtmlWebpackPlugin = require('html-webpack-plugin');
 * const ExtractTextPlugin = require('extract-text-webpack-plugin'); */
const marked = require("marked");
const renderer = new marked.Renderer();

const IS_PRODUCTION = process.env.NODE_ENV === 'production';
const SITE = process.env.SITE;
const DEV_PORT = IS_PRODUCTION ? 10001 : 10000;

const devConfig = {
  entry: {
    index: './src/index.tsx',
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
      test: /\.tsx?$/,
      use: [{
        loader: "ts-loader"
        // loader: "awesome-typescript-loader"
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
    // for github
    new webpack.DefinePlugin({
      __HOST__: JSON.stringify(IS_PRODUCTION ? "her0e1c1.github.io" : `localhost:${DEV_PORT}`),
      __MOCK__: JSON.stringify(SITE === "mock"),
      __PYSTOCK_HOST__: JSON.stringify(IS_PRODUCTION ? `ws://${process.env.PYSTOCK_HOST}/` :"ws://localhost:10002/"),
      __WEBSOCKET_URL__: JSON.stringify("ws://45.76.187.197:13309/socket")
    }),
  ]
}

module.exports = devConfig
