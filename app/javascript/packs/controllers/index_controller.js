import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["container", "button"]
  static values = {current: Number, total: Number, url: String}
  
  loadMore(){
    console.log(this.currentValue, this.totalValue, this.urlValue)
  }
}