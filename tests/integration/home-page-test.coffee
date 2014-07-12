`import startApp from 'pm/tests/helpers/start-app'`

App = null

module 'Integration Test - Home page',
  setup: ->
    App = startApp()
  teardown: ->
    Ember.run App, 'destroy'

test 'Should welcome to Home page.', ->
  visit('/').then ->
    equal find('#nav_home.nav.active').length, 1
    #equal find('.nav.active a').text(), ' Inicio'
    #equal find("a:contains('Inicio')").hasClass('active'), true

test 'Should allow navigating back to Home from another page.', ->
  visit('/login').then ->
    click('#nav_home').then ->
      equal find('#nav_home.nav.active').length, 1
      #equal find('.nav.active a').text(), ' Inicio'