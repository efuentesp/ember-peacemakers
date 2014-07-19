`import Ember from 'ember'`
`import Focusable from '../mixins/focusable'`
`import AsyncValidation from '../mixins/async-validation'`

InputTextComponent = Ember.Component.extend Focusable, AsyncValidation,

  classNames: ['form-group']

  type: 'text'

  placeholder: ''

  required: false

  validate: (value, status) ->
    if (@.get('required') && (!value || value.trim().length == 0))
      status(false, @.get('label') + ' es requerido.')
    else
      @._super(value, status)

`export default InputTextComponent`