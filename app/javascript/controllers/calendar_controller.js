import { Controller } from "stimulus";
import { caleandar } from "../vendor/caleandar"
export default class extends Controller {
  static targets = ["calendar", "output"]

  connect() {
    const calendarTarget = this.calendarTarget
    const outputTarget = this.outputTarget

    const events = JSON.parse(calendarTarget.dataset.events).map(event => ({
      ...event,
      Date: new Date(event.Date[0], event.Date[1] - 1, event.Date[2])
    }))

    caleandar(calendarTarget, events, {
      DayClick(day, month, year) {
        let events = JSON.parse(calendarTarget.dataset.groupedEvents)
        events = events[year][month][day]

        if (events) {
          outputTarget.innerHTML = events.map(e => e.html).join('')
        } else {
          outputTarget.innerHTML = ""
        }
      }
    })
  }
}
