import { Controller } from "stimulus";
import autoComplete from "@tarekraafat/autocomplete.js";

export default class extends Controller {
  static targets = ['input', 'container', 'hidden']


  connect() {
    const input = this.inputTarget
    const container = this.containerTarget
    const hidden = this.hiddenTarget

    const influences = []
    const autoCompleteJS = new autoComplete({
      threshold: 3,
      data: {
        src: async () => {
          const res = await fetch(`/spotify.json?query=${input.value}`)
          const data = await res.json()

          return data.slice(0, 5).map(artist => artist.name)
        }
      },
    });

    autoCompleteJS.input.addEventListener("selection", function (event) {
      const feedback = event.detail;
      autoCompleteJS.input.blur();

      const selection = feedback.selection.value
      autoCompleteJS.input.value = ''

      influences.push(selection)

      hidden.value = influences
      container.insertAdjacentHTML('beforeend', `<span class="badge badge-primary mr-2">${selection}</span>`)
    });
  }
}

