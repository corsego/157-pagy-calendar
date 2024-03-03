import { Controller } from "@hotwired/stimulus"
import { useIntersection } from "stimulus-use"

// Connects to data-controller="autoclick"
export default class extends Controller {
  connect() {
    console.log("Autoclick connected")
    useIntersection(this, {
      threshold: 1
    })
  }

  appear(entry, observer) {
    console.log("Autoclicking")
    console.log(this.element)
    this.element.click()
  }
}
