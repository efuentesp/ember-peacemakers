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
      { id: 'MX-DIF',  name: 'Distrito Federal' }
      { id: 'MX-AGU', name: 'Aguascalientes' }
      { id: 'MX-MEX', name: 'Estado de México' }
      { id: 'MX-MOR', name: 'Morelos' }
    ]
    schools = [
      { id: 1, name: 'School 1', type: 'PUBLIC',  city: 'City 1', state: 'State 1', createdAt: new Date() }
      { id: 2, name: 'School 2', type: 'PRIVATE', city: 'City 2', state: 'State 2', createdAt: new Date() }
      { id: 3, name: 'School 3', type: 'PRIVATE', city: 'City 3', state: 'State 3', createdAt: new Date() }
      { id: 4, name: 'School 4', type: 'PUBLIC',  city: 'City 4', state: 'State 4', createdAt: new Date() }
    ]
    server = new Pretender ->
      @get '/api/school-types', (request) ->
        [ 200, {'Content-Type': 'application/json'}, JSON.stringify {schoolTypes: schoolTypes} ]
      @get '/api/school-types/:id', (request) ->
        schoolType = school-types.find (type) ->
          type
        [ 200, {'Content-Type': 'application/json'}, JSON.stringify {schoolType: schoolType} ]

      @get '/api/states', (request) ->
        [ 200, {'Content-Type': 'application/json'}, JSON.stringify {states: schoolStates} ]
      @get '/api/states/:id', (request) ->
        schoolState = sctates.find (state) ->
          state
        [ 200, {'Content-Type': 'application/json'}, JSON.stringify {state: schoolState} ]

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
      equal find("select#schoolType option[value='PRIVATE']").length, 1, "No SchoolTypes loaded in ListBox."
      equal find("select#schoolState option[value='MX-DIF']").length, 1, "No SchoolState loaded in ListBox."
      fillIn '#schoolName', '#form_school', 'School 5'
      #fillIn '#schoolCity', '#form_school', 'City 5'
      $('input#schoolCity').val('City 5')
      $("select#schoolType option[value='PRIVATE']").attr('selected', true)
      $("select#schoolState option[value='MX-DIF']").attr('selected', true)
      debugger
      click("button:contains('Guardar')").then -> # Find a way to put an Id to a Modal.
        equal find("td:contains('School 5')").length, 1, "New School not found!"