import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="selectlocation"
export default class extends Controller {
  static targets = ["form","items"]
  connect() {
    console.log("The selectlocation controller works!")
  }

  filter(event) {
    console.log(event.currentTarget.value)
    // This line of code is to fetch the data of specific location follow the location id
    const url = `${this.formTarget.action}?location=${event.currentTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        //console.log(data)
        this.itemsTarget.outerHTML = data
      })
  }
}
