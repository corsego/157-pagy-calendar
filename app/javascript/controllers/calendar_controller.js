import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['cell']

  connect() {
    console.log('Calendar controller connected')
    const container = document.getElementById('journal-container');
    const scrollTopBefore = container.scrollTop;

    const direction = this.element.dataset.direction;

    const newItemsHeight = this.element.clientHeight; // clientHeight/offsetHeight

    if (direction === 'past') {
      // Adjust the scroll position
      container.scrollTop = scrollTopBefore + newItemsHeight;

      this.element.classList.remove('hidden')

    } else {
       // Not sure I need this anymore.
      this.element.classList.remove('hidden')
    }
  }
}
