`import Ember from 'ember'`

InputEmailComponent = InputTextComponent.extend

  placeholder: 'email address'

  label: 'Email Address'

  validate: (value, status) ->
    if (!value || value.length == 0)
      @._super(value, status)
    else if (!value.match("^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$"))
      status(false, 'Please enter a valid email address')
    else
      # Insert AJAX call here:
      setTimeout(->
        status(true, 'Email address available')
      , 1000)

`export default InputEmailComponent`