import { Controller } from "@hotwired/stimulus"
import { useIntersection } from "stimulus-use"

// Connects to data-controller="autoclick"
export default class extends Controller {
  connect() {
    useIntersection(this, {
      // threshold: 0.5
      // threshold: 0.3
      // threshold: 1
    })
  }

  appear(entry, observer) {
    console.log("visible")
    this.element.click()

    // history.pushState({}, '', '?date=' + this.dateValue)
    // history.replaceState(history.state, "", this.dateValue);
    // scroll this element into view
    // this.element.scrollIntoView({ behavior: "smooth" })
  }
}
