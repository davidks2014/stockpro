import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submitrequest"
export default class extends Controller {
  static targets = ["input"]
  connect() {
    console.log("The submitrequest controller works!")
  }

  submit(event) {
    event.preventDefault();
    const items = document.querySelectorAll('[name="qty"]')
    console.log(items)

  }
}
