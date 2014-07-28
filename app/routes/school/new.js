// Generated by CoffeeScript 1.6.3
import Ember from 'ember';
var schoolNewRoute;

schoolNewRoute = Ember.Route.extend({
  setupController: function(controller, model) {
    var newSchool;
    this._super(controller, model);
    newSchool = controller.get('newSchool');
    newSchool.set("name");
    newSchool.set("type");
    newSchool.set("city");
    newSchool.set("state");
    newSchool.set("adminUser");
    newSchool.set("adminPassword");
    newSchool.set("assistantUser");
    return newSchool.set("assistantPassword");
  }
});

export default schoolNewRoute;
