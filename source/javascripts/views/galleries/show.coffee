'use strict'

class BB.GalleriesShowView extends Backbone.Marionette.ItemView

  className: 'm-gallery'

  initialize: ->
    @template = 'galleries_show'
    @model.on 'change', @render
