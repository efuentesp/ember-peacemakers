`import DS from 'ember-data'`

State = DS.Model.extend
  name: DS.attr 'string'

State.reopenClass
  FIXTURES:
    [
      { id: 'MX-DIF',  name: 'Distrito Federal' }
      { id: 'MX-AGU', name: 'Aguascalientes' }
      { id: 'MX-MEX', name: 'Estado de México' }
      { id: 'MX-MOR', name: 'Morelos' }
    ]

`export default State`