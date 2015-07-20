request = require 'request'

apiString = "http://pokeapi.co/api/v1"

module.exports = {
  lookup: (number, callback) ->

    return callback "number is invalid.  try again" if (number > 772 or number < 1)

    cb = (err, res) ->
      return callback "error getting string" if err or !res
      res = res.body
      resString = "##{res.national_id} #{res.name}: #{res.species}"
      console.log(res)
      callback(resString)

    request {
      url: "#{apiString}/pokemon/#{number}"
      json: true
    }, cb

}
