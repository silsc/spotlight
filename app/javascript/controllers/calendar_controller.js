import { Controller } from "stimulus";
import { caleandar } from "../vendor/caleandar"
export default class extends Controller {
  static targets = ["calendar", "output"]

  renderHtml(events) {
    if (!events.length) {
      return '';
    }

    const formatDate = (eventDate) => {
      const clearDate = eventDate.split('T')
      return clearDate[0]
    }

    const html = events.map(event =>
      `
      <hr/>
      <div class="d-flex flex-column mt-2">
        <p>${formatDate(event.date)}</p>
        <h5 class="px-0">${event.name}</h5>
        <p>${event.location}</p>
      </div>
      `
    );

    console.log(html.join(''))

    return html.join('') + '<hr/>'
  }

  connect() {
    // console.log(this.calendarTarget)
    // console.log('CONNECT', this)
    const main = this;
    //this
    caleandar(this.calendarTarget, [], {
      DayClick(day, month, year) {
        // console.log('CALENDAR DAY CLICK', this)
        // console.log(day, month, year) caleandar function order
        // here goes logic to show daily events
        const pathname = window.location.pathname;
        const userId = pathname.split('/').pop();
        // console.log(userId)
        fetch(`/api/v1/events/${year}-${month}-${day}?user_id=${userId}`)
          .then((res) => res.json())
          .then((data) => main.outputTarget.innerHTML = main.renderHtml(data))
        // .then((data) => console.log(JSON.stringify(data)))
        // {2021: {6: {4: []}}}
      }
    })
  }
}

// ${ year } -${ month } -${ day }?user_id = window.location?