`import Ember from 'ember'`

schoolsRoute = Ember.Route.extend
  model: ->
    #@store.findAll "school"
    [
      { id: 1, name: 'School 1', type: 'PUBLIC' }
      { id: 2, name: 'School 2', type: 'PRIVATE' }
      { id: 3, name: 'School 3', type: 'PRIVATE' }
    ]

`export default schoolsRoute`