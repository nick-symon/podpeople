import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["container", "button"]
  static values = {current: Number, total: Number, url: String}
  
  loadMore(){
    if (this.currentValue < this.totalValue) {
      this.currentValue++
      let url = this.urlValue.slice(0,-1)+this.currentValue
      fetch(url)
        .then(response => response.text())
        .then(html => console.log(html))
    }
  }
}