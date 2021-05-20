import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["tab", "pane"]
  static values = {activeClass: String, index: Number}

 initialize(){
   this.showTab()
 }

  switch(e){
    this.indexValue = this.tabTargets.indexOf(e.target.parentNode)
    this.showTab()
  }

  showTab(){
    this.tabTargets.forEach((e,i) => {
      if (i==this.indexValue){
        e.classList.add(this.activeClassValue)
      } else {
        e.classList.remove(this.activeClassValue)
      }
    })

    this.paneTargets.forEach((e,i) => {
      e.hidden = i != this.indexValue
    })

  }
}