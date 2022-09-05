# frozen_string_literal: true

require 'test_helper'

class CharacterSheetsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @character = characters(:adthran)
    @character_sheet = character_sheets(:adthran)
  end

  test '404 if not logged in' do
    get character_sheets_url(@character)
    assert_redirected_to new_user_session_path
  end

  test "should get index" do
    login_as users(:example_player)

    get character_sheets_url(@character)
    assert_response :success
  end

  test "should get new character sheet" do
    login_as users(:example_player)

    get new_character_sheet_url(@character)
    assert_response :success
  end

  test "should create the sheet for the character" do
    new_character = Character.create!(keeper: users(:example_player), name: "Test A")
    login_as users(:example_player)

    assert_difference("CharacterSheet.count") do
      post character_sheets_url(new_character), params: { character_sheet: { level: 1 } }
    end

    assert_redirected_to character_sheets_url(new_character, CharacterSheet.last)
  end

  test "should show character sheet" do
    login_as users(:example_player)

    get character_sheets_url(@character, @character_sheet)
    assert_response :success
  end

  test "should get edit" do
    login_as users(:example_player)

    get edit_character_sheet_url(@character, @character_sheet)
    assert_response :success
  end

  test "should update character" do
    login_as users(:example_player)

    patch character_url(@character), params: { character: { level: @character.name } }
    assert_redirected_to character_url(@character)
  end

  test "should destroy character sheet" do
    login_as users(:example_player)

    assert_difference("CharacterSheet.count", -1) do
      delete character_sheet_url(@character, @character_sheet)
    end

    assert_redirected_to character_sheets_url
  end
end
