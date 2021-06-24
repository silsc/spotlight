import { Controller } from "stimulus";

function getUrlParams(search) {
  const hashes = search.slice(search.indexOf('?') + 1).split('&')
  const params = {}
  hashes.map(hash => {
      let [key, val] = hash.split('=')
      key = decodeURIComponent(key)
      if (key.indexOf('[') > -1) { // handle multiple type inputs
          if (typeof params[key] === 'undefined') {
              params[key] = []
          }
          params[key].push(decodeURIComponent(val))
      } else {
          params[key] = decodeURIComponent(val)
      }
  })
  return params;
}

export default class extends Controller {
  static targets = [ 'form', 'checkbox' ];
  connect() {
    const paramsGenres = getUrlParams(window.location.search)["filter[genres][]"];
    const paramsRoles = getUrlParams(window.location.search)["filter[roles][]"];

    this.checkboxTargets.forEach( (checkbox) => {
      const labelText = (checkbox.nextElementSibling.innerText)
      if ((paramsGenres && paramsGenres.includes(labelText)) || paramsRoles && paramsRoles.includes(labelText)) {
        checkbox.checked = true;
      }
    })
  }
  filter(e) {
    this.formTarget.submit()
  }
}
