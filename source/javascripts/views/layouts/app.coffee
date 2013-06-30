'use strict'

class BB.AppLayout extends Marionette.Layout
  template: 'app'
  id: 'bb-app-layout'
  regions:
    navigation: '#bb-app-layout--navigation'
    content:    '#bb-app-layout--content'
