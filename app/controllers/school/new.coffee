`import Ember from 'ember'`
`import FormController from '../../mixins/form-controller'`

SchoolItemController = Ember.ObjectController.extend FormController,

  newSchool: Ember.Object.create
    name: ''
    type: ''
    city: ''
    state: ''
    adminuser: ''
    adminpassword: ''
    assisstantuser: ''
    assisstantpassword: ''

  typeaheadcontent: [
    Ember.Object.create({colour: "Red"})
    Ember.Object.create({colour: "Green"})
    Ember.Object.create({colour: "Blue"})
    Ember.Object.create({colour: "Blue 1"})
    Ember.Object.create({colour: "Blue 2"})
    Ember.Object.create({colour: "Blue 3"})
    Ember.Object.create({colour: "Blue 4"})
    Ember.Object.create({colour: "Blue 5"})
    Ember.Object.create({colour: "Blue 6"})
  ]

  schoolTypes: (->
    @store.find "school-type"
  ).property()

  schoolStates: (->
    @store.find "state"
  ).property()

  actions:
    submit: ->
      console.log "Sumbit!!"
      console.log @newSchool.name
      console.log @newSchool.type
      console.log @newSchool.city
      console.log @newSchool.state
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
        console.log school
        # @set('newSchool.name', '')
        # @set('newSchool.type', '')
        # @set('newSchool.city', '')
        # @set('newSchool.state', '')
        @.transitionToRoute "schools"

    cancel: ->
      console.log "Cancel!!"
      # @set('newSchool.name', '')
      # @set('newSchool.type', '')
      # @set('newSchool.city', '')
      # @set('newSchool.state', '')
      @.transitionToRoute "schools"

`export default SchoolItemController`