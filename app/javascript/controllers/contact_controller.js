import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ["panel", "form"]

  connect() {
  }

  renderNew() {
    fetch("/contacts/new", {
      method: "GET",
      headers: { "Accept": "application/json" }})
    .then(response => response.json())
    .then(data => {
      this.panelTarget.innerHTML = data.new_contact_html
    })
    .catch(error => {
      console.error('Error fetching template:', error);
    });
  }

  renderShow(event) {
    fetch(`/contacts/${event.target.id}`, {
      method: "GET",
      headers: { "Accept": "application/json" }})
    .then(response => response.json())
    .then(data => {
      this.panelTarget.innerHTML = data.contact_html
    })
    .catch(error => {
      console.error('Error fetching template:', error);
    });
  }

  submitNew(event) {
    event.preventDefault();
    const formData = new FormData(this.formTarget);
    fetch(`/contacts/`, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: formData })
    .then(response => response.json())
    .then(data => {
      this.panelTarget.innerHTML = data.html
    })
    .catch(error => {
      console.error('Error fetching template:', error);
    });
  }
}
