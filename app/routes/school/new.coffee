`import Ember from 'ember'`

schoolNewRoute = Ember.Route.extend

  setupController: (controller, model) ->
    @_super(controller, model)
    newSchool = controller.get 'newSchool'
    newSchool.set "name"
    newSchool.set "type"
    newSchool.set "city"
    newSchool.set "state"

`export default schoolNewRoute`