// Generated by CoffeeScript 1.6.3
import startApp from 'pm/tests/helpers/start-app';
var App, server;

App = null;

server = null;

module('Integration Test - Schools page', {
  setup: function() {
    var schoolStates, schoolTypes, schools;
    console.log("setup");
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
    schools = [
      {
        id: 1,
        name: 'School 1',
        type: 'PUBLIC',
        city: 'City 1',
        state: 'State 1',
        createdAt: new Date()
      }, {
        id: 2,
        name: 'School 2',
        type: 'PRIVATE',
        city: 'City 2',
        state: 'State 2',
        createdAt: new Date()
      }, {
        id: 3,
        name: 'School 3',
        type: 'PRIVATE',
        city: 'City 3',
        state: 'State 3',
        createdAt: new Date()
      }, {
        id: 4,
        name: 'School 4',
        type: 'PUBLIC',
        city: 'City 4',
        state: 'State 4',
        createdAt: new Date()
      }
    ];
    return server = new Pretender(function() {
      this.get('/api/school-types', function(request) {
        return [
          200, {
            'Content-Type': 'application/json'
          }, JSON.stringify({
            schoolTypes: school-types
          })
        ];
      });
      this.get('/api/school-types/:id', function(request) {
        var schoolType;
        schoolType = school - types.find(function(type) {
          return type;
        });
        return [
          200, {
            'Content-Type': 'application/json'
          }, JSON.stringify({
            schoolType: school-type
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
      this.get('/api/states/:id', function(request) {
        var schoolState;
        schoolState = sctates.find(function(state) {
          return state;
        });
        return [
          200, {
            'Content-Type': 'application/json'
          }, JSON.stringify({
            state: schoolState
          })
        ];
      });
      this.get('/api/schools', function(request) {
        return [
          200, {
            'Content-Type': 'application/json'
          }, JSON.stringify({
            schools: schools
          })
        ];
      });
      return this.get('/api/schools/:id', function(request) {
        var school;
        school = schools.find(function(school) {
          if (school.id === parseInt(request.params.id, 10)) {
            return school;
          }
        });
        return [
          200, {
            'Content-Type': 'application/json'
          }, JSON.stringify({
            school: school
          })
        ];
      });
    });
  },
  teardown: function() {
    Ember.run(App, 'destroy');
    return server.shutdown();
  }
});

test('Should navigate to Schools page and highlight menu option.', function() {
  return visit('/').then(function() {
    return click('#nav_schools a').then(function() {
      return equal(find('#nav_schools.nav.active').length, 1, "No School menu active!");
    });
  });
});

test('Should list all schools.', function() {
  return visit('/schools').then(function() {
    equal(find("td:contains('School 1')").length, 1, "No School found!");
    equal(find("td:contains('School 2')").length, 1, "No School found!");
    equal(find("td:contains('School 3')").length, 1, "No School found!");
    return equal(find("td:contains('School 4')").length, 1, "No School found!");
  });
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
      equal(find("select#schoolType option[value='PRIVATE']").length, 1, "No SchoolTypes loaded in ListBox.");
      equal(find("select#schoolState option[value='MX-DIF']").length, 1, "No SchoolState loaded in ListBox.");
      fillIn('#schoolName', '#form_school', 'School 5');
      $('input#schoolCity').val('City 5');
      $("select#schoolType option[value='PRIVATE']").attr('selected', true);
      $("select#schoolState option[value='MX-DIF']").attr('selected', true);
      debugger;
      return click("button:contains('Guardar')").then(function() {
        return equal(find("td:contains('School 5')").length, 1, "New School not found!");
      });
    });
  });
});
