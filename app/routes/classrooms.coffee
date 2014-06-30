`import Ember from 'ember'`

classroomsRoute = Ember.Route.extend
  model: ->
    @store.modelFor('school').get('classrooms')
#    [
#      { id: 1, name: 'Classroom 1', period: '2013-2014', stage: 'Primaria', createdAt: new Date() }
#      { id: 2, name: 'Classroom 2', period: '2013-2014', stage: 'Primaria', createdAt: new Date() }
#      { id: 3, name: 'Classroom 3', period: '2013-2014', stage: 'Primaria', createdAt: new Date() }
#    ]

`export default classroomsRoute`