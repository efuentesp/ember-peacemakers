// Generated by CoffeeScript 1.6.3
import DS from 'ember-data';
var Student;

Student = DS.Model.extend({
  firstName: DS.attr('string'),
  lastName: DS.attr('string'),
  photoUrl: DS.attr('string'),
  createdAt: DS.attr('date'),
  classroom: DS.belongsTo('classroom'),
  fullName: (function() {
    return this.get('firstName') + ' ' + this.get('lastName');
  }).property('firstName', 'lastName')
});

Student.reopenClass({
  FIXTURES: [
    {
      id: 1,
      firstName: 'Juan Gonzalo',
      lastName: 'Mendoza Gómez',
      photoUrl: 'http://api.randomuser.me/portraits/men/49.jpg',
      createdAt: new Date(),
      classroom: 1
    }, {
      id: 2,
      firstName: 'Miriam',
      lastName: 'Rodriguez Armenta',
      photoUrl: 'http://api.randomuser.me/portraits/women/34.jpg',
      createdAt: new Date(),
      classroom: 1
    }, {
      id: 3,
      firstName: 'Karla Beatriz',
      lastName: 'Montes de Oca Jimenez',
      photoUrl: 'http://api.randomuser.me/portraits/women/56.jpg',
      createdAt: new Date(),
      classroom: 3
    }
  ]
});

export default Student;
