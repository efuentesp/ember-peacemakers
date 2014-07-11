`import startApp from 'pm/tests/helpers/start-app'`

App = null

module 'Integration Test - Home page',
  setup: ->
    App = startApp()
  teardown: ->
    Ember.run App, 'destroy'

test 'Should welcome to Home page', ->
  visit('/').then ->
    equal find("a:contains('Inicio')").hasClass('active'), true

test 'Should allow navigating back to Home from another page', ->
  visit('/schools').then ->
    click("a:contains('Inicio')").then ->
      notEqual find('h2#title').text(), 'Inicio'