`import startApp from 'pm/tests/helpers/start-app'`

App = null
server = null

module 'Integration Test - New School page',
  setup: ->
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

    server.handledRequest = (verb, path, request) ->
      console.log verb
      console.log path
      console.log request
  teardown: ->
    Ember.run App, 'destroy'
    server.shutdown()


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