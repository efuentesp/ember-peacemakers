`import Ember from 'ember'`

classroomsRoute = Ember.Route.extend
  model: ->
    @store.modelFor('school').get('classrooms')

`export default classroomsRoute`