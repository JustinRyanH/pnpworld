import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['mainPanel']
  connect() {
    this.parent = this.element.parentElement;
    document.body.addEventListener('click', this.onClickAway);
  }

  disconnect() {
    document.body.removeEventListener('click', this.onClickAway);
    console.log('disconect', this.parent);
    this.parent.removeAttribute('src');
  }

  close = () => {
    this.element.remove();
  };

  onClickAway = event => {
    if (!this.mainPanelTarget.contains(event.target)) {
      this.close()
    }
  };
}
