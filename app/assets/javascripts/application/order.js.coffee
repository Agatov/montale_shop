$ ->

  $('.add-to-cart').bind 'click', ->

    $.post '/cart', {'volume_id': $(@).attr('volume_id')}, (data) =>
      $('#cart').text($(data).html())
      $('#cart').show()


  $('.remove-from-cart').bind 'click', ->
    $.post '/cart/remove', {'volume_id': $(@).attr('volume_id')}, (data) =>
      $(@).parents('tr').remove()

      if $(data).html() == ''
        $('#cart-list').hide()
        $("#cart-empty").show()
        $('#cart').hide()
      else
        $('#cart').text($(data).html())
        $('#cart').show()





  $('.clear-cart').bind 'click', ->

    $.get '/cart/clear', (data) =>
      $('#cart').html('')
      $('#cart').hide()
      $('#cart-list').remove()
      $("#cart-empty").show()