import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "counter", "price", "price_per" ]

  updateNumbers = (count) => {
    console.log('hello')
    // const cost = Number(this.price_perTarget.dataset.cost_per) * count
    const cost = this.price_perTarget.dataset.costper * count
    console.log(this.priceTarget.value)
    this.priceTarget.value = `Pay ${cost.toFixed(2)}`
  }

  increment(event) {
    let offsetValue = Number(event.path[0].dataset.offset)
    if ( (Number(this.counterTarget.value) > 1 && offsetValue == -1) || (Number(this.counterTarget.value) < 10 && offsetValue == 1) ) {
      this.counterTarget.value = Number(this.counterTarget.value) + offsetValue
      this.updateNumbers(this.counterTarget.value)
    }
  }

};
