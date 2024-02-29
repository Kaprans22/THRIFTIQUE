import { Controller } from "@hotwired/stimulus"

const pickupPoints = [
  {lat: 22, lng: 14, address: "123 Main St"},
]

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}
