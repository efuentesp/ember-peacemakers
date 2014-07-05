`import DS from 'ember-data'`

SociometricTest = DS.Model.extend
  name: DS.attr 'string'
  type: DS.attr 'string'
  city: DS.attr 'string'
  state: DS.attr 'string'
  createdAt: DS.attr 'date'

  classrooms: DS.hasMany 'classroom', {async: true}

SociometricTest.reopenClass
  FIXTURES:
    [
      { id: 1, name: 'Esc. Sec. Diurna No.79 República de Chile', type: 'Pública',  city: 'Iztapalapa', state: 'Distrito Federal', createdAt: new Date(), classrooms: [1, 2] }
      { id: 2, name: 'Instituto Cumbres México', type: 'Privada', city: 'Cuernavaca', state: 'Morelos', createdAt: new Date(), classrooms: [3] }
      { id: 3, name: 'Colegio de los Menonitas', type: 'Privada', city: 'Toluca', state: 'Estado de México', createdAt: new Date() }
      { id: 4, name: 'Vito Alessio Robles', type: 'Pública',  city: 'Coyoacán', state: 'Distrito Federal', createdAt: new Date() }
    ]

`export default SociometricTest`