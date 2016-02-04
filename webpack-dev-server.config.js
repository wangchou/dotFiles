var webpack = require('webpack');
var path = require('path');
var buildPath = path.resolve(__dirname, 'www');
var nodeModulesPath = path.resolve(__dirname, 'node_modules');
var TransferWebpackPlugin = require('transfer-webpack-plugin');
const ExtractTextPlugin = require('extract-text-webpack-plugin');

var config = {
  entry: [
    // 瀏覽器端 polyfill
    'babel-polyfill',
    path.join(__dirname, '/src/app/app.jsx')
  ],
  resolveLoader: {
    modulesDirectories: [
      path.join(__dirname, '/node_modules')
    ]
  },
  resolve: {
    extensions: ['', '.jsx', '.scss', '.js', '.json', '.md'],
    alias: {
      //避免多個 react instance 問題
      react: path.resolve('./node_modules/react')
    },
    modulesDirectories: [
      'node_modules',
      path.resolve(__dirname, './node_modules'),
      path.resolve(__dirname, './../node_modules'),
      path.resolve(__dirname, './../components')
   ]
  },
  devServer:{
    contentBase: 'src/www',  // server 的相對路徑
    devtool: 'eval-source-map',
    hot: false,
    inline: true,
    port: 3000
  },
  devtool: 'eval-source-map',
  output: {
    path: buildPath,    // 輸出位置
    filename: 'app.js'  // 輸出檔名
  },
  plugins: [
    new ExtractTextPlugin('app.css', { allChunks: true }),
    //Allows error warnings but does not stop compiling. Will remove when eslint is added
    new webpack.NoErrorsPlugin(),
    // 搬移檔案
    new TransferWebpackPlugin([
      {from: 'www'}
    ], path.resolve(__dirname, "src"))
  ],
  module: {
    preLoaders: [
      {
        //eslint 文法檢查
        test: /\.(js|jsx)$/,
        loader: 'eslint-loader',
        include: [path.resolve(__dirname, "src/app")],
        exclude: [nodeModulesPath]
      },
    ],
    loaders: [
      { test: /\.svg$/, loader: 'svg-loader?pngScale=2' },
      {
        // 局部 CSS Module 設定
        test: /(\.scss|\.css)$/,
        loader: ExtractTextPlugin.extract('style', 'css?sourceMap&modules&importLoaders=1&localIdentName=[name]__[local]___[hash:base64:5]!postcss!sass?sourceMap')
      },
      {
        // JS/JSX 設定
        test: /\.(js|jsx)$/,
        loaders: ['babel-loader'],
        exclude: [nodeModulesPath]
      }
    ]
  },
  //eslint config options. Part of the eslint-loader package
  eslint: {
    configFile: '.eslintrc'
  },
};

module.exports = config;
