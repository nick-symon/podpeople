import { Controller } from "stimulus"
import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = ["container", "button"]
  static values = {current: Number, total: Number, url: String}
  
  loadMore(){
    if (this.currentValue < this.totalValue) {
      this.currentValue++
      let url = this.urlValue.slice(0,-1)+this.currentValue
      Rails.ajax({
        url: url,
        type: "get",
        dataType: "json",
        success: (data) => {
          console.log(data)
        }
      })
    }
  }
}