define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    require 'models/term'
    ->

    class Terms extends Backbone.Collection
    
      model: Term