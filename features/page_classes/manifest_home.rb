require 'page-object'

class ManifestHome
  include PageObject

  page_url 'http://manifestcorp.com/opportunities/all-opportunities/'

  select_list(:filter_by_location, name: 'opportunity_loc')
  select_list(:filter_by_type, name: 'opportunity_type')
  divs(:location, class: 'opp-loc')
  divs(:type, class: 'opp-type')
end