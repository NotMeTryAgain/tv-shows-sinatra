require "spec_helper"

feature "user adds a new TV show" do
  # As a TV fanatic
  # I want to add one of my favorite shows
  # So that I can encourage others to binge watch it
  #
  # Acceptance Criteria:
  # * I must provide the title, network, and starting year.
  # * I can optionally provide the final year, genre, and synopsis.
  # * The synopsis can be no longer than 5000 characters.
  # * The starting year and ending year (if provided) must be
  #   greater than 1900.
  # * The genre must be one of the following: Action, Mystery,
  #   Drama, Comedy, Fantasy
  # * If any of the above validations fail, the form should be
  #   re-displayed with the failing validation message.

  scenario "successfully add a new show" do

    visit "/television_shows"
    click_on "Add New Show"
    fill_in "Title", with: "Krumbles"
    fill_in "Network", with: "NBC"
    fill_in "Starting Year", with: "1999"
    fill_in "Ending Year", with: "2001"
    select( 'Action', from: 'Genre')
    click_on "Add TV Show"
    click_on "Krumbles"

    expect(page).to have_content("Krumbles")
    expect(page).to have_content("1999")
    expect(page).to have_content("Action")
  end

  scenario "fail to add a show with invalid information" do

    visit "/television_shows"
    click_on "Add New Show"
    fill_in "Title", with: "Krumbles"
    fill_in "Network", with: "NBC"

    click_on "Add TV Show"

    expect(page).to have_selector("input[value = 'Krumbles']")
    expect(page).to have_selector("input[value = 'NBC']")
    expect(page).to have_content("Starting year can't be blank")

  end
end
