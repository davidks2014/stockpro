import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["avatar"]
  connect() {
    console.log("The dropdown controller works!")
    console.log(this.avatarTarget)
  }

  click(event) {

    let dropdowns = document.querySelectorAll(".dropdown-menu");
    let buttons = document.querySelectorAll(".nav-item.dropdown");
    // let buttons = document.querySelectorAll(".nav-item dropdown");
    // console.log(buttons, "nav")
    console.log(event, "clicked")
    //dropdown.classList.toggle("active");
    dropdowns.forEach((dropdown) => {
      dropdown.classList.toggle("active");
    });
  }
}
