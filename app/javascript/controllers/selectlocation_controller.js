import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="selectlocation"
export default class extends Controller {
  static targets = ["form", "items"]
  connect() {
    console.log("Hey, Friend, dont give up !!!selectlocation connected");
  }

  select(event) {
    //at this line, when choose the location, location had been select
    // console.log(event, "location had been selected")
    //at this line, we can check location id by check .value
    console.log(event.currentTarget.value)
    //at this line, we can check form action which the form send information to where
    console.log(this.formTarget.action)
    const url = `${this.formTarget.action}?location=${event.currentTarget.value}`
    //in this line, url = http://localhost:3000/requests/new?location=3
    console.log(url)
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        //console.log(data)
        console.log(this.itemsTarget.outerHTML)
      })
  }
}
