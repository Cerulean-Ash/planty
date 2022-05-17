import { Controller } from "stimulus";
import $ from "jquery";
import "toastr";

export default class extends Controller {

  // connect() {
  //   console.log('hello')
  //   $(this.element).show(function() {
  //     notification('success', 'this was a success!');
  //   });
  // }

  add(event) {
    console.log(event)
    $(this.element).click(function() {
      notification('success', 'this was a success! Woot Woot');
    });
  }
}

function notification( type, message ) {
	if( type == 'success' ) {
		toastr.success(message,'<i>Success</i>');
	} else if( type == 'error' ) {
		toastr.error(message,'Error');
	} else if( type == 'warning' ) {
		toastr.warning(message,'Warning');
	} else {
		toastr.info(message,'Information');
	}
}
