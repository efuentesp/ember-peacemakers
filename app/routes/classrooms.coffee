`import Ember from 'ember'`

classroomsRoute = Ember.Route.extend
  model: (params)->
    #@store.modelFor('school').find(params.school_id).get('classrooms')
    @store.find('school', params.school_id).then (classrooms)->
      classrooms

`export default classroomsRoute`