import { Controller } from "@hotwired/stimulus"
import { useIntersection } from "stimulus-use"

// Connects to data-controller="urldate"
export default class extends Controller {
  static values = { date: String }
  connect() {
    console.log(this.dateValue)
    useIntersection(this, {
      threshold: 0.5
      // threshold: 0.3
    })
  }

  appear(entry, observer) {
    console.log("visible")
    history.pushState({}, '', '?date=' + this.dateValue)
    // scroll this element into view
    // this.element.scrollIntoView({ behavior: "smooth" })
  }
}
