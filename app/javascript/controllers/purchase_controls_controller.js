import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "counter", "price", "price_per", "num_available" ]

  #updateNumbers = (count) => {
    const cost = this.price_perTarget.dataset.costper * count;
    this.priceTarget.value = `Pay ${cost.toFixed(2)}`;
  }

  #maxNumbers = () => {
    const num = this.num_availableTarget.dataset.numavailable;
    return num;
  }

  increment(event) {
    let offsetValue = Number(event.path[0].dataset.offset);
    if ( (Number(this.counterTarget.value) > 1 && offsetValue == -1) || (Number(this.counterTarget.value) < this.#maxNumbers() && offsetValue == 1) ) {
      this.counterTarget.value = Number(this.counterTarget.value) + offsetValue;
      this.#updateNumbers(this.counterTarget.value);

    }
  }

};
