import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "counter", "price" ]

  increment(event) {
    let offsetValue = Number(event.path[0].dataset.offset)
    if ( (Number(this.counterTarget.innerText) > 1 && offsetValue == -1) || (Number(this.counterTarget.innerText) < 10 && offsetValue == 1) ) {
      this.counterTarget.innerText = Number(this.counterTarget.innerText) + offsetValue

    }
  }
}
