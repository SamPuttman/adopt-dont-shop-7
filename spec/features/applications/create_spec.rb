require "rails_helper"

RSpec.describe "the application create" do
  it "creates a new application" do

    visit "/applications/new"
    #Then I am taken to the new application page where I see a form
    expect(page).to have_content("New Application")
    #When I fill in this form with my:
    #- Name
    #- Street Address
    #- City
    #- State
    #- Zip Code
    #- Description of why I would make a good home
    fill_in "Applicant name", with: "Sam Puttman"
    fill_in "Address", with: "1940 Key West Drive"
    fill_in "City", with: "Arnold"
    fill_in "State", with: "Missouri"
    fill_in "Zip code", with: 63042
    fill_in "Description of why I would make a good home", with: "Castiel needs a new friend!"

    #And I click submit
    click_button "Submit"
    #Then I am taken to the new application's show page
    new_application = Application.last
    visit "/applications/#{new_application.id}"
    #And I see my Name, address information, and description of why I would make a good home
    expect(page).to have_content("Sam Puttman")
    expect(page).to have_content("1940 Key West Drive")
    expect(page).to have_content("Arnold")
    expect(page).to have_content("Missouri")
    expect(page).to have_content(63042)
    expect(page).to have_content("Castiel needs a new friend!")
    #And I see an indicator that this application is "In Progress"
    expect(page).to have_content("In Progress")
  end
end