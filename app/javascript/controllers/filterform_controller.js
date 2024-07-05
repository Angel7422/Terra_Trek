import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "filterForm" ]

// Connects to data-controller="filterform"
    connect() {
      console.log("Hello from filterform_controller.js")
      console.log(this.filterFormTarget)
    }
    filterForm() {
      this.filterFormTarget.classList.toggle("d-none");
    }
}
