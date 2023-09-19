import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="confirmdelivery"
export default class extends Controller {
  static targets = ["checkbox"]
  connect() {
    console.log("Hey!!!! You are awesome, keep going on")
  }

  submit(event) {
    //console.log("checkbox", this.checkboxTarget)
    event.preventDefault()
    console.log("this delivery had been submitted", event.currentTarget)
    console.log(this.checkboxTarget.action)
  }
}
