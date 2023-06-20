import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-contacts"
export default class extends Controller {
  static targets = ["list"]

  connect() {
  }

  search(event) {
    event.preventDefault()
    const formData = new FormData(event.currentTarget);
    const query = formData.get('query')
    fetch(`/contacts?query=${query}`, {
      method: "GET",
      headers: { "Accept": "application/json" }})
    .then(response => response.json())
    .then(data => {
      this.listTarget.innerHTML = data.contacts_html
    })
    .catch(error => {
      console.error('Error fetching template:', error);
    });
  }
}
