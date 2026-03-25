import { Calendar } from '@fullcalendar/core'
import dayGridPlugin from '@fullcalendar/daygrid'
import timeGridPlugin from '@fullcalendar/timegrid'
import interactionPlugin from '@fullcalendar/interaction'
import bootstrap5Plugin from '@fullcalendar/bootstrap5'

document.addEventListener('turbo:load', () => {
  const el = document.getElementById('calendar')

  if (!el) return

  const familyId = el.dataset.familyId

  const calendar = new Calendar(el, {
    plugins: [dayGridPlugin, timeGridPlugin, interactionPlugin, bootstrap5Plugin],
    initialView: 'dayGridMonth',
    themeSystem: 'bootstrap5',
    headerToolbar:
    {
      start: 'prev,next today',
      center: 'title',
      end: 'dayGridMonth,timeGridWeek,timeGridDay' // will normally be on the right. if RTL, will be on the left
    },
    buttonIcons:
    { prev: 'chevron-left',
      next: 'chevron-right' },
    events: `/families/${familyId}/events.json`
  })

  calendar.render()
})
