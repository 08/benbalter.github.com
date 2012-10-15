define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    require 'assets/js/models/post.js'
    ->

    class Posts extends Backbone.Collection
    
      model: Post