`import Ember from 'ember'`

classroomRoute = Ember.Route.extend
  model: (params)->
    @store.find "classrooms", params.classroom_id

`export default classroomRoute`