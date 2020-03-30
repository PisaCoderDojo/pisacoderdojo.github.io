var iCalendarData = "BEGIN:VCALENDAR\n" +
    "CALSCALE:GREGORIAN\n" +
    "PRODID:-//Example Inc.//Example Calendar//EN\n" +
    "VERSION:2.0\n" +
    "BEGIN:VEVENT\n" +
    "DTSTAMP:20080205T191224Z\n" +
    "DTSTART:20081006\n" +
    "SUMMARY:Planning meeting\n" +
    "UID:4088E990AD89CB3DBB484909\n" +
    "END:VEVENT\n" +
    "BEGIN:VEVENT\n" +
    "DTSTAMP:20210205T191224Z\n" +
    "DTSTART:20081006\n" +
    "SUMMARY:Planning meeting2\n" +
    "UID:4088E990AD89CB3DBB484909\n" +
    "END:VEVENT\n" +
    "END:VCALENDAR";

// TODO: fixare il problema di cross origin policy
const URL = "https://zen.coderdojo.com/api/3.0/dojos/9592081b-bc35-4cce-9794-013d7348587a/events.ics"
fetch(URL)
    .then((resp) => console.log(resp)) 
    .then(function (data) {
        // Create and append the li's to the ul
    })

var jcalData = ICAL.parse(iCalendarData);
console.log(jcalData);
var comp = new ICAL.Component(jcalData);
var vevent = comp.getAllSubcomponents("vevent");
console.log(vevent)
let now_date = ICAL.Time.now();
let next_event = null;
vevent.forEach(e => {
    let start_date = e.getFirstPropertyValue("dtstamp")
    if (start_date.compare(now_date) > 0) {
        if (next_event == null || start_date.compare(next_event) < 0) {
            next_event = start_date;
        }
    }
});
if (next_event != null) {
    console.log("next event", next_event.toString())
} else {
    console.log("no event")
}