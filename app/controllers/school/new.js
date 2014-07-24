// Generated by CoffeeScript 1.6.3
import Ember from 'ember';
var SchoolItemController;

SchoolItemController = Ember.ObjectController.extend({
  newSchool: Ember.Object.createWithMixins(Ember.Validations.Mixin, {
    name: '',
    type: '',
    city: '',
    state: '',
    adminuser: '',
    adminpassword: '',
    assisstantuser: '',
    assisstantpassword: '',
    validations: {
      name: {
        presence: true
      },
      city: {
        presence: true
      },
      type: {
        presence: true
      },
      state: {
        presence: true
      }
    }
  }),
  typeaheadcontent: [
    Ember.Object.create({
      colour: "Red"
    }), Ember.Object.create({
      colour: "Green"
    }), Ember.Object.create({
      colour: "Blue"
    }), Ember.Object.create({
      colour: "Blue 1"
    }), Ember.Object.create({
      colour: "Blue 2"
    }), Ember.Object.create({
      colour: "Blue 3"
    }), Ember.Object.create({
      colour: "Blue 4"
    }), Ember.Object.create({
      colour: "Blue 5"
    }), Ember.Object.create({
      colour: "Blue 6"
    })
  ],
  schoolTypes: (function() {
    return this.store.find("school-type");
  }).property(),
  schoolStates: (function() {
    return this.store.find("state");
  }).property(),
  actions: {
    submit: function() {
      var school;
      console.log("Sumbit!!");
      school = this.store.createRecord('school', {
        name: this.newSchool.name,
        city: this.newSchool.city,
        type: this.newSchool.type,
        state: this.newSchool.state
      });
      school.save();
      return this.transitionToRoute("schools");
    },
    cancel: function() {
      console.log("Cancel!!");
      return this.transitionToRoute("schools");
    }
  }
});

export default SchoolItemController;
