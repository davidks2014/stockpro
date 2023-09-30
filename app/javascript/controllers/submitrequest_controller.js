import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submitrequest"
export default class extends Controller {
  static targets = ["location", "itemType"]
  connect() {
    console.log("The submitrequest controller works!")
  }

  submit(event) {
    console.log(this.locationTarget.value)
    event.preventDefault();
    const items = document.querySelectorAll('[name="qty"]')

    const request = {
      location_id: this.locationTarget.value,
      items: []
    }
    items.forEach((item) => {
      if (item.value) {
        console.dir(item)
        request.items.push({
          item_type: item.id.split('-')[0],
          item_id: item.id.split('-')[1],
          qty: item.value
        })
      }
    })


    const body = new FormData(event.currentTarget)
    body.append("data", JSON.stringify(request))

    console.log(body)

    console.log(request)
    console.log(event.currentTarget)
    fetch(event.currentTarget.action, { method: "POST", headers: {
      "Accept": "application/json",
    }, body: body })
    .then(response => response.json())
    // data = { item_request: "......", request_id: "......" }
    // or
    // data = { errors: "....."}
    .then((data) => {
      console.log(data)
      if (data.errors) {
        window.alert(data.errors)
      } else {
        window.location.href = `/requests/${data.request_id}`;
      }
    })
  }
}
