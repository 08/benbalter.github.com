define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    require 'views/post'
    ->

    class window.Post extends Backbone.Model
    