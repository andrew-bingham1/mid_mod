require 'rails_helper'

RSpec.describe 'Search Index' do 
  before(:each) do
    visit root_path 

    select "Fire Nation", from: :nation
    click_on("Search For Members")
  end

  it 'exists' do 
    expect(current_path).to eq(search_path)
  end

  it 'displays the total number of people who live in the Fire Nation' do
    within("#member-count") do
      expect(page).to have_content("Nation Member Count: 97")
    end
  end

  it 'displays a list with 25 members of the fire nation' do
    within("#twenty-five-members") do
      expect(page).to have_content("Name: Afiko")
      expect(page).to_not have_content("Name: Great Sage")
      save_and_open_page
    end    
  end

  it 'displays member details' do
    within("#member-5cf5679a915ecad153ab68cc") do
      expect(page).to have_content("Name: Afiko")
      expect(page).to have_content("Allies: Fire Nation")
      expect(page).to have_content("Enemies: Aang")
      expect(page).to have_content("Affiliations: Fire Nation")
    end
  end

  it "displays 'none' for allies or enemies if there are none" do
    within("#member-5cf5679a915ecad153ab691d") do 
      expect(page).to have_content("Allies: None")
      expect(page).to have_content("Enemies: None")
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
