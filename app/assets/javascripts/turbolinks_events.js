$(document).on('turbolinks:request-start', function () {
  $('.loading-caption').removeClass('hidden')
})

$(document).on('turbolinks:request-end', function () {
  $('.loading-caption').addClass('hidden')
})

$(document).on('turbolinks:load', function () {
  $('[autofocus]').focus()
})
