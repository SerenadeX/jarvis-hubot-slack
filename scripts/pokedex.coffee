request = require 'request'

host = "http://pokeapi.co"
apiString = "#{host}/api/v1"

module.exports = {
  lookup: (number, callback) ->

    return callback "number is invalid.  try again" if (number > 718 or number < 1)

    cb = (err, res) ->
      return callback "error getting string" if err or !res
      res = res.body
      resString = "##{res.national_id} #{res.name}: #{res.species}"
      spriteApi = res.sprites[0].resource_uri

      cb = (err, res) ->
        console.log(err) if err
        return callback "error getting string" if err or !res
        res = res.body
        resString += "\n #{host}#{res.image}"
        callback(resString)

      request {
        url: "#{host}#{spriteApi}"
        json: true
      }, cb



    request {
      url: "#{apiString}/pokemon/#{number}"
      json: true
    }, cb

}
