`import Ember from 'ember'`

formatDateHelper = Ember.Handlebars.makeBoundHelper (date) ->
  moment.lang('es')
  return moment(date).format('LL')

`export default formatDateHelper`