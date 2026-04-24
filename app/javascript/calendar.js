import { Calendar } from '@fullcalendar/core'
import dayGridPlugin from '@fullcalendar/daygrid'
import timeGridPlugin from '@fullcalendar/timegrid'
import listPlugin from '@fullcalendar/list'
import interactionPlugin from '@fullcalendar/interaction'
import bootstrap5Plugin from '@fullcalendar/bootstrap5'

document.addEventListener('turbo:load', () => {
  const el = document.getElementById('calendar')

  if (!el) return

  const familyId = el.dataset.familyId

  const calendar = new Calendar(el, {
    plugins: [dayGridPlugin, timeGridPlugin, listPlugin, interactionPlugin, bootstrap5Plugin],
    initialView: 'dayGridMonth',
    themeSystem: 'bootstrap5',
    timeZone: 'local',
    headerToolbar: {
      start: 'prev,next today',
      center: 'title',
      end: 'listMonth dayGridMonth,timeGridWeek,timeGridDay'
    },
    buttonIcons:
    { prev: 'chevron-left',
      next: 'chevron-right' },
    buttonText: 
    { listMonth: 'list' },
    noEventsText: 'No events this period.',
    events: function(fetchInfo, successCallback, failureCallback) {
      const url = new URL(`/families/${familyId}/events.json`, window.location.origin);

      const params = new URLSearchParams(window.location.search);

      params.forEach((value, key) => {
        url.searchParams.append(key, value);
      });

      fetch(url)
        .then(response => response.json())
        .then(data => successCallback(data))
        .catch(error => failureCallback(error));
    }
  })

  calendar.render()
})