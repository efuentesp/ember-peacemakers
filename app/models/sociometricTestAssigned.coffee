`import DS from 'ember-data'`

SociometricTestAssigned = DS.Model.extend
  name: DS.attr 'string'
  
  assignedAt: DS.attr 'date'
  answeredAt: DS.attr 'date'

  classroom: DS.belongsTo 'student'

SociometricTestAssigned.reopenClass
  FIXTURES:
    [
      { id: 1, name: 'Peacemakers', lastName: 'Mendoza Gómez', photoUrl: 'http://api.randomuser.me/portraits/men/49.jpg', createdAt: new Date(), classroom: 1 }
      { id: 2, name: 'Miriam', lastName: 'Rodriguez Armenta', photoUrl: 'http://api.randomuser.me/portraits/women/34.jpg', createdAt: new Date(), classroom: 1 }
      { id: 3, name: 'Karla Beatriz', lastName: 'Montes de Oca Jimenez', photoUrl: 'http://api.randomuser.me/portraits/women/56.jpg', createdAt: new Date(), classroom: 3 }
    ]

`export default SociometricTestAssigned`