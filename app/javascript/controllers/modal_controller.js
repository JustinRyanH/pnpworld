import { Controller } from "@hotwired/stimulus"

const closeKeys = ['Escape'];
// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['mainPanel']
  connect() {
    this.parent = this.element.parentElement;
    this.closeTo = this.element.dataset.closeTo;
  }

  disconnect() {
    this.parent.removeAttribute('src');
    if (this.closeTo) Turbo.visit(this.closeTo, { action: 'replace' });
  }

  close = () => {
    this.element.addEventListener('transitionend', (event) => this.element.remove());
    this.element.classList.add('fade-out');
  };

  onKeyUp = (event) => {
    if (!closeKeys.includes(event.key)) return;
    this.close();
  }


  onClickAway = event => {
    if (!this.mainPanelTarget.contains(event.target)) {
      this.close()
    }
  };
}
