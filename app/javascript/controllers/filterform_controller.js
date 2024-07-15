import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filterform"
export default class extends Controller {
  static targets = ["filterForm"]

  connect() {
    console.log("Hello from filterform_controller.js")
    console.log(this.filterFormTarget)
  }

  toggleFilterForm() {
    console.log("Toggling filter form visibility")
    this.filterFormTarget.classList.toggle("hidden")
  }
}
