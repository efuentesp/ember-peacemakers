`import DS from 'ember-data'`

UserRole = DS.Model.extend
  name: DS.attr 'string'

UserRole.reopenClass
  FIXTURES:
    [
      { id: 'ADMIN',  name: 'Administrador' }
      { id: 'PRINCIPAL',  name: 'Director' }
      { id: 'ASSISTANT', name: 'Asistente' }
      { id: 'STUDENT', name: 'Estudiante' }
    ]

`export default UserRole`