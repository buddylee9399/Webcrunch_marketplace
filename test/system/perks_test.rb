require "application_system_test_case"

class PerksTest < ApplicationSystemTestCase
  setup do
    @perk = perks(:one)
  end

  test "visiting the index" do
    visit perks_url
    assert_selector "h1", text: "Perks"
  end

  test "should create perk" do
    visit perks_url
    click_on "New perk"

    fill_in "Amount", with: @perk.amount
    fill_in "Description", with: @perk.description
    fill_in "Project", with: @perk.project_id
    fill_in "Quantity", with: @perk.quantity
    fill_in "Title", with: @perk.title
    click_on "Create Perk"

    assert_text "Perk was successfully created"
    click_on "Back"
  end

  test "should update Perk" do
    visit perk_url(@perk)
    click_on "Edit this perk", match: :first

    fill_in "Amount", with: @perk.amount
    fill_in "Description", with: @perk.description
    fill_in "Project", with: @perk.project_id
    fill_in "Quantity", with: @perk.quantity
    fill_in "Title", with: @perk.title
    click_on "Update Perk"

    assert_text "Perk was successfully updated"
    click_on "Back"
  end

  test "should destroy Perk" do
    visit perk_url(@perk)
    click_on "Destroy this perk", match: :first

    assert_text "Perk was successfully destroyed"
  end
end
