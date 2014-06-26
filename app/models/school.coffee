`import DS from 'ember-data'`

School = DS.Model.extend
  name: DS.attr 'string'
  type: DS.attr 'string'

`export default School`