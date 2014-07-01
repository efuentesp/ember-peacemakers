`import Ember from 'ember'`

schoolRoute = Ember.Route.extend
  model: (params)->
    @store.find "school", params.school_id

`export default schoolRoute`