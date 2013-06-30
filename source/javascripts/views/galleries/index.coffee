'use strict'

class BB.GalleriesIndexView extends Backbone.Marionette.CompositeView

  className: 'm-galleries'
  itemViewContainer: '#js-galleries-wrapper'

  initialize: ->
    @template = 'galleries_index'
    @itemView = BB.GalleriesIndexItemView
    @collection.on 'change', @render
