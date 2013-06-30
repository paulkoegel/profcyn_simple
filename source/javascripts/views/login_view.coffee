'use strict'

class BB.LoginView extends Marionette.ItemView
  template: 'login'

  events:
    'submit .m-login': 'submit'
  
  submit: (event) ->
    event.preventDefault()
    console.log 'LoginView: submit'
    console.log @$('[name="email"]').val()
    $.ajax
      type: 'POST'
      url: 'http://localhost:4000/sessions'
      data: JSON.stringify({email: 'paul@railslove.com', password: '123456'})
      processData: false
      dataType: 'json'
      contentType: 'application/json'
      success: (response) ->
        console.log 'POST Sessions#new success:', response

    # $.ajax
    #   type: 'GET'
    #   url: "#{@model.urlRoot}/status_counters"
    #   dataType: 'json'
    #   , success: (response) ->
    #     $tabs = $('.m-status-bar_full-width--item')
    #     # ensure the counters of all statuses not included in the response are set to 0
    #     $tabs.children('.m-status-bar_full-width--item--counter').text "(0)"
    #     _.each response, (status) ->
    #       $tabs.filter("[data-status_id='#{status.status_id}']").children('.m-status-bar_full-width--item--counter').text "(#{status.status_count})"
