import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['mainPanel']
  connect() {
    this.parent = this.element.parentElement;
    this.closeTo = this.element.dataset.closeTo;
    document.body.addEventListener('click', this.onClickAway);
  }

  disconnect() {
    document.body.removeEventListener('click', this.onClickAway);
    this.parent.removeAttribute('src');
    if (this.closeTo) Turbo.visit(this.closeTo);
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
