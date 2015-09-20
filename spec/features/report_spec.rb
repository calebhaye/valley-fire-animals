require 'rails_helper'

describe "Reports" do
  before do
    %w(Cat Dog).each { |type| AnimalType.create!(name: type) }
  end

  it "new" do
    create_report
    expect(page).to have_content "Report was successfully created."

    visit "/reports"
    expect(page).to have_content "Cat, Cinimon Tortoise Shell"
    expect(page).to have_content "Dog"
    report = Report.first
    expect(report.report_type).to eq "found"
    expect(report.animal_type).to eq AnimalType.find_by(name: "Dog")
  end

  it "requires fields" do
    visit "reports/new"
    # Fill in nothing.
    click_button "Create Report"
    error_heading = "5 errors prohibited this report from being saved"
    expect(page).to have_content error_heading
    expect(page).to have_content "Report type can't be blank"
    expect(page).to have_content "Summary can't be blank"
    expect(page).to have_content "Reporter name can't be blank"
    expect(page).to have_content "Reporter contact info can't be blank"
    expect(page).to have_content "Animal type can't be blank"
  end

  it "caps summary length" do
    visit "reports/new"
    fill_in "Summary", with: "a" * 41
    click_button "Create Report"
    expect(page).to have_content "Summary is too long"
  end
  
  describe "show" do
    it 'can be marked reunited' do
      create_report
      visit "/reports/1"
      click_button("Yes, this animal and its owner are reunited")
      expect(page).to have_content "Congratulations"
      visit "/reports/1"
      expect(page).to have_content "This animal has been returned home :)"
      expect(page).to \
        have_content "We've been told this animal is reunited with its owner."
    end
  end
  
  private
  
  def create_report
    visit "reports/new"
    fill_in "Summary", with: "Cat, Cinimon Tortoise Shell"
    choose "Dog"
    fill_in "Description", with: "Found east of Calistoga.  Tags say 'Smith'."
    choose "I found"
    fill_in "Reporter name", with: "Marcel Cary"
    fill_in "Reporter contact info", with: "Tweet at @marcelcary"
    click_button "Create Report"
    expect(page).to have_content "Report was successfully created."
  end
end
