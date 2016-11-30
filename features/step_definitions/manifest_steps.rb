require 'page-object'
include PageObject::PageFactory

When(/^I filter jobs by Columbus$/) do
  visit_page(ManifestHome) do |page|
    page.filter_by_location= 'Columbus, OH'
    sleep 5
  end
end

Then(/^only Columbus opportunities are present$/) do
  on_page(ManifestHome) do |page|
    page.location_elements.each do |city|
      expect(city.text).to eq 'Columbus, OH'
    end
  end
end

When(/^I filter jobs by contract$/) do
  visit_page(ManifestHome) do |page|
    page.filter_by_type= 'Contract'
    sleep 5
  end
end

Then(/^only contract opportunities are present$/) do
  on_page(ManifestHome) do |page|
    page.type_elements.each do |job|
      expect(job.text).to eq 'Contract'
    end
  end
end