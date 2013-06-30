'use strict'

class BB.GalleryModel extends Backbone.Model

  urlRoot: 'localhost:3000/galleries/'
  
  # initialize: (attrs) ->
  #   @url = '/galleries/' + @get('id')
  #
  dynamicUrl: ->
    @url + '/' + @get 'id'

  parse: (attrs) ->
    @url = BB.relativeUrl(@url) # for WHATEVER reason, even though @collection.url is '/galleries', we'd get 'http://localhsot:4000/galleries/1 @url
    console.log BB.relativeUrl(@url)
    attrs

  externalUrl: ->
    BB.apiRoot + @url
