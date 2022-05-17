import { Controller } from "stimulus"
import Typed from "typed.js";


export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ['🌱 🪴 🌵 🌿 ☘️ 🌲 🌳 🌴 🌱 🪴 🌵 🌿 🌱 🪴 🌵 🌿 ☘️ 🌲 🌳 🌴 🌱 🪴 🌵 🌿 ☘️ 🌲 🌳 🌴 '],
      typeSpeed: 100,
      loop: false,
      showCursor: false
    });
  }
}
