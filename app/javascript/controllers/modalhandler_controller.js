import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ['modal'];

  initialize() {
  }

  connect() {
    console.log("hi there, this is the modal controller.");
    console.log(this.modalTarget);
  }

  open() {
    this.modalTarget.style.display = 'flex';
    this.fadeIn();
  }

  cancel() {
    console.log("cancel");
    this.fadeOut();
  }

  fadeIn() {
    let opacity = 0;
    const fade = () => {
      if (!((opacity += 0.2) > 1)) {
        this.modalTarget.style.opacity = opacity;
        requestAnimationFrame(fade);
      }
    };
    fade();
  }

  fadeOut() {
    let opacity = 1;
    const fade = () => {
      if ((opacity -= 0.1) < 0) {
        this.modalTarget.style.display = 'none';
      } else {
        this.modalTarget.style.opacity = opacity;
        requestAnimationFrame(fade);
      }
    };
    fade();
  }
}
