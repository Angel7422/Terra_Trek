// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import "@rails/actioncable"

document.addEventListener("turbo:load", () => {
  $('[data-toggle="tooltip"]').tooltip({placement: 'left', html: true})
})
