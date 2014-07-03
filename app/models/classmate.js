// Generated by CoffeeScript 1.6.3
import DS from 'ember-data';
var Classmate;

Classmate = DS.Model.extend({
  firstName: DS.attr('string'),
  lastName: DS.attr('string'),
  photoUrl: DS.attr('string'),
  createdAt: DS.attr('date'),
  classroom: DS.belongsTo('classroom'),
  fullName: (function() {
    return this.get('firstName') + ' ' + this.get('lastName');
  }).property('firstName', 'lastName')
});

Classmate.reopenClass({
  FIXTURES: [
    {
      id: 1,
      firstName: 'FirstName 1',
      lastName: 'LastName 1',
      photoUrl: 'http://api.randomuser.me/portraits/men/49.jpg',
      createdAt: new Date(),
      classroom: 1
    }, {
      id: 2,
      firstName: 'FirstName 2',
      lastName: 'LastName 2',
      photoUrl: 'http://api.randomuser.me/portraits/women/34.jpg',
      createdAt: new Date(),
      classroom: 1
    }, {
      id: 3,
      firstName: 'FirstName 3',
      lastName: 'LastName 3',
      photoUrl: 'http://api.randomuser.me/portraits/women/56.jpg',
      createdAt: new Date(),
      classroom: 3
    }
  ]
});

export default Classmate;
