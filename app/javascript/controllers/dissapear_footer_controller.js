import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dissapear-footer"
export default class extends Controller {
  static targets = ["footer"]
  connect() {
    console.log(this.footerTarget);

  }

  hide() {
    const scrollY = window.scrollY
    // const scrollThreshold = 100;
    console.log(scrollY);

    const opacity = 1 - (scrollY / 100)
    console.log("opacity: ", opacity);
    this.footerTarget.style.opacity = opacity

    if (opacity < 0) {
      this.footerTarget.style.display = 'none'
    } else {
      this.footerTarget.style.display = 'block'
    }



    // if (scrollY >= scrollThreshold) {
    //   this.footerTarget.style.opacity = 0
    //   setTimeout(() => {
    //     this.footerTarget.classList.add("d-none")
    //   }, 1000)
    // } else {
    //   this.footerTarget.classList.remove("d-none")
    //   setTimeout(() => {
    //     this.footerTarget.style.opacity = 1
    //   }, 1000)
    // }
  }
}
