`import Ember from 'ember'`

schoolsController = Ember.ArrayController.extend

  #itemController: "SchoolController"

  sortProperties: ['name']
  sortAscending: false

  schoolName: ""

  modalButtons: [
    Ember.Object.create({title: 'Cancelar', clicked: "cancel", dismiss: 'modal'})
    Ember.Object.create({title: 'Guardar', type: "primary", clicked: "submit", id: "btn_saveNewSchool"})
  ]

  isValid: (->
    console.log "isValid()"
    msg = ""
    isValid = true

    str = @get('schoolName')
    console.log "schoolName = " + str

    unless str
      isValid = false
      msg += "El campo no puede estar vacio."

    @set('errName', msg)
    isValid
  ).property('schoolName')

  actions:
    classrooms: ->
      console.log "List Classrooms!!"

    addSchool: ->
      console.log "Add School!!"
      return Bootstrap.ModalManager.show('schoolModal');

`export default schoolsController`