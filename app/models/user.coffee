`import DS from 'ember-data'`

User = DS.Model.extend
  username: DS.attr 'string'
  password: DS.attr 'string'
  createdAt: DS.attr 'date',
    defaultValue: ->
      new Date()

  role: DS.belongsTo 'user-role'

User.reopenClass
  FIXTURES:
    [
      { id: 1, username: 'admin1', password: 'password1', role: 'PRINCIPAL' }
      { id: 2, username: 'admin2', password: 'password2', role: 'ASSISTANT' }
      { id: 3, username: 'admin3', password: 'password3', role: 'PRINCIPAL' }
    ]

`export default User`