define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    require 'models/post'
    ->

    class Posts extends Backbone.Collection
    
      model: Post