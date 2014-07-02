`import Ember from 'ember'`

classmatesRoute = Ember.Route.extend
  model: (params)->
    @store.find('classroom', params.classroom_id).then (classmates)->
      classmates

`export default classmatesRoute`