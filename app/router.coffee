`import Ember from 'ember'`

Router = Ember.Router.extend
  location: PmENV.locationType

Router.map ->
  @route 'login'
  @resource 'schools', ->
    @route 'show', { path: ':school_id' }
  @resource 'classrooms', { path: '/schools/:school_id/classrooms' }
  @resource 'classmates', { path: '/schools/:school_id/classrooms/:classroom_id' }
  @route 'setup'
  @route 'sociometricTestResults'
  @route 'surveyResults'
  @route 'sociogram'

  @route 'studentDashboard', { path: '/student/:student_id' }
  @route 'sociometricTestAssigned'
  @route 'surveyAssigned'

  @route '404', { path: '/*path' }

  #@route 'component-test'
  #@route 'helper-test'

`export default Router`
