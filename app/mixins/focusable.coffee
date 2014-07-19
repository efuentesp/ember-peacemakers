`import Ember from 'ember'`

Focusable = Ember.Mixin.create

  focused: false

  focusIn: (event) ->
    @.set 'focused', true

  focusOut: (event) ->
    @.set 'focused', false

  autofocus: false

  shouldAutoFocus: (->
    @.$('input').focus() if @.get('autofocus')
  ).on('didInsertElement')

`export default Focusable`