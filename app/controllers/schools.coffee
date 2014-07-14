`import Ember from 'ember'`

schoolsController = Ember.ArrayController.extend

  itemController: "school"

  sortProperties: ['name']
  sortAscending: false

  schoolName: ""

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
      console.log "SUBMIT!!"
      school = @get('store').createRecord 'school',
        name: @schoolName
        type: @schoolType
        city: @schoolCity
        state: @schoolState
        createdAt: new Date()
      @set('schoolName', '')
      @set('schoolCity', '')
      #@get('store').commit()
      promise = school.save()
      Bootstrap.ModalManager.hide 'schoolModal', (error) ->
        school.rollback()
        alert error

    cancel: ->
      console.log "Cancel!!"


`export default schoolsController`