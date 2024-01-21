import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autoscroll"
export default class extends Controller {
  connect() {
    console.log("Autoscrolling")
    this.element.scrollIntoView()
  }
}
