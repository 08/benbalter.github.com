# Sets the require.js configuration for your application.
require.config

    # 3rd party script alias names (Easier to type "jquery" than "libs/jquery-1.7.2.min")
    paths:
        
        # Core Libraries
        modernizr: "libs/modernizr"
        jquery: "libs/jquery"
        underscore: "libs/lodash"
        backbone: "libs/backbone"
        templates: "../templates"
  
    # Sets the configuration for your third party scripts that are not AMD compatible
    shim:

        # Twitter Bootstrap jQuery plugins
        backbone:
            deps: ["underscore", "jquery"]
            exports: "Backbone" #attaches "Backbone" to the window object

# Include Desktop Specific JavaScript files here (or inside of your Desktop router)
require ["modernizr", "jquery", "backbone", "router", "collections/posts", "collections/pages", "collections/taxonomy" ], (Modernizr, $, Backbone, Router) ->

    # Instantiates a new Router
    @router = new Router()