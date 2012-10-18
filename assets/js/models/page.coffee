define (require) ->

    $           = require 'jquery'
    _           = require 'underscore'
    Backbone    = require 'backbone'
    require 'views/page'
    ->

    class window.Page extends Backbone.Model
        url: ->
            @id.replace(new RegExp( '/$'), '.json')
    