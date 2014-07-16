`import Ember from 'ember'`

schoolsController = Ember.ArrayController.extend

  itemController: "school"

  sortProperties: ['createdAt']
  sortAscending: false

  newSchool: Ember.Object.create
    name: ''
    type: ''
    city: ''
    state: ''

  schoolTypes: [
    { id: 'PUBLIC', name: 'Pública' }
    { id: 'PRIVATE', name: 'Privada' }
  ]

  schoolStates: [
    { id: 'MX-DIF', name: 'Distrito Federal' }
    { id: 'MX-AGU', name: 'Aguascalientes' }
  ]

  modalButtons: [
    Ember.Object.create({title: 'Cancelar', clicked: "cancel", dismiss: 'modal'})
    Ember.Object.create({title: 'Guardar', type: "primary", clicked: "submit", id: "btn_saveNewSchool"})
  ]

  # isValid: (->
  #   console.log "isValid()"
  #   msg = ""
  #   isValid = true

  #   str = @get('schoolName')
  #   console.log "schoolName = " + str

  #   unless str
  #     isValid = false
  #     msg += "El campo no puede estar vacio."

  #   @set('errName', msg)
  #   isValid
  # ).property('schoolName')

  actions:
    # Main Actions
    addSchool: ->
      console.log "Add School!!"
      return Bootstrap.ModalManager.show('schoolModal');

    # Row Actions
    submit: ->
      console.log @newSchool.type
      # schoolStateSelected = _.find @newSchool.state, { 'id': @schoolState.id }
      school = @store.createRecord 'school',
        name: @newSchool.name
        # type: @newSchool.type
        city: @newSchool.city
        # state: @newSchool.state
        # createdAt: new Date()
      @store.find('school-type', @newSchool.type).then (schoolType) ->
        console.log "schoolType: " + schoolType.name
        school.set 'type', schoolType
      @store.find('state', @newSchool.state).then (schoolState) ->
        console.log "schoolState: " + schoolState.name
        school.set 'state', schoolState
      @set('newSchool.name', '')
      @set('newSchool.type', '')
      @set('newSchool.city', '')
      @set('newSchool.state', '')
      promise = school.save()
      Bootstrap.ModalManager.hide 'schoolModal', (error) ->
        school.rollback()
        alert error

    cancel: ->
      console.log "Cancel!!"


`export default schoolsController`