$ ->

  $('#fast-order-button').bind 'click', ->

    $.post '/orders/fast', {'phone': $('input[name=fast_phone]').val(), 'item_id': $(@).attr('item_id')}, (data) =>
    $("input[name=fast_phone]").val('')

    alert('Ваша заявка принята')
    #reachGoal 'new-fast-order'