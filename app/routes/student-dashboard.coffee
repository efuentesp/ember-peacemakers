`import Ember from 'ember'`

studentDashboardRoute = Ember.Route.extend
  model: (params)->
    @store.find('student', params.student_id).then (student)->
      student

`export default studentDashboardRoute`