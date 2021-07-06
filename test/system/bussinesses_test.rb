require "application_system_test_case"

class BussinessesTest < ApplicationSystemTestCase
  setup do
    @bussiness = bussinesses(:one)
  end

  test "visiting the index" do
    visit bussinesses_url
    assert_selector "h1", text: "Bussinesses"
  end

  test "creating a Bussiness" do
    visit bussinesses_url
    click_on "New Bussiness"

    check "Interested" if @bussiness.interested
    fill_in "Name", with: @bussiness.name
    fill_in "Neighborhood", with: @bussiness.neighborhood
    fill_in "Street", with: @bussiness.street
    fill_in "Zipcode", with: @bussiness.zipcode
    click_on "Create Bussiness"

    assert_text "Bussiness was successfully created"
    click_on "Back"
  end

  test "updating a Bussiness" do
    visit bussinesses_url
    click_on "Edit", match: :first

    check "Interested" if @bussiness.interested
    fill_in "Name", with: @bussiness.name
    fill_in "Neighborhood", with: @bussiness.neighborhood
    fill_in "Street", with: @bussiness.street
    fill_in "Zipcode", with: @bussiness.zipcode
    click_on "Update Bussiness"

    assert_text "Bussiness was successfully updated"
    click_on "Back"
  end

  test "destroying a Bussiness" do
    visit bussinesses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bussiness was successfully destroyed"
  end
end
