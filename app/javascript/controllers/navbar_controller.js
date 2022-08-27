import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ['openButton']
  connect() {
  }

  toggle() {
    const openButton = this.openButtonTarget;
    let isMenuClosed = openButton.getAttribute('aria-expanded') === 'false';
    isMenuClosed ? this.openMobileMenu(openButton) : this.closeMobileMenu(openButton);
  }

  closeMobileMenu(openButton) {
    openButton.setAttribute('aria-expanded', 'false');
  }

  openMobileMenu(openButton) {
    openButton.setAttribute('aria-expanded', 'true');
  }
}
