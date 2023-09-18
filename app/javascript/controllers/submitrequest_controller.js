import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submitrequest"
export default class extends Controller {
  static targets = ["location"]
  connect() {
    console.log("Its connected to submit request stimulus controller")
  }

  submit(event) {
    event.preventDefault
    console.log(event)
  }
}
