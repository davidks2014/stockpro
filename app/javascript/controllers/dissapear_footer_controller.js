import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dissapear-footer"
export default class extends Controller {
  static targets = ["footer"]
  connect() {
    console.log(this.footerTarget);

  }

  hide() {
    const scrollY = window.scrollY
    // console.log(scrollY);

    const windowHeight = window.innerHeight;
    const documentHeight = document.documentElement.scrollHeight;
    const opacity =scrollY / ( documentHeight - windowHeight )


    console.log("percentage: ", opacity);
    console.log("trueOpacity: ", 1- opacity);

    this.footerTarget.style.opacity = 1 - opacity

    if (opacity > 0.9 ) {
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
