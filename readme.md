# Twitter Bootstrap Scaffolding

This is an experimental Grails project using Twitter Bootstrap for scaffolded views.

## Demo

[Check out the demo](http://grails-twitter-bootstrap.cloudfoundry.com) on Cloud Foundry.

## Installation

You can either use this project as a template or to add to an existing Grails application:

1. Install the _Twitter Bootstrap Resources_ plugin, i.e. add `runtime ":twitter-bootstrap:2.1.0.1"` to _BuildConfig.groovy_.
2. Install the _Fields_ plugin, i.e. add `runtime ":fields:1.3"` to _BuildConfig.groovy_.
3. Copy the following files into your Grails application.
   * `src/templates/scaffolding/*` 
   * `web-app/css/scaffolding.css`
   * `grails-app/conf/ScaffoldingResources.groovy`
   * `grails-app/taglib/**/*`
   * `grails-app/views/index.gsp`
   * `grails-app/views/layouts/bootstrap.gsp`
   * `grails-app/views/_fields/default/_field.gsp`
