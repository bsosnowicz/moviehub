require "application_system_test_case"

class FundingsTest < ApplicationSystemTestCase
  setup do
    @funding = fundings(:one)
  end

  test "visiting the index" do
    visit fundings_url
    assert_selector "h1", text: "Fundings"
  end

  test "should create funding" do
    visit fundings_url
    click_on "New funding"

    fill_in "Description", with: @funding.description
    fill_in "Goal amount", with: @funding.goal_amount
    fill_in "Title", with: @funding.title
    fill_in "User", with: @funding.user_id
    click_on "Create Funding"

    assert_text "Funding was successfully created"
    click_on "Back"
  end

  test "should update Funding" do
    visit funding_url(@funding)
    click_on "Edit this funding", match: :first

    fill_in "Description", with: @funding.description
    fill_in "Goal amount", with: @funding.goal_amount
    fill_in "Title", with: @funding.title
    fill_in "User", with: @funding.user_id
    click_on "Update Funding"

    assert_text "Funding was successfully updated"
    click_on "Back"
  end

  test "should destroy Funding" do
    visit funding_url(@funding)
    click_on "Destroy this funding", match: :first

    assert_text "Funding was successfully destroyed"
  end
end
