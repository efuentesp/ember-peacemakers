`import Ember from 'ember'`
`import Focusable from '../mixins/focusable'`
`import AsyncValidation from '../mixins/async-validation'`

SelectListComponent = Ember.Component.extend Focusable, AsyncValidation,

  classNames: ['form-group']

  content: ""

  prompt: ""

  required: false

  validate: (value, status) ->
    # console.log 'required: ' + @.get('required')
    # console.log 'value: ' + value
    if (@.get('required') && (!value || value.trim().length == 0))
      status(false, @.get('label') + ' es requerido.')
    else
      @._super(value, status)

`export default SelectListComponent`