`import Ember from 'ember'`

schoolEditRoute = Ember.Route.extend
  model: (params)->
    @store.find "school", params.school_id

  setupController: (controller, model) ->
    @_super(controller, model)
    controller.set 'newSchool.name', model.get 'name'
    controller.set 'newSchool.type', model.get 'type'
    controller.set 'newSchool.city', model.get 'city'
    # controller.set 'newSchool.state', model.get 'state'

    model.get("admins").then (admins) ->
      console.log admins
    # controller.set 'newSchool.adminUser', model.get 'admins[0].username'

`export default schoolEditRoute`