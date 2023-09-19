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
    const selectedItems = this.checkboxTargets.filter((checkbox) => checkbox.checked);
    console.log("this delivery had been submitted", event.currentTarget)
    console.log(selectedItems) // item_requests need to send to create delivery_order
    console.log(event.currentTarget.action) //this is the url weneed to send info to

  }
}
