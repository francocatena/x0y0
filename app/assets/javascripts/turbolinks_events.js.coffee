Turbolinks.pagesCached 0

$(document).on 'page:fetch',   -> $('.loading-caption').removeClass 'hidden'
$(document).on 'page:receive', -> $('.loading-caption').addClass 'hidden'
$(document).on 'page:load',    -> $('[autofocus]').focus()
