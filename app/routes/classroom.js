// Generated by CoffeeScript 1.6.3
import Ember from 'ember';
var classroomRoute;

classroomRoute = Ember.Route.extend({
  model: function(params) {
    return this.store.find("classrooms", params.classroom_id);
  }
});

export default classroomRoute;
