`import DS from 'ember-data'`

#ApplicationAdapter = DS.FixtureAdapter

ApplicationAdapter = DS.RESTAdapter.extend
  namespace: 'api'

`export default ApplicationAdapter`