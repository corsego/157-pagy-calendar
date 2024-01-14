import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = [ "prevlink", "week" ]
  static values = { currentWeek: String }

  connect() {
    this.scrollToCurrentWeek()
    this.prevlinkTarget.classList.remove('hidden')
  }

  scrollToCurrentWeek() {
    const currentWeekTarget = this.weekTargets.find(week => week.id === this.currentWeekValue)
    currentWeekTarget.scrollIntoView()
  }
}
