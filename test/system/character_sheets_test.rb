require "application_system_test_case"

class CharacterSheetsTest < ApplicationSystemTestCase
  setup do
    @character_sheet = character_sheets(:one)
  end

  test "visiting the index" do
    visit character_sheets_url
    assert_selector "h1", text: "Character sheets"
  end

  test "should create character sheet" do
    visit character_sheets_url
    click_on "New character sheet"

    fill_in "Character", with: @character_sheet.character_id
    fill_in "Data", with: @character_sheet.data
    fill_in "Keeper", with: @character_sheet.keeper_id
    fill_in "Level", with: @character_sheet.level
    fill_in "Version", with: @character_sheet.version
    click_on "Create Character sheet"

    assert_text "Character sheet was successfully created"
    click_on "Back"
  end

  test "should update Character sheet" do
    visit character_sheet_url(@character_sheet)
    click_on "Edit this character sheet", match: :first

    fill_in "Character", with: @character_sheet.character_id
    fill_in "Data", with: @character_sheet.data
    fill_in "Keeper", with: @character_sheet.keeper_id
    fill_in "Level", with: @character_sheet.level
    fill_in "Version", with: @character_sheet.version
    click_on "Update Character sheet"

    assert_text "Character sheet was successfully updated"
    click_on "Back"
  end

  test "should destroy Character sheet" do
    visit character_sheet_url(@character_sheet)
    click_on "Destroy this character sheet", match: :first

    assert_text "Character sheet was successfully destroyed"
  end
end
