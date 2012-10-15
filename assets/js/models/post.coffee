define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    require 'assets/js/views/post.js'
    ->

    class Post extends Backbone.Model
    