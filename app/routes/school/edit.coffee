`import Ember from 'ember'`

schoolEditRoute = Ember.Route.extend
  model: (params)->
    @store.find "school", params.school_id

`export default schoolEditRoute`