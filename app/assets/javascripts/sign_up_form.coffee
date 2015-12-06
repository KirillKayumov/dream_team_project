class SignUpForm
  constructor: (@$el) ->
    @_bindEvents()

  _bindEvents: ->
    @$el.on "ajax:success", @_redirect

  _redirect: ->
    console.log("lol")
    window.location.replace("/")

$.fn.signUpForm = ->
  $(@).each ->
    unless $.data(@, "sign-up-form")
      $.data(@, "sign-up-form", new SignUpForm($(@)))
