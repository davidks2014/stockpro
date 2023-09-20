import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="changetable"
export default class extends Controller {
  static targets = ["tablerow"]
  connect() {
    console.log("leekoksang connected to changetable")
    console.log("this should be row", this.tablerowTarget)
  }
}
