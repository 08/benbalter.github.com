define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    require 'models/page'
    ->

    class window.Page extends Backbone.Collection
    
      model: window.Page