`import DS from 'ember-data'`

School = DS.Model.extend
  name: DS.attr 'string'
  type: DS.attr 'string'
  createdAt: DS.attr 'date'

  classrooms: DS.hasMany 'classroom', {async: true}

School.reopenClass
  FIXTURES:
    [
      { id: 1, name: 'School 1', type: 'PUBLIC',  createdAt: new Date(), classrooms: [1, 2] }
      { id: 2, name: 'School 2', type: 'PRIVATE', createdAt: new Date(), classrooms: [3] }
      { id: 3, name: 'School 3', type: 'PRIVATE', createdAt: new Date() }
      { id: 4, name: 'School 4', type: 'PUBLIC',  createdAt: new Date() }
    ]

`export default School`