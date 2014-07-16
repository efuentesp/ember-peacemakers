`import DS from 'ember-data'`

School = DS.Model.extend
  name: DS.attr 'string'
  city: DS.attr 'string'
  createdAt: DS.attr 'date',
    defaultValue: ->
      new Date()

  type: DS.belongsTo 'school-type'
  state: DS.belongsTo 'state'
  classrooms: DS.hasMany 'classroom', {async: true}

School.reopenClass
  FIXTURES:
    [
      { id: 1, name: 'Esc. Sec. Diurna No.79 República de Chile', type: 'PUBLIC',  city: 'Iztapalapa', state: 'MX-DIF', classrooms: [1, 2] }
      { id: 2, name: 'Instituto Cumbres México', type: 'PRIVATE', city: 'Cuernavaca', state: 'MX-MOR', classrooms: [3] }
      { id: 3, name: 'Colegio de los Menonitas', type: 'PRIVATE', city: 'Toluca', state: 'MX-MEX' }
      { id: 4, name: 'Vito Alessio Robles', type: 'PRIVATE',  city: 'Coyoacán', state: 'MX-DIF' }
    ]

`export default School`