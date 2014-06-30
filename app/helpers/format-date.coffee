`import Ember from 'ember'`

formatDateHelper = Ember.Handlebars.makeBoundHelper (date) ->
  moment(date).format('DD-MMM-YYYY')

`export default formatDateHelper`