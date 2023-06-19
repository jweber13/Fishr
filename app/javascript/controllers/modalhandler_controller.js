import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modalhandler"

export default class extends Controller {
  static targets = ['modal'];

  initialize() {
    // let modal = document.getElementById("modal");
    // modal.style.display = 'none';
  }

  connect() {
    console.log("hi there, this is the modal controller.");
    console.log(this.modalTarget);
  }

  open() {
    // console.log("opening");
    let modal = document.getElementById("modal");
    // this.modalTarget.style.display = 'flex';
    // this.fadeIn();
    modal.style.display = 'flex';
    this.fadeIn();
  }

  cancel() {
    console.log("cancel");
    this.fadeOut();
  }

  fadeIn() {
    let opacity = 0;
    let modal = document.getElementById("modal");
    const fade = () => {
      if (!((opacity += 0.2) > 1)) {
        // this.modalhandlerTarget.style.opacity = opacity;
        modal.style.opacity = opacity;
        requestAnimationFrame(fade);
      }
    };
    fade();
  }

  fadeOut() {
    // console.log(`this is the el: ${document.getElementById("modal")}`);
    let modal = document.getElementById("modal");
    console.log(`this is this: ${this}`);
    let opacity = 1;
    const fade = () => {
      if ((opacity -= 0.1) < 0) {
        modal.style.display = 'none';
      } else {
        modal.style.opacity = opacity;
        requestAnimationFrame(fade);
      }
    };
    fade();
  }
}
