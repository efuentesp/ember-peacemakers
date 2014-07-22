`import Ember from 'ember'`

EasyFormAdapter = Ember.EasyForm.Config.registerWrapper 'bootstrap',
  formClass: ''
  fieldErrorClass: 'has-error'
  inputClass: 'form-group'
  errorClass: 'help-block error'
  hintClass: 'help-block'
  labelClass: ''

`export default EasyFormAdapter`