const path = require('path')
const devConfig = require('./webpack.dev.config.js')

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

module.exports = dockerConfig
