`import Ember from 'ember'`

schoolsController = Ember.ArrayController.extend

  sortProperties: ['createdAt']
  sortAscending: false

  isNew: (->
    # console.log "isNew()"
    isNew = false
    today = moment()
    target = moment(@createdAt)
    diff = today.diff(target, 'days')
    # console.log diff
    if diff <= 1
      isNew = true
    return isNew
  ).property('createdAt')

  searchedContent: (->
    # console.log "searchedContent"
    stringToFilter = @get('school-filter')
    regexp = new RegExp stringToFilter

    return @get('content').filter (item) ->
      return regexp.test item.get('name').toLowerCase()

  ).property('school-filter', 'content.@each.name')

`export default schoolsController`