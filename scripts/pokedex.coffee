request = require 'request'

host = "http://pokeapi.co"
apiString = "#{host}/api/v1"

module.exports = {
  lookup: (number, callback) ->

    return callback "number is invalid.  try again" if (number > 718 or number < 1)

    cb = (err, res1) ->
      return callback "error getting string" if err or !res1
      res1 = res1.body
      resString = "##{res1.national_id} #{res1.name}: #{res1.species}"
      spriteApi = res1.sprites[0].resource_uri

      cb = (err, res2) ->
        console.log(err) if err
        return callback "error getting string" if err or !res2
        res2 = res2.body
        resString += "\n #{host}#{res2.image}"

        cb = (err, res3) ->
          return callback "error getting string" if err or !res3
          res3 = res3.body
          resString += "\n #{res3.description}"
          callback(resString)

        desApi = ""
        for val in res1.descriptions


          if val.name.indexOf("5") > -1
            desApi = "#{host}#{val.resource_uri}"
            break

        request {
          url: desApi
          json: true
        }, cb



      request {
        url: "#{host}#{spriteApi}"
        json: true
      }, cb



    request {
      url: "#{apiString}/pokemon/#{number}"
      json: true
    }, cb

}
