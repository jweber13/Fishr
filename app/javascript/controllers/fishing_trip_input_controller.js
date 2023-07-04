import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="fishing-trip-input"
export default class extends Controller {
  static targets = ["nameInput", "modal"];

  connect() {
  }

  create() {
    const name = this.nameInputTarget.value;
    const tripData = { name };

    fetch("/fishing_trips", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector(
          'meta[name="csrf-token"]'
        ).getAttribute("content"),
      },
      body: JSON.stringify(tripData),
    })
      .then((response) => response.json())
      .then((data) => {
        // Handle the response data here
        console.log(data);
        if (data.status == "created") {
          // Currently, the window will close, but we'll have to re-route this to the #show page soon after upon creation.
          // let modal = document.getElementById("modal");
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
      })
      .catch((error) => {
        // Handle any errors here
        console.error(error);
      });
  }
}
