$(document).on 'page:before-change', -> $('.loading-caption').removeClass 'hidden'
$(document).on 'page:load',          -> $('.loading-caption').addClass    'hidden'
