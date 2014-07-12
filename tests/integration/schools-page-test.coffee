`import startApp from 'pm/tests/helpers/start-app'`

App = null
server = null

module 'Integration Test - Schools page',
  setup: ->
    console.log "setup"
    App = startApp()
    schools = [
      { id: 1, name: 'School 1', type: 'PUBLIC',  city: 'City 1', state: 'State 1', createdAt: new Date() }
      { id: 2, name: 'School 2', type: 'PRIVATE', city: 'City 2', state: 'State 2', createdAt: new Date() }
      { id: 3, name: 'School 3', type: 'PRIVATE', city: 'City 3', state: 'State 3', createdAt: new Date() }
      { id: 4, name: 'School 4', type: 'PUBLIC',  city: 'City 4', state: 'State 4', createdAt: new Date() }

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

test 'Should navigate to Schools page and highlight menu option.', ->
  visit('/').then ->
    click('#nav_schools a').then ->
      equal find('#nav_schools.nav.active').length, 1
      #equal find('.nav.active a').text(), ' Escuelas'
      #equal find('h2#title').text(), ' Escuelas'

test 'Should list all schools.', ->
  visit('/schools').then ->
    equal find("td:contains('School 1')").length, 1
    equal find("td:contains('School 2')").length, 1
    equal find("td:contains('School 3')").length, 1

test 'Should show Add New School form.', ->
  visit('/schools').then ->
    click('#btn_addSchool').then ->
      ok find('#form_school').length == 1, "Add School form not found!"