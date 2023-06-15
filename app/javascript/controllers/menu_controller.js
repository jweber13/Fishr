import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="menu"
export default class extends Controller {
  static targets = ["dropdown"];
  connect() {
    console.log("menu connected");
  }

  toggleDropdown() {
    this.dropdownTarget.classList.toggle("hidden");
  }

  removeHide() {
    this.dropdownTarget.classList.remove("hidden");
  }
}
