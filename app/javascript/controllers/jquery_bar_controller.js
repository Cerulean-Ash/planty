import { Controller } from "stimulus"
import $ from "jquery"
import "jquery-bar-rating"
import "jquery-bar-rating/dist/themes/css-stars"
import "jquery-bar-rating/dist/themes/fontawesome-stars"

export default class extends Controller {


  connect() {
    $(this.element).barrating({
      theme: 'css-stars'
    });
  }
}
