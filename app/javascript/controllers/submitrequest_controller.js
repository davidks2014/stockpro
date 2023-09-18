import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submitrequest"
export default class extends Controller {
  static targets = ["location"]
  connect() {
    console.log("Its connected to submit request stimulus controller")
  }

  submit(event) {
    event.preventDefault()
    console.log(event.currentTarget, "request submitted")
    //this is location id
    console.log(this.locationTarget.value, "this is location_id")
  }
}
