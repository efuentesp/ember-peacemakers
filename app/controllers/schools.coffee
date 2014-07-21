`import Ember from 'ember'`

schoolsController = Ember.ArrayController.extend

  sortProperties: ['createdAt']
  sortAscending: false

  isNew: (->
    console.log "isNew()"
    isNew = false
    console.log @createdAt
    console.log moment(@createdAt).startOf('day').fromNow()
    unless moment(@createdAt).startOf('hour').fromNow() > 1
      isNew = true
    isNew
  ).property('createdAt')

`export default schoolsController`