// Generated by CoffeeScript 1.6.3
import Ember from 'ember';
var classroomsRoute;

classroomsRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find('school', params.school_id).then(function(classrooms) {
      return classrooms;
    });
  }
});

export default classroomsRoute;
