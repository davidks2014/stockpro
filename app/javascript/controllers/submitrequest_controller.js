import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submitrequest"
export default class extends Controller {
  static targets = ["location"]
  connect() {
    console.log("Its connected to submit request stimulus controller")
  }

  submit(event) {
    event.preventDefault()
    const form = event.currentTarget

    const location_id = this.locationTarget.value

    const inputs = document.querySelectorAll('input[name="qty"]')

    console.log(inputs)

    const request = {
      location_id: location_id,
      items: []
    }

    inputs.forEach((input)=>{
      if (input.value) {
        request.items.push({
          item_type: input.id.split("-")[0],
          item_id: input.id.split("-")[1],
          qty: input.value
        })
      }
    })

    const formData = new FormData(form)
    formData.append("request", JSON.stringify(request))

    fetch(form.action, {
      method: "POST",
      headers: { "Accept": "application/json",},
      body: formData
    }).then (response => {
        return response.json()
      }).then (data => {
       if (data.success){
        window.location.href = "/"
       }

      })


    //if we console.log fetch, we will get promise object, we will not get the actual response
    //promise is a result that havent been resolved yet
  }
}
// Request.new (location_id)
// ItemRequest.new (item_type, item_id, qty, request_id)
