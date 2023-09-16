import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="selectlocation"
export default class extends Controller {
  static targets = ["items"]
  connect() {
    console.log("Hey, Friend, dont give up !!!selectlocation connected");
  }

  select(event) {
    console.log(event, "location had been selected")
    console.log(event.currentTarget)
  }
}
