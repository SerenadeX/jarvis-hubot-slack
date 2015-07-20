request = require 'request'

apiString = "http://pokeapi.co/api/v1"

module.exports = {
  lookup: (number, callback) ->
    if number > 772 or number < 1 {
      return callback "number is invalid.  try again"
    }

    request {
      url: "#{apiString}/pokemon/#{number}"
      json: true
    }, (err, res) ->
      callback(err)
}
