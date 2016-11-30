require 'page-object'

class SouthwestHome
  include PageObject

  page_url 'southwest.com'

  text_field(:departure_city, id: 'air-city-departure')
  text_field(:arrival_city, id: 'air-city-arrival')
  button(:search_flights, id: 'jb-booking-form-submit-button')
  list_item(:first_enabled_date, class: 'carouselEnabledSodaIneligible')
  list_items(:flight_dates, class: 'carouselTodaySodaIneligible')
end