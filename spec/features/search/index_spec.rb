require 'rails_helper'

RSpec.describe 'Search Index' do 
  it 'exists' do 
    visit root_path 

    select "Fire Nation", from: :nation
    click_on("Search For Members")

    expect(current_path).to eq(search_path)
  end

  it 'displays the total number of people who live in the Fire Nation' do
    visit root_path 

    select "Fire Nation", from: :nation
    click_on("Search For Members")

    within("#member-count") do
      expect(page).to have_content("Nation Member Count: 97")
    end
  end

  it 'displays a list with the detailed information for the first 25 members of the fire nation' do
    visit root_path 

    select "Fire Nation", from: :nation
    click_on("Search For Members")

    within("#twenty-five-members") do
      expect(page).to have_content("Name: Afiko")
      expect(page).to_not have_content("Name: Fire Navy officer")
    end
  end
end


# When I visit "/"
# and I select "Fire Nation" from the select field 
# And I click "Search For Members"
# Then I should be on the page "/search"
# Then I should see the total number of people who live in the Fire Nation (should be close to 100)
# And I should see a list with the detailed information for the first 25 memebers of the fire nation 

# For each of the members I should see:
# - The name of the member (and photo)
# - the list of allies or "None"
# - The list of enemies or "None" 
# - Any affliiations that the member has
