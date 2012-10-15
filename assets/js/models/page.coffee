define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    require 'assets/js/views/page.js'
    ->

    class Page extends Backbone.Model
    