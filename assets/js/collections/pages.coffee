define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    require 'assets/js/models/page.js'
    ->

    class Page extends Backbone.Collection
    
      model: Page