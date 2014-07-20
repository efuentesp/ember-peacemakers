`import startApp from 'pm/tests/helpers/start-app'`

App = null
server = null

module 'Integration Test - Schools page',
  setup: ->
    console.log "setup"
    App = startApp()
    schoolTypes = [
      { id: 'PUBLIC',  name: 'Pública' }
      { id: 'PRIVATE', name: 'Privada' }
    ]
    schoolStates = [
      { id: 'MX-DIF', name: 'Distrito Federal' }
      { id: 'MX-AGU', name: 'Aguascalientes' }
      { id: 'MX-MEX', name: 'Estado de México' }
      { id: 'MX-MOR', name: 'Morelos' }
    ]
    schools = [
      { id: 1, name: 'School 1', type: 'PUBLIC',  city: 'City 1', state: 'MX-DIF', createdAt: new Date() }
      { id: 2, name: 'School 2', type: 'PRIVATE', city: 'City 2', state: 'MX-MOR', createdAt: new Date() }
      { id: 3, name: 'School 3', type: 'PRIVATE', city: 'City 3', state: 'MX-DIF', createdAt: new Date() }
      { id: 4, name: 'School 4', type: 'PUBLIC',  city: 'City 4', state: 'MX-MEX', createdAt: new Date() }
    ]
    server = new Pretender ->
      @get '/api/schoolTypes', (request) ->
        # console.log JSON.stringify {schoolTypes: schoolTypes}
        [ 200, {'Content-Type': 'application/json'}, JSON.stringify {schoolTypes: schoolTypes} ]
      @get '/api/schoolTypes/:id', (request) ->
        schoolType = school-types.find (type) ->
          type
        console.log JSON.stringify {schoolType: schoolType}
        [ 200, {'Content-Type': 'application/json'}, JSON.stringify {schoolType: schoolType} ]

      @get '/api/states', (request) ->
        # console.log JSON.stringify {states: schoolStates}
        [ 200, {'Content-Type': 'application/json'}, JSON.stringify {states: schoolStates} ]
      @get '/api/states/:id', (request) ->
        schoolState = states.find (state) ->
          state
        console.log JSON.stringify {state: schoolState}
        [ 200, {'Content-Type': 'application/json'}, JSON.stringify {state: schoolState} ]

      @get '/api/schools', (request) ->
        # console.log JSON.stringify {schools: schools}
        [ 200, {'Content-Type': 'application/json'}, JSON.stringify {schools: schools} ]
      @get '/api/schools/:id', (request) ->
        school = schools.find (school) ->
          school if school.id == parseInt(request.params.id, 10)
        console.log JSON.stringify {school: school}
        [ 200, {'Content-Type': 'application/json'}, JSON.stringify {school: school} ]
    server.handledRequest = (verb, path, request) ->
      console.log verb
      console.log path
      console.log request
  teardown: ->
    Ember.run App, 'destroy'
    server.shutdown()

test 'Should navigate to Schools page and highlight menu option.', ->
  visit('/').then ->
    click('#nav_schools a').then ->
      equal find('#nav_schools.nav.active').length, 1, "No School menu active!"
      #equal find('.nav.active a').text(), ' Escuelas'
      #equal find('h2#title').text(), ' Escuelas'

test 'Should list all schools.', ->
  visit('/schools').then ->
    #expect 4
    equal find("td:contains('School 1')").length, 1, "No School found!"
    equal find("td:contains('School 2')").length, 1, "No School found!"
    equal find("td:contains('School 3')").length, 1, "No School found!"
    equal find("td:contains('School 4')").length, 1, "No School found!"

test 'Should show Add New School form when Add button is pressed.', ->
  visit('/schools').then ->
    click('#btn_addSchool').then ->
      ok find('#form_school').length == 1, "Add School form not found!"

test 'Should add a new School.', ->
  visit('/schools').then ->
    click('#btn_addSchool').then ->
      equal find("#schoolType option[value='PRIVATE']").length, 1, "No SchoolTypes loaded in ListBox."
      equal find("#schoolState option[value='MX-DIF']").length, 1, "No SchoolState loaded in ListBox."
      fillIn '#schoolName input', '#form_school', 'School 5'
      fillIn '#schoolCity input', '#form_school', 'City 5'
      # $('#schoolCity input').val('City 5')
      fillIn '#schoolType select', '#form_school', 'PRIVATE'
      # $("#schoolType option[value='PRIVATE']").attr('selected', true)
      fillIn '#schoolState select', '#form_school', 'MX-DIF'
      # $("#schoolState option[value='MX-DIF']").attr('selected', true)
      click("button:contains('Guardar')").then -> # Find a way to put an Id to a Modal.
        # debugger
        equal find("td:contains('School 5')").length, 1, "New School not found!"