import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'form', 'checkbox' ];
  connect() {
    // document.querySelector("#filter_genres_jazz").checked = true
    const urlSearchParams = new URLSearchParams(window.location.search);
    const params = Object.fromEntries(urlSearchParams.entries());

    // console.log(params["filter[genres][]"].includes('Rock'))

    console.log(this.checkboxTargets)
  }
  filter(e) {
    this.formTarget.submit()
  }
}
