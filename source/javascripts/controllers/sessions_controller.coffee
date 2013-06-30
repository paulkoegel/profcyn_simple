'use strict'

class BB.SessionsController extends Marionette.Controller

  initialize: ->
    console.log 'SessionsController: initialize'

  new: ->
    BB.appLayout.content.show(new BB.LoginView())
