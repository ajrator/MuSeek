var config = require('./webpack.base.conf');

// Make the test-utils module available with require('test-utils');
config.resolve.alias['test-utils'] = __dirname+'/../test/unit/test-utils.js';

module.exports = config;
