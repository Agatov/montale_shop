$ ->

  $('#make-order').bind 'click', ->

    show_order_form()
    $('.modal-overlay').bind 'click', ->
      hide_order_form()


    false

  $('#order-button').bind 'click', ->

    name = $(@).parent().find('input[name=username]')
    if name.val().length < 2
      name.css 'border', '1px solid red'
      return false
    else
      name.css 'border', '1px solid #ddd'

    phone = $(@).parent().find('input[name=phone]')
    if phone.val().length < 7
      phone.css 'border', '1px solid red'
      return false
    else
      name.css 'border', '1px solid #ddd'





    $('.modal-overlay').bind 'click', ->
      hide_thank_you()

    $.post '/orders', {'order[username]': $('input[name=username]').val(), 'order[phone]': $('input[name=phone]').val()}, (data) =>

    $('.modal-overlay').unbind 'click'
    $('.modal-overlay').bind 'click', ->
      hide_thank_you()

    hide_order_form(false)
    show_thank_you()

    $('#cart').hide()
    $('#cart-list').hide()
    $('#cart-empty').show()

    reachGoal 'new-order'

    false

  $('#hide-thank-you').bind 'click', ->
    hide_thank_you()
    false


window.show_order_form = ->
  $('.modal-overlay').show()
  $('.modal-overlay').animate({'opacity': '0.8'}, 300, ->
    $('.modal-dialog').css('bottom', '-300px')
    $('.modal-dialog').css('left', '50%')
    $('.modal-dialog').show()
    $('.modal-dialog').animate({'bottom': '50%'}, 500)
  )

window.hide_order_form = (hide_overlay = true) ->
  $('.modal-dialog').animate({'left': '-2000px'}, 500, ->
    $('.modal-dialog').hide()
    if hide_overlay
      $('.modal-overlay').animate {'opacity': '0'}, 300, ->
      $('.modal-overlay').hide()
  )

window.show_thank_you = ->

  $('.modal-overlay').show()
  $('.modal-overlay').animate({'opacity': '0.8'}, 300, ->
    $('.modal-thank-you').css('right', '-500px')
    $('.modal-thank-you').css('top', '50%')
    $('.modal-thank-you').show()
    $('.modal-thank-you').animate({'right': '50%'}, 500)

#    $('.modal-overlay').animate {'opacity': '0'}, 300, ->
#      $('.modal-overlay').hide()
  )

window.hide_thank_you = ->
  $('.modal-thank-you').animate {'top': '-2000px'}, 500, ->
    $('.modal-thank-you').hide()
    $('.modal-overlay').animate {'opacity': '0'}, 300, ->
      $('.modal-overlay').hide()



window.reachGoal = (goal) ->
  yaCounter23389516.reachGoal goal