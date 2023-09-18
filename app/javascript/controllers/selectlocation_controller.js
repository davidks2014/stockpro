import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="selectlocation"
export default class extends Controller {
  static targets = ["form", "items"]
  connect() {
    console.log("Hello from the selectlocation_controller Stimulus controller!")
  }

  filter(event) {
    // console.log(event, "this location had been selected")
    //console.log(event.currentTarget.value)
    // console.log("this should be form", this.formTarget)
    // console.log("this should be items", this.itemsTarget)
    // console.log("where this form sending information", this.formTarget.action)

    const url = `${this.formTarget.action}?location=${event.currentTarget.value}`
    // console.log(url)
    const option = {
      headers: {
        "Accept": "text/plain",
      }
    }
    fetch(url, option)
      .then(response => response.text())
      .then(data => {
        // console.log("Outer", this.itemsTarget.outerHTML)
        // console.log("Inner", this.itemsTarget.innerHTML)
        this.itemsTarget.outerHTML = data
      })
  }
}
