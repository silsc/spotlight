import { Controller } from "stimulus";

const TABS = {
  events: '#events-tab',
  songs: '#songs-tab'
}

export default class extends Controller {
  connect() {
    const url = new URL(window.location.href)

    const tab = url.searchParams.get('tab')

    if (TABS[tab]) {
      document.querySelector(TABS[tab]).click()
    }
  }
}
