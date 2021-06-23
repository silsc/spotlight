import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    console.log('hello world')
  }
  flip(e) {
    console.log(e.currentTarget)
    e.currentTarget.classList.toggle('is-flipped')
  }
}
