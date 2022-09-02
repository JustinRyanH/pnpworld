import { Controller } from "@hotwired/stimulus"

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
    this.element.remove();
  };

  onKeyPress = (event) => {
    console.log(event);
  }


  onClickAway = event => {
    if (!this.mainPanelTarget.contains(event.target)) {
      this.close()
    }
  };
}
