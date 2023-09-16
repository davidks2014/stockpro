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
        // console.log("data", data)
        // console.log(this.itemsTarget.outerHTML)
        // replaces the existing HTML content of the <tbody> element
        // with the updated HTML content received from the server.
        // This effectively updates the table in the browser with the new data.
        this.itemsTarget.outerHTML = data
        //is assigning the outerHTML property of the itemsTarget to the data that was retrieved from the server using fetch.
        //In this specific case, the line of code is assigning the data to the outerHTML property of the itemsTarget.
        //The data is expected to be a string containing the updated HTML content for the <tbody> element.
      })
  }
}
