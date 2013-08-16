$ ->

  $('#fast-order-button').bind 'click', ->

    $.post '/orders/fast', {'phone': $('input[name=fast_phone]').val(), 'item_id': $(@).attr('item_id')}, (data) =>
      console.log data

    $("input[name=fast_phone]").val('')