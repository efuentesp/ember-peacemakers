`import Ember from 'ember'`

AsyncValidation = Ember.Mixin.create

  label: ''

  value: ''

  statusClass: (->
    if (!@.get('focused') && (@.get('showFieldValidation') || @.get('formController.showFieldValidation')))
      @.get('isValid') ? 'has-success' : 'has-error'
    else
      ''
  ).property('isValid', 'showFieldValidation', 'formController.showFieldValidation', 'focused')

  classNameBindings: ['statusClass']

  statusMessage: ''

  message: (->
    if (!@.get('focused') && (@.get('showFieldValidation') || @.get('formController.showFieldValidation')))
      @.get('statusMessage')
    else
      ''
  ).property('isValid', 'showFieldValidation', 'formController.showFieldValidation', 'focused')

  showFieldValidation: false

  formController: null

  isValid: false
 
  # register this field with the form controller
  registerFieldWithController: (->
    @.validateField()
    validationFields = @.get('formController.validationFields')
    if (validationFields)
      validationFields.pushObject(@)
  ).on('didInsertElement')
 
  # turn on field validation info after first focus
  enableShowFieldValidaion: (->
    if (@.get('focused') && !@.get('showFieldValidation'))
      @.set('showFieldValidation', true)
  ).observes('focused')
 
  # check if the field is valid
  validateField: (->
    value = @.get('value')
    isValid = false
    self = @
    # Call the specific validation function, passing the
    # value to validate and a callback to which the function
    # must pass the result of the validation.
    @.validate value, (isValid, message) ->
      # Make sure that the value hasn't changed since async validation
      if (value == self.get('value'))
        self.set('statusMessage', message)
        self.set('isValid', isValid)
  ).observes('value')
 
  # base validation function, if we get @ far then the field is valid
  validate: (value, status) ->
    status(true, '')

`export default AsyncValidation`