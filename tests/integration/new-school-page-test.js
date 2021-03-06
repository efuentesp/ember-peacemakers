// Generated by CoffeeScript 1.6.3
import startApp from 'pm/tests/helpers/start-app';
var App, server;

App = null;

server = null;

module('Integration Test - New School page', {
  setup: function() {
    var schoolStates, schoolTypes;
    App = startApp();
    schoolTypes = [
      {
        id: 'PUBLIC',
        name: 'Pública'
      }, {
        id: 'PRIVATE',
        name: 'Privada'
      }
    ];
    schoolStates = [
      {
        id: 'MX-DIF',
        name: 'Distrito Federal'
      }, {
        id: 'MX-AGU',
        name: 'Aguascalientes'
      }, {
        id: 'MX-MEX',
        name: 'Estado de México'
      }, {
        id: 'MX-MOR',
        name: 'Morelos'
      }
    ];
    server = new Pretender(function() {
      this.get('/api/schoolTypes', function(request) {
        return [
          200, {
            'Content-Type': 'application/json'
          }, JSON.stringify({
            schoolTypes: schoolTypes
          })
        ];
      });
      this.get('/api/schoolTypes/:id', function(request) {
        var schoolType;
        schoolType = school - types.find(function(type) {
          return type;
        });
        console.log(JSON.stringify({
          schoolType: schoolType
        }));
        return [
          200, {
            'Content-Type': 'application/json'
          }, JSON.stringify({
            schoolType: schoolType
          })
        ];
      });
      this.get('/api/states', function(request) {
        return [
          200, {
            'Content-Type': 'application/json'
          }, JSON.stringify({
            states: schoolStates
          })
        ];
      });
      return this.get('/api/states/:id', function(request) {
        var schoolState;
        schoolState = states.find(function(state) {
          return state;
        });
        console.log(JSON.stringify({
          state: schoolState
        }));
        return [
          200, {
            'Content-Type': 'application/json'
          }, JSON.stringify({
            state: schoolState
          })
        ];
      });
    });
    return server.handledRequest = function(verb, path, request) {
      console.log(verb);
      console.log(path);
      return console.log(request);
    };
  },
  teardown: function() {
    Ember.run(App, 'destroy');
    return server.shutdown();
  }
});

test('Should show Add New School form when Add button is pressed.', function() {
  return visit('/schools').then(function() {
    return click('#btn_addSchool').then(function() {
      return ok(find('#form_school').length === 1, "Add School form not found!");
    });
  });
});

test('Should add a new School.', function() {
  return visit('/schools').then(function() {
    return click('#btn_addSchool').then(function() {
      equal(find("#schoolType option[value='PRIVATE']").length, 1, "No SchoolTypes loaded in ListBox.");
      equal(find("#schoolState option[value='MX-DIF']").length, 1, "No SchoolState loaded in ListBox.");
      fillIn('#schoolName input', '#form_school', 'School 5');
      fillIn('#schoolCity input', '#form_school', 'City 5');
      fillIn('#schoolType select', '#form_school', 'PRIVATE');
      fillIn('#schoolState select', '#form_school', 'MX-DIF');
      return click("button:contains('Guardar')").then(function() {
        return equal(find("td:contains('School 5')").length, 1, "New School not found!");
      });
    });
  });
});
