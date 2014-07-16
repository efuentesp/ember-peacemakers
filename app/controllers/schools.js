// Generated by CoffeeScript 1.6.3
import Ember from 'ember';
var schoolsController;

schoolsController = Ember.ArrayController.extend({
  itemController: "school",
  sortProperties: ['createdAt'],
  sortAscending: false,
  newSchool: Ember.Object.create({
    name: '',
    type: '',
    city: '',
    state: ''
  }),
  schoolTypes: [
    {
      id: 'PUBLIC',
      name: 'Pública'
    }, {
      id: 'PRIVATE',
      name: 'Privada'
    }
  ],
  schoolStates: [
    {
      id: 'MX-DIF',
      name: 'Distrito Federal'
    }, {
      id: 'MX-AGU',
      name: 'Aguascalientes'
    }
  ],
  modalButtons: [
    Ember.Object.create({
      title: 'Cancelar',
      clicked: "cancel",
      dismiss: 'modal'
    }), Ember.Object.create({
      title: 'Guardar',
      type: "primary",
      clicked: "submit",
      id: "btn_saveNewSchool"
    })
  ],
  actions: {
    addSchool: function() {
      console.log("Add School!!");
      return Bootstrap.ModalManager.show('schoolModal');
    },
    submit: function() {
      var promise, school;
      console.log(this.newSchool.type);
      school = this.store.createRecord('school', {
        name: this.newSchool.name,
        city: this.newSchool.city
      });
      this.store.find('school-type', this.newSchool.type).then(function(schoolType) {
        console.log("schoolType: " + schoolType.name);
        return school.set('type', schoolType);
      });
      this.store.find('state', this.newSchool.state).then(function(schoolState) {
        console.log("schoolState: " + schoolState.name);
        return school.set('state', schoolState);
      });
      this.set('newSchool.name', '');
      this.set('newSchool.type', '');
      this.set('newSchool.city', '');
      this.set('newSchool.state', '');
      promise = school.save();
      return Bootstrap.ModalManager.hide('schoolModal', function(error) {
        school.rollback();
        return alert(error);
      });
    },
    cancel: function() {
      return console.log("Cancel!!");
    }
  }
});

export default schoolsController;
