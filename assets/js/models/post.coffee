define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    require 'views/post'
    ->

    class Post extends Backbone.Model
    