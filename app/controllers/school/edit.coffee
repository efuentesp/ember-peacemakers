`import Ember from 'ember'`

SchoolItemController = Ember.ObjectController.extend

  newSchool: Ember.Object.createWithMixins Ember.Validations.Mixin,
    name: ''
    type: ''
    city: ''
    state: ''
    adminUser: ''
    adminPassword: ''
    assistantUser: ''
    assistantPassword: ''

    validations:
      name:
        presence: true
        length: {maximum: 100}
      city:
        presence: true
      type:
        presence: true
      state:
        presence: true
        length: {maximum: 80}
      adminUser:
        presence: true
        length: {minimum: 3, maximum: 50}
      adminPassword:
        presence: true
        length: {minimum: 5, maximum: 15}
      assistantUser:
        presence: true
        length: {minimum: 3, maximum: 50}
      assistantPassword:
        presence: true
        length: {minimum: 5, maximum: 15}

  schoolTypes: (->
    @store.find "school-type"
  ).property()

  schoolStates: (->
    @store.find "state"
  ).property()

  actions:
    submit: ->
      console.log "Sumbit!!"

      locals = {}

      async.series
        findRolePrincipal: (cb) =>
          # console.log "findRolePrincipal (async)"
          @store.find("user-role", "PRINCIPAL").then (role) ->
            # console.log role
            locals.rolePrincipal = role
            cb(null, role)
        findRoleAssistant: (cb) =>
          # console.log "findRoleAssistant (async)"
          @store.find("user-role", "ASSISTANT").then (role) ->
            # console.log role
            locals.roleAssistant = role
            cb(null, role)
        createUserPrincipal: (cb) =>
          # console.log "createUserPrincipal (async)"
          principal = @store.createRecord 'user',
            username: @newSchool.adminUser
            password: @newSchool.adminPassword
            role: locals.rolePrincipal
          principal.save().then (user) ->
            # console.log user
            locals.userPrincipal = user
            cb(null, user)
        createUserAssistant: (cb) =>
          # console.log "createUserAssistant (async)"
          assistant = @store.createRecord 'user',
            username: @newSchool.assistantUser
            password: @newSchool.assistantPassword
            role: locals.roleAssistant
          assistant.save().then (user) ->
            # console.log user
            locals.userAssistant = user
            cb(null, user)
        createSchool: (cb) =>
          # console.log "createSchool (async)"
          school = @store.createRecord 'school',
            name: @newSchool.name
            city: @newSchool.city
            type: @newSchool.type
            state: @newSchool.state
          school.save().then (school) ->
            # console.log school
            locals.school = school
            cb(null, school)
        addSchoolAdmins: (cb) ->
          # console.log "addSchoolAdmins (async)"
          # console.log locals.school
          # console.log locals.userPrincipal
          school = locals.school
          school.get("admins").then (admins) ->
            admins.pushObject(locals.userPrincipal)
            admins.pushObject(locals.userAssistant)
            school.save().then (school) ->
              # console.log school
              locals.school = school
              cb(null, school)
      , (err, result) =>
        # console.log "result (async)"
        # console.log result
        @.transitionToRoute "schools"

    cancel: ->
      console.log "Cancel!!"
      @.transitionToRoute "schools"

`export default SchoolItemController`