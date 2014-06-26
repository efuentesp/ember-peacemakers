ApiStubRoute = (server) ->
  server.namespace '/api', ->
    server.get '/schools', (req, res) ->
      schools = []
      res.send schools

console.log "ApiStubRoute!!"

`module.exports = ApiStubRoute`