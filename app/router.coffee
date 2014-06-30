`import Ember from 'ember'`

Router = Ember.Router.extend
  location: PmENV.locationType

Router.map ->
  @resource 'schools', ->
    @route 'show', { path: ':school_id' }
  @resource 'classrooms', { path: '/schools/:school_id/classrooms' }
  @route 'component-test'
  @route 'helper-test'

`export default Router`
