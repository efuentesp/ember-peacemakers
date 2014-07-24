`import Ember from 'ember'`

schoolsController = Ember.ArrayController.extend

  sortProperties: ['createdAt']
  sortAscending: false

  isNew: (->
    console.log "isNew()"
    isNew = false
    today = moment()
    target = moment(@createdAt)
    diff = today.diff(target, 'days')
    console.log diff
    if diff <= 1
      isNew = true
    return isNew
  ).property('createdAt')

`export default schoolsController`