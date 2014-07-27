`import DS from 'ember-data'`

School = DS.Model.extend
  name: DS.attr 'string'
  city: DS.attr 'string'
  country: DS.attr 'string',
    defaultValue: ->
      'México'
  createdAt: DS.attr 'date',
    defaultValue: ->
      new Date()

  type: DS.belongsTo 'school-type'
  state: DS.belongsTo 'state'
  classrooms: DS.hasMany 'classroom', {async: true}
  admins: DS.hasMany 'user', {async: true}

School.reopenClass
  FIXTURES:
    [
      { id: 1, name: 'Esc. Sec. Diurna No.79 República de Chile', type: 'PUBLIC',  city: 'Iztapalapa', state: 'MX-DIF', classrooms: [1, 2], admins: [1, 2], createdAt: moment().subtract('days', 7) }
      { id: 2, name: 'Instituto Cumbres México', type: 'PRIVATE', city: 'Cuernavaca', state: 'MX-MOR', classrooms: [3], admins: [3], createdAt: moment().subtract('days', 15) }
      { id: 3, name: 'Colegio de los Menonitas', type: 'PRIVATE', city: 'Toluca', state: 'MX-MEX', admins: [3, 2], createdAt: moment().subtract('days', 2) }
      { id: 4, name: 'Vito Alessio Robles', type: 'PUBLIC',  city: 'Coyoacán', state: 'MX-DIF', admins: [3], createdAt: moment().subtract('days', 100) }
    ]

`export default School`