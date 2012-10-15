define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    require 'assets/js/views/term.js'
    ->

    class Term extends Backbone.Model
    