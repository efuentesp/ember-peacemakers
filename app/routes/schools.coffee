`import Ember from 'ember'`

schoolsRoute = Ember.Route.extend
  model: ->
    @store.findAll "school"
    #[
    #  { id: 1, name: 'School 1', type: 'PUBLIC',  createdAt: new Date() }
    #  { id: 2, name: 'School 2', type: 'PRIVATE', createdAt: new Date() }
    #  { id: 3, name: 'School 3', type: 'PRIVATE', createdAt: new Date() }
    #]

`export default schoolsRoute`