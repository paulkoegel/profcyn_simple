'use strict'

class BB.AppRouter extends Backbone.Marionette.AppRouter

  initialize: ->
    console.log 'Router: initialize'

  routes:
    '': 'root'
    'admin': 'login'
    'login': 'login'
    'galleries/:id' : 'galleriesShow'

  root: ->
    console.log 'appRouter#root'
    @defaultSetup()
    BB.galleriesController.index()

  login: ->
    console.log 'appRouter#login'
    @defaultSetup()
    BB.sessionsController.new()

  galleriesShow: (params) ->
    console.log 'appRouter#galleriesShow', params
    @defaultSetup()
    BB.galleriesController.show(params)

  # stuff we need to initialize every time the page gets loaded via URL-request
  defaultSetup: ->
    BB.appLayout.navigation.show new BB.NavigationView()
