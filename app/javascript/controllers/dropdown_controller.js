import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  connect() {
    console.log("The dropdown controller works!")
  }
  checkShow(dropdown) {
    if (dropdown.classList.contains('show')) {
      dropdown.classList.add('active');
    } else {
      dropdown.classList.remove('active');
    }
  }
  slide(e) {
    console.log(event.currentTarget)
    const dropdown = document.querySelectorAll('.dropdown-menu')
    dropdown.forEach((dropdown) => {
      this.checkShow(dropdown)
    })
  }
}
