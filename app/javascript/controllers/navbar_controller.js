import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ['openButton', 'menuContainer']
  connect() {
  }

  get openButton() {
    return this.openButtonTarget;
  }

  toggle() {
    let isMenuClosed = this.openButton.getAttribute('aria-expanded') === 'false';
    isMenuClosed ? this.openMobileMenu() : this.closeMobileMenu();
  }

  closeMobileMenu() {
    this.openButton.setAttribute('aria-expanded', 'false');
    this.menuContainerTarget.classList.add('hidden');
    document.body.removeEventListener('click', this.onClickAway);
  }

  openMobileMenu() {
    this.openButton.setAttribute('aria-expanded', 'true');
    this.menuContainerTarget.classList.remove('hidden');
    document.body.addEventListener('click', this.onClickAway);
  }

  onClickAway = event => {
    if (!this.element.contains(event.target)) {
      this.closeMobileMenu()
    }
  };
}
