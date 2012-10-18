define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    require 'views/term'
    ->

    class window.Term extends Backbone.Model
    