`import Ember from 'ember'`

SchoolItemController = Ember.ObjectController.extend
  actions:
    editSchool: ->
      console.log "Edit School!!"

`export default SchoolItemController`