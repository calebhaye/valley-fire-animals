require 'rails_helper'

describe "Home Page" do
  it "renders" do
    visit "/"
    expect(page).to have_content "Sonoma County Fires"
    expect(page).to have_content "Lost & Found"
  end

  it "accepts reports" do
    visit "/"
    click_link "Report an Animal"
    expect(current_path).to eq "/reports/new"
  end
end
