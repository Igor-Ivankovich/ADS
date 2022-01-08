require "application_system_test_case"

class AdmincasTest < ApplicationSystemTestCase
  setup do
    @adminca = admincas(:one)
  end

  test "visiting the index" do
    visit admincas_url
    assert_selector "h1", text: "Admincas"
  end

  test "creating a Adminca" do
    visit admincas_url
    click_on "New Adminca"

    click_on "Create Adminca"

    assert_text "Adminca was successfully created"
    click_on "Back"
  end

  test "updating a Adminca" do
    visit admincas_url
    click_on "Edit", match: :first

    click_on "Update Adminca"

    assert_text "Adminca was successfully updated"
    click_on "Back"
  end

  test "destroying a Adminca" do
    visit admincas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Adminca was successfully destroyed"
  end
end
