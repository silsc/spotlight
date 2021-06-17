import { Controller } from "stimulus";
import { caleandar} from "../vendor/caleandar"

export default class extends Controller {
    static targets = ["calendar"]

    connect() {
        caleandar(this.calendarTarget, [], {
            DayClick(day, month, year) {
                // here goes logic to show daily events

                // {2021: {6: {4: []}}}
            }
        })
    }
}