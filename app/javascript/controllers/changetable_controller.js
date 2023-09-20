import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="changetable"
export default class extends Controller {
  static targets = ["tablerow"]
  connect() {
    console.log('heyyyyyyyyyyyyyyyyyyyyyyyyyyyy')
  }

  hiderow(event) {
    event.preventDefault()
    console.log("this had been submit", event.currentTarget)
    const checkedboxs = document.querySelectorAll('input[type="checkbox"]:checked')
    const selectedRows = []

    console.log(checkedboxs)
    checkedboxs.forEach((checkbox) => {
      const row = checkbox.closest("tr")
      row.classList.add("d-none")
    })
  }
}
