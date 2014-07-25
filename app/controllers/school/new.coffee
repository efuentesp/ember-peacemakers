`import Ember from 'ember'`

SchoolItemController = Ember.ObjectController.extend

  newSchool: Ember.Object.createWithMixins Ember.Validations.Mixin,
    name: ''
    type: ''
    city: ''
    state: ''
    adminuser: ''
    adminpassword: ''
    assisstantuser: ''
    assisstantpassword: ''

    validations:
      name:
        presence: true
      city:
        presence: true
      type:
        presence: true
      state:
        presence: true

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

      school = @store.createRecord 'school',
        name: @newSchool.name
        city: @newSchool.city
        type: @newSchool.type
        state: @newSchool.state

      school.save()
      @.transitionToRoute "schools"

    cancel: ->
      console.log "Cancel!!"
      @.transitionToRoute "schools"

`export default SchoolItemController`