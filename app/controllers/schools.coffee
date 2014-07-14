`import Ember from 'ember'`

schoolsController = Ember.ArrayController.extend

  itemController: "school"

  sortProperties: ['createdAt']
  sortAscending: true

  schoolName: ""
  schoolType:
    id: ''
  schoolTypes: [
    { id: '', name: '-- Seleccionar --' }
    { id: 'PUBLIC', name: 'Pública' }
    { id: 'PRIVATE', name: 'Privada' }
  ]

  schoolState:
    id: ''
  schoolStates: [
    { id: '', name: '-- Seleccionar --' }
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
      console.log @schoolStates
      console.log @schoolState.id
      schoolStateSelected = _.find @schoolStates, { 'id': @schoolState.id }
      console.log schoolStateSelected.name
      school = @get('store').createRecord 'school',
        name: @schoolName
        type: @schoolType.id
        city: @schoolCity
        state: @schoolState.id
        createdAt: new Date()
      @set('schoolName', '')
      @set('schoolCity', '')
      @set('schoolType', '')
      @set('schoolState', '')
      promise = school.save()
      Bootstrap.ModalManager.hide 'schoolModal', (error) ->
        school.rollback()
        alert error

    cancel: ->
      console.log "Cancel!!"


`export default schoolsController`