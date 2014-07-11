`import startApp from 'pm/tests/helpers/start-app'`

App = null
server = null

module 'Integration Test - Schools page',
  setup: ->
    console.log "setup"
    App = startApp()
    schools = [
      { id: 1, name: 'School 1', type: 'PUBLIC' }
      { id: 2, name: 'School 2', type: 'PRIVATE' }
      { id: 3, name: 'School 3', type: 'PRIVATE' }
    ]
    server = new Pretender ->
      @get '/api/schools', (request) ->
        [ 200, {'Content-Type': 'application/json'}, JSON.stringify {schools: schools} ]
      @get '/api/schools/:id', (request) ->
        school = schools.find (school) ->
          school if school.id == parseInt(request.params.id, 10)
        [ 200, {'Content-Type': 'application/json'}, JSON.stringify {school: school} ]
  teardown: ->
    Ember.run App, 'destroy'
    server.shutdown()

test 'Should navigate to Schools page', ->
  visit('/').then ->
    click("a:contains('Escuelas')").then ->
      equal find('h2#title').text(), ' Escuelas'

test 'Should list all schools', ->
  visit('/schools').then ->
    equal find("td:contains('School 1')").length, 1
    equal find("td:contains('School 2')").length, 1
    equal find("td:contains('School 3')").length, 1