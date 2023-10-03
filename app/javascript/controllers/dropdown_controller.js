import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["one", "two", "three"]
  connect() {
    console.log("The dropdown controller works!")
    console.log(this.avatarTarget)
  }

  click(e) {
    const dropdowns = document.querySelectorAll('.dropdown-menu')
    dropdowns.forEach((dropdown) => {
      dropdown.classList.remove('active')
    })
    console.log(e.target)
    switch (e.target.id) {
      case 'one':
        this.oneTarget.classList.toggle('active')
        break;
        case 'two':
        this.twoTarget.classList.toggle('active')
        break;
        case 'three':
        this.threeTarget.classList.toggle('active')
        break;
    }
  }
}
