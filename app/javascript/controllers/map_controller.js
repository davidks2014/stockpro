import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = { apiKey: String }
  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    const map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/mapbox/streets-v12', // style URL
    });
  }
}
