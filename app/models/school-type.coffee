`import DS from 'ember-data'`

SchoolType = DS.Model.extend
  name: DS.attr 'string'

SchoolType.reopenClass
  FIXTURES:
    [
      { id: 'PUBLIC',  name: 'Pública' }
      { id: 'PRIVATE', name: 'Privada' }
    ]

`export default SchoolType`