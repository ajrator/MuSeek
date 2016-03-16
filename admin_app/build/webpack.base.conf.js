var path = require('path')

module.exports = {
  entry: {
    app: './src/main.js'
  },
  output: {
    path: path.resolve(__dirname, '../dist/static'),
    publicPath: '/static/',
    filename: '[name].js'
  },
  resolve: {
    extensions: ['', '.js', '.vue'],
    alias: {
      'src': path.resolve(__dirname, '../src')
    }
  },
  resolveLoader: {
    root: path.join(__dirname, 'node_modules')
  },
  module: {
    loaders: [
      {
        test: /\.vue$/,
        loader: 'vue'
      },
      {
        test: /\.js$/,
        loader: 'babel!eslint',
        exclude: /node_modules/
      },
      {
        test: /\.json$/,
        loader: 'json'
      },
      {
        test: /\.(jpg|jpeg|gif|png|ico|svg)$/,
        include: [
          path.resolve(__dirname, '../src/assets')
        ],
        loader:'file-loader?name=[path][name].[ext]&context=src'
      },
      {
        test: /\.scss$/,
        loaders: ['style', 'css', 'sass']
      },
      {
        test   : /\.(png|ttf|eot|svg|woff(2)?)(\?[-a-z0-9]+)?$/,
        include: [
          /dg-theme/
        ],
        loader : 'file-loader'
      }
    ]
  },
  vue: {
    loaders: {
      js: 'babel!eslint'
    }
  },
  eslint: {
    formatter: require('eslint-friendly-formatter')
  }
}
