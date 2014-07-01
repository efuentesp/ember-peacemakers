`import Ember from 'ember'`

schoolsRoute = Ember.Route.extend
  model: ->
    @store.find "school"

`export default schoolsRoute`