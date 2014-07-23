`import Ember from 'ember'`

EasyFormAdapter =
  name: 'easyForm'
  initialize: ->
    Ember.EasyForm.Input.reopen
      errorsChanged: ->
        @set('hasFocusedOut', true)
        @showValidationError()
      classNameBindings: ['wrapperconfig.inputClass', 'wrapperErrorClass']
      didInsertElement: ->
        @addObserver('context.errors'+@property+'.@each', @, 'errorsChanged')

    Ember.EasyForm.Error.reopen
      errorText: (->
        return @get('errors.firstObject.message')
      ).property('errors.firstObject.message', 'errors.firstObject').cacheable()
      updateParentView: (->
        parentView.get('parentView')
        if @get('errors.length') > 0
          parentView.set('wrapperErrorClass', 'has-error')
        else
          parentView.set('wrapperErrorClass', false)
      ).observes('errors.firstObject.message', 'errors.firstObject')

    Ember.EasyForm.Submit.reopen
      disabled: (->
        return @get('formForModel.disableSubmit')
      ).property('formForModel.disableSubmit')

    Ember.EasyForm.Config.registerWrapper 'default',
      # inputTemplate: 'form-fields/input'
      labelClass: 'control-label'
      inputClass: 'form-group'
      buttonClass: 'btn btn-primary'
      fieldErrorClass: 'has-error'
      errorClass: 'help-block'

`export default EasyFormAdapter`