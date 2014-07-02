`import DS from 'ember-data'`

Classmate = DS.Model.extend
  firstName: DS.attr 'string'
  lastName: DS.attr 'string'
  photoUrl: DS.attr 'string'
  createdAt: DS.attr 'date'

  classroom: DS.belongsTo 'classroom'

  fullName: (->
    @get('firstName') + ' ' + @get('lastName')
  ).property('firstName', 'lastName')

Classmate.reopenClass
  FIXTURES:
    [
      { id: 1, firstName: 'FirstName 1', lastName: 'LastName 1', photoUrl: '/assets/passed.png', createdAt: new Date(), classroom: 1 }
      { id: 2, firstName: 'FirstName 2', lastName: 'LastName 2', photoUrl: '/assets/passed.png', createdAt: new Date(), classroom: 1 }
      { id: 3, firstName: 'FirstName 3', lastName: 'LastName 3', photoUrl: '/assets/passed.png', createdAt: new Date(), classroom: 3 }
    ]

`export default Classmate`