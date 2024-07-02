import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal", "modalContent"]

  connect() {
    this.modal = document.getElementById('booking-modal')
    this.modalContent = document.getElementById('modal-body')
    this.modal.querySelector('.close-button').addEventListener('click', () => this.close())
  }

  open(event) {
    event.preventDefault()
    fetch(event.target.href, {
      headers: {
        "Accept": "text/vnd.turbo-stream.html"
      }
    })
      .then(response => response.text())
      .then(html => {
        this.modalContent.innerHTML = html
        this.modal.style.display = "block"
      })
  }

  close() {
    this.modal.style.display = "none"
  }
}
