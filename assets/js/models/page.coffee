define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    require 'views/page'
    ->

    class Page extends Backbone.Model
    