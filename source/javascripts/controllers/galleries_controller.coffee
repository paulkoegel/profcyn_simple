'use strict'

class BB.GalleriesController extends Marionette.Controller

  initialize: ->
    console.log 'GalleriesController: initialize'

  index: ->
    console.log 'GalleriesController#index'
    CH.galleries ||= new BB.GalleryCollection()
    CH.galleries.fetch
      url: CH.galleries.externalUrl()
    BB.appLayout.content.show(new BB.GalleriesIndexView(collection: CH.galleries))

  show: (id) ->
    console.log 'GalleriesController#show'
    gallery = new BB.GalleryModel(id: id || 1)
    BB.appLayout.content.show(new BB.GalleriesShowView(model: gallery))
    console.log 'aaa', gallery.externalUrl()
    gallery.fetch
      url: gallery.externalUrl()
      success: ->
        console.log 'successs'
    console.log 'bbb'
