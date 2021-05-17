import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["container", "button"]
  
  loadMore(){
    console.log(this.containerTarget, this.buttonTarget)
  }
}