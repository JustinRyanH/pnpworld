import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ['openButton']
  connect() {
  }

  toggle() {
    const openButton = this.openButtonTarget;
    const ariaOpen = openButton.getAttribute('aria-expanded');
    if (ariaOpen === 'false') {
      openButton.setAttribute('aria-expanded', 'true');
    } else {
      openButton.setAttribute('aria-expanded', 'false');
    }
  }
}
