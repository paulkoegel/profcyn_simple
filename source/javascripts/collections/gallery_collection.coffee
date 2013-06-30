'use strict'

class BB.GalleryCollection extends Backbone.Collection

  url: '/galleries'
  
  initialize: ->
    @model = BB.GalleryModel

  parse: (attrs) ->
    attrs.url = @url
    attrs

  externalUrl: ->
    BB.apiRoot + @url
