"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = fingerprint;

var _fs = require("fs");

var fs = _interopRequireWildcard(_fs);

var _path = require("path");

var _crypto = require("crypto");

function _interopRequireWildcard(obj) { if (obj && obj.__esModule) { return obj; } else { var newObj = {}; if (obj != null) { for (var key in obj) { if (Object.prototype.hasOwnProperty.call(obj, key)) newObj[key] = obj[key]; } } newObj.default = obj; return newObj; } }

/**
 * Generate a fingerprint for a file which will be used the store the endpoint
 *
 * @param {File} file
 * @param {Object} options
 * @param {Function} callback
 */
function fingerprint(file, options, callback) {
  var prefix = "tus-nd";
  if (file instanceof fs.ReadStream && file.path != null) {
    var name = (0, _path.resolve)(file.path);
    fs.stat(file.path, function (err, info) {
      if (err) {
        return callback(err);
      }

      return callback(null, [prefix, name, info.size, info.mtime.getTime(), options.endpoint].join("-"));
    });
  }

  if (Buffer.isBuffer(file)) {
    // create MD5 hash for buffer type
    var blockSize = 64 * 1024; // 64kb
    var content = file.slice(0, Math.min(blockSize, file.length));
    var hash = (0, _crypto.createHash)("md5").update(content).digest("hex");
    return callback(null, [prefix, hash, file.length, options.endpoint].join("-"));
  }

  return callback(new Error("Fingerprint cannot be computed for file input type"));
}