import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submitrequest"
export default class extends Controller {
  static targets = ["location"]
  connect() {
    console.log("Its connected to submit request stimulus controller")
    console.log(this.locationTarget)
  }

  submit() {
    console.log(this.locationTarget)
  }
}
