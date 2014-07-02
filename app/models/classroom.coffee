`import DS from 'ember-data'`

Classroom = DS.Model.extend
  name: DS.attr 'string'
  period: DS.attr 'string'
  stage: DS.attr 'string'
  createdAt: DS.attr 'date'

  school: DS.belongsTo 'school'
  classmates: DS.hasMany 'classmate', {async: true}

  classmatesCount: (->
    @get('classmates.length')
  ).property('classmates.@each')

  fullName: (->
    @get('school.name') + ' ' + @get('name') + ' ' + @get('stage') + ' ' + @get('period')
  ).property('school.name', 'name', 'stage', 'period')

Classroom.reopenClass
  FIXTURES:
    [
      { id: 1, name: 'Classroom 1', period: '2013-2014', stage: 'Primaria', createdAt: new Date(), school: 1, classmates: [1, 2] }
      { id: 2, name: 'Classroom 2', period: '2013-2014', stage: 'Primaria', createdAt: new Date(), school: 1, classmates: [] }
      { id: 3, name: 'Classroom 3', period: '2013-2014', stage: 'Primaria', createdAt: new Date(), school: 2, classmates: [3] }
    ]

`export default Classroom`