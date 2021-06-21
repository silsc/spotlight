import { Controller } from "stimulus";
import autoComplete from "@tarekraafat/autocomplete.js";

export default class extends Controller {
  static targets = ['input']

  connect() {
    const input = this.inputTarget
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
      // Prepare User's Selected Value
      const selection = feedback.selection.value[feedback.selection.key];
      // Render selected choice to selection div
      // document.querySelector(".selection").innerHTML = selection;
      // Replace Input value with the selected value
      autoCompleteJS.input.value = selection;
      // Console log autoComplete data feedback
      console.log(feedback);
    });
  }
}
