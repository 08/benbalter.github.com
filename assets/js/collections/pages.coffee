define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    require 'models/page'
    ->

    class Page extends Backbone.Collection
    
      model: Page