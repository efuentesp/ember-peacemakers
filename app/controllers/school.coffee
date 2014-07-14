`import Ember from 'ember'`

SchoolItemController = Ember.ObjectController.extend

  isNew: (->
    console.log "isNew()"
    isNew = false
    console.log @createdAt
    console.log moment(@createdAt).startOf('day').fromNow()
    unless moment(@createdAt).startOf('hour').fromNow() > 1
      isNew = true
    isNew
  ).property('createdAt')

  actions:
    editSchool: ->
      console.log "Edit School!!"

`export default SchoolItemController`