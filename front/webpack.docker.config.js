const devConfig = require('./webpack.dev.config.js')

const dockerConfig = {
  ...devConfig,
  resolve: {
    ...devConfig.resolve,
    root: ['/app/node_modules']
  },
  resolveLoader: {
    modulesDirectories: [
        '/app/node_modules',
    ]
  }
}

module.exports = dockerConfig
