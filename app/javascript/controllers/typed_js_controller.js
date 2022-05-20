import { Controller } from "stimulus"
import Typed from "typed.js";


export default class extends Controller {
  connect() {
    new Typed(this.element, {
      // unicode codes used https://unicode.org/emoji/charts/full-emoji-list.html
      strings: ['&#x1f331; &#x1fab4; &#x1f341; &#x1f335; &#x1f33f; &#x1f340; &#x1f332; &#x1f333; &#x1f334; &#x1f343;'],
      typeSpeed: 100,
      loop: false,
      showCursor: false
    });
  }
}
