define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    require 'assets/js/models/term.js'
    ->

    class Terms extends Backbone.Collection
    
      model: Term