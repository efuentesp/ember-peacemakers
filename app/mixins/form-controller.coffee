`import Ember from 'ember'`

FormController = Ember.Mixin.create

  showFieldValidation: false

  validationFields: Ember.A()

  isFormValid: (->
    return !@.get('validationFields').any (field) ->
      return !field.get('isValid')
  ).property('validationFields.@each.isValid')

`export default FormController`