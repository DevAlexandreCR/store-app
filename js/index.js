$(document).ready(function(){
  $('[data-bs-toggle="tooltip"]').tooltip()
  $('[data-bs-toggle="popover"]').popover()
  $('.carousel').carousel({
    interval: 3000
  })

  $('#contact').on('show.bs.modal', function (e) {
    $('#contactBtn').removeClass('bi-chat-dots').addClass('bi-arrow-bar-up')
  })
  $('#contact').on('hidden.bs.modal', function (e) {
    $('#contactBtn').removeClass('bi-arrow-bar-up').addClass('bi-chat-dots')
  })
})