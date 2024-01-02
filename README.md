### Hotwire calendar

Calendar types:
- Month
- Week
- Day timeline
  - classic
  - like basecamp

Requirements:
- scroll up to fetch past week/month
- [x] scroll down to fetch next week/month
- scrolling up/down should change the date in browser.
Currently updates only when a frame is loaded.
Maybe a stimulus controller should handle, not turbo_frame: :advance.
When the bottom/top of "week/month" is visible, Turbo can push url?
- time within day (week/day calendar)
- turn week & month views into wrappes around content? (reusability)
- mobile responsive?
