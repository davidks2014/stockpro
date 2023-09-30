import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dissapear-footer"
export default class extends Controller {
  connect() {
    console.log("hihi")
    window.addEventListener("scroll",()=>{
      const scrollY = window.scrollY
      const scrollThreshold = 100;

      if (scrollY >= scrollThreshold) {
        this.element.style.opacity = 0
      } else {
        this.element.style.opacity = 1
      }
    })
  }
}
