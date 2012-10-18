define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    require 'models/term'
    ->

    class window.Terms extends Backbone.Collection
    
      model: window.Term