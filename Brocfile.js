/* global require, module */

var EmberApp = require('ember-cli/lib/broccoli/ember-app');
var pickFiles = require('broccoli-static-compiler');
var mergeTrees = require('broccoli-merge-trees');

var app = new EmberApp({
  name: require('./package.json').name,

  // for some large projects, you may want to uncomment this (for now)
  es3Safe: true,

  minifyCSS: {
    enabled: true,
    options: {}
  },

  getEnvJSON: require('./config/environment')
});

// Use `app.import` to add additional libraries to the generated
// output files.
//
// If you need to use different assets in different
// environments, specify an object as the first parameter. That
// object's keys should be the environment name and the values
// should be the asset to use in that environment.
//
// If the library that you are including contains AMD or ES6
// modules that you would like to import into your application
// please specify an object with the list of modules as keys
// along with the exports of each module as its value.

app.import({
  development: 'vendor/ember-data/ember-data.js',
  production:  'vendor/ember-data/ember-data.prod.js'
}, {
  'ember-data': [
    'default'
  ]
});

app.import('vendor/ic-ajax/dist/named-amd/main.js', {
  'ic-ajax': [
    'default',
    'defineFixture',
    'lookupFixture',
    'raw',
    'request',
  ]
});

['transition.js', 'dropdown.js', 'collapse.js'].forEach(function(path) {
  var fullPath = 'vendor/bootstrap-sass-official/assets/javascripts/bootstrap/' + path;
  app.import(fullPath);
});

[ 'bs-core.min.js',
  'bs-modal.min.js',
  'bs-label.min.js',
  'bs-button.min.js',
  'bs-basic.min.js',
  'bs-popover.min.js',
  'bs-progressbar.min.js',
  'bs-label.min.js'
].forEach(function(path) {
  var fullPath = 'vendor/ember-addons.bs_for_ember/dist/js/' + path;
  app.import(fullPath);
});

var fontawesome = pickFiles('vendor/font-awesome/fonts', {
  srcDir: '/',
  files: [
    'FontAwesome.otf',
    'fontawesome-webfont.eot',
    'fontawesome-webfont.svg',
    'fontawesome-webfont.ttf',
    'fontawesome-webfont.woff'
  ],
  destDir: '/fonts'
});

app.import({development: 'vendor/route-recognizer/dist/route-recognizer.js'});
app.import({development: 'vendor/FakeXMLHttpRequest/fake_xml_http_request.js'});
app.import({development: 'vendor/pretender/pretender.js'});

app.import('vendor/moment/moment.js');

app.import('vendor/lodash/dist/lodash.min.js');

//module.exports = app.toTree();
module.exports = mergeTrees([
  app.toTree(),
  fontawesome
]);
