import { Controller } from "stimulus";

export default class extends Controller {
  flip(e) {
    // console.log(e.currentTarget)
    e.currentTarget.classList.toggle('flip')
  }
}
