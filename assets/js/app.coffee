app = 
    models: {}
    collections: {}
    views: {}

#Router
class Router extends Backbone.Router
    
    routes:

        "": "home"
        ":year/:month/:day/:slug/": "post"
        ":slug/": "page"

    home: -> 
        console.log "home"            

    post: ( year, month, day, slug )->
        console.log year, month, day, slug, 'post'
        
    page: ( slug ) ->
        page = new app.models.Page { id: slug }
        page.on( 'change', page.view.render, page  )
        page.fetch()
        
    initialize: ->

        pushState = !!(window.history && window.history.pushState)
        Backbone.history.start pushState: pushState, silent: true       


#views
class View extends Backbone.View
    el: $('#content')
    
class app.views.PageView extends View

    template: _.template $('#page_template').html()
    
    render: ->
        html = @.view.template @.toJSON()
        $(@view.el).html html 

#models
class Model extends Backbone.Model

    url: ->
        window.siteUrl + @id + '.json'

class app.models.Page extends Model
    view: new app.views.PageView({ model: @ })
        
class app.models.Post extends Model

#collections
class app.collections.Pages extends Backbone.Collection
    model: app.models.Page
    url: window.siteURL + 'pages.json'
    
class app.collections.Posts extends Backbone.Collection
    model: app.models.Post
    url: window.siteURL + 'posts.json'



#init
app.router = new Router()
window.app = app

# Rewrite URLs
$('a[href^="' + window.siteUrl + '"]').live( 'click', (e) ->
    e.preventDefault();
    app.router.navigate( $(this).attr('href').replace( window.siteUrl, '' ), {trigger:true} )
    false
)