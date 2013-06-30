'use strict'

class BB.GalleriesIndexItemView extends Backbone.Marionette.ItemView

  className: 'm-galleries--item'

  initialize: ->
    @template = 'galleries_index_item'
    @model.on 'change', @render

  events:
    'click a': 'navigate'

  navigate: (event) ->
    console.log 'navigate to:', $(event.target).attr('href')
    event.preventDefault()
    BB.appRouter.navigate $(event.target).attr('href'), trigger: false
    BB.galleriesController.show(@model.get 'id')

  serializeData: ->
    data = @model.toJSON()
    data.url = @model.dynamicUrl()
    data
