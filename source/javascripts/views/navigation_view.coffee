'use strict'

class BB.NavigationView extends Marionette.ItemView
  template: 'navigation'
  tagName: 'nav'

  initialize: ->
    console.log 'navigationView: initialize'

  onRender: ->
    console.log 'navigationView: onRender'

  events:
    'click a': 'navigate'

  navigate: (event) ->
    event.preventDefault()
    BB.appRouter.navigate($(event.target).attr('href'), true)
