require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "should create project" do
    visit projects_url
    click_on "New project"

    fill_in "Backings count", with: @project.backings_count
    fill_in "Current donation amount", with: @project.current_donation_amount
    fill_in "Donation goal", with: @project.donation_goal
    fill_in "Expires at", with: @project.expires_at
    fill_in "Status", with: @project.status
    fill_in "Title", with: @project.title
    fill_in "User", with: @project.user_id
    click_on "Create Project"

    assert_text "Project was successfully created"
    click_on "Back"
  end

  test "should update Project" do
    visit project_url(@project)
    click_on "Edit this project", match: :first

    fill_in "Backings count", with: @project.backings_count
    fill_in "Current donation amount", with: @project.current_donation_amount
    fill_in "Donation goal", with: @project.donation_goal
    fill_in "Expires at", with: @project.expires_at
    fill_in "Status", with: @project.status
    fill_in "Title", with: @project.title
    fill_in "User", with: @project.user_id
    click_on "Update Project"

    assert_text "Project was successfully updated"
    click_on "Back"
  end

  test "should destroy Project" do
    visit project_url(@project)
    click_on "Destroy this project", match: :first

    assert_text "Project was successfully destroyed"
  end
end
