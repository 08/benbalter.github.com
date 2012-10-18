define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    ->

    class window.PageView extends Backbone.View
    