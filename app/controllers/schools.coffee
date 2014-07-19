`import Ember from 'ember'`
`import FormController from '../mixins/form-controller'`

schoolsController = Ember.ArrayController.extend FormController,

  itemController: "school"

  sortProperties: ['createdAt']
  sortAscending: false

  newSchool: Ember.Object.create
    name: ''
    type: ''
    city: ''
    state: ''

  schoolTypes: (->
    @store.find "school-type"
  ).property()

  schoolStates: (->
    @store.find "state"
  ).property()

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
      isFormValid = @.get('isFormValid')
      if isFormValid
        schoolType = @newSchool.type
        schoolState = @newSchool.state
        school = @store.createRecord 'school',
          name: @newSchool.name
          city: @newSchool.city
        school.save().then =>
          @store.find('school-type', schoolType).then (type) ->
            school.set 'type', type
          @store.find('state', schoolState).then (state) ->
            school.set 'state', state
        @set('newSchool.name', '')
        @set('newSchool.type', '')
        @set('newSchool.city', '')
        @set('newSchool.state', '')
        Bootstrap.ModalManager.hide 'schoolModal', (error) ->
          school.rollback()
          alert error

    cancel: ->
      console.log "Cancel!!"
      @set('newSchool.name', '')
      @set('newSchool.type', '')
      @set('newSchool.city', '')
      @set('newSchool.state', '')

`export default schoolsController`