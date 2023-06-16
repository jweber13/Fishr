import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-contact"
export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("new-contact controller says hello");
  }

  renderNew() {
    fetch("/contacts/new", {
      method: "GET",
      headers: { "Accept": "application/json" }})
    .then(response => response.json())
    .then(data => {
      console.log(data);
      const html = JSON.stringify(data.html)
      console.log(html);
      this.formTarget.innerHTML = html
    })
    .catch(error => {
      console.error('Error fetching template:', error);
    });
  }
}
