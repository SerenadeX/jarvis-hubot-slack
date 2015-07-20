request = require 'request'

apiString = "http://pokeapi.co/api/v1"

module.exports = {
  lookup: (number, callback) ->

    return callback "number is invalid.  try again" if (number > 772 or number < 1)

    cb = (err, res) ->
      callback(err)

    request {
      url: "#{apiString}/pokemon/#{number}"
      json: true
    }, cb

}
