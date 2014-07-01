`import DS from 'ember-data'`

Classmate = DS.Model.extend
  firstName: DS.attr 'string'
  lastName: DS.attr 'string'
  photoUrl: DS.attr 'string'
  createdAt: DS.attr 'date'

  classroom: DS.belongsTo 'classroom'

Classmate.reopenClass
  FIXTURES:
    [
      { id: 1, firstName: 'Classroom 1', lastName: '2013-2014', photoUrl: 'Primaria', createdAt: new Date(), classroom: 1 }
      { id: 2, firstName: 'Classroom 2', lastName: '2013-2014', photoUrl: 'Primaria', createdAt: new Date(), classroom: 1 }
      { id: 3, firstName: 'Classroom 3', lastName: '2013-2014', photoUrl: 'Primaria', createdAt: new Date(), classroom: 3 }
    ]

`export default Classmate`