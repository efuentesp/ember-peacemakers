`import Ember from 'ember'`

Router = Ember.Router.extend
  location: PmENV.locationType

Router.map ->
  @route 'login'
  @resource 'schools'
  @resource 'school', ->
    @route 'new'
    @route 'edit', { path: '/school/edit/:school_id' }
    @route 'delete', { path: '/school/delete/:school_id' }
  @resource 'classrooms', { path: '/schools/:school_id/classrooms' }
  @resource 'classroom', ->
    @route 'new'
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
