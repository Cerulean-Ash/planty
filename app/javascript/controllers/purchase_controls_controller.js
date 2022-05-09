import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "counter" ]

  increment() {
    this.counterTarget.innerText = Number(this.counterTarget.innerText) + 1
    this.dataset.count = Number(this.dataset.count) + 1;
  }
}
