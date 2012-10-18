define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    require 'models/post'
    ->

    class window.Posts extends Backbone.Collection
    
      model: window.Post