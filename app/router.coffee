`import Ember from 'ember'`

Router = Ember.Router.extend
  location: PmENV.locationType

Router.map ->
  @resource 'schools', ->
    @route 'show', { path: ':school_id' }
  @resource 'classrooms', { path: '/schools/:school_id/classrooms' }
  @resource 'classmates', { path: '/schools/:school_id/classrooms/:classroom_id' }

  #@route 'component-test'
  #@route 'helper-test'

`export default Router`
