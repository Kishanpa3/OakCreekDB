'use strict';

module.exports = function () {
  return parseInt(process.version.replace('v', '').split('.')[0]) >= 8 ? require('../grant') : require('./grant');
}();