# frozen_string_literal: true

require 'test_helper'

class CharactersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @character = characters(:adthran)
  end

  test '404 if not logged in' do
    get characters_url
    assert_redirected_to new_user_session_path
  end

  test "should get index" do
    login_as users(:example_player)

    get characters_url
    assert_response :success
  end

  test "should get new" do
    login_as users(:example_player)

    get new_character_url
    assert_response :success
  end

  test "should create character" do
    login_as users(:example_player)

    assert_difference("Character.count") do
      post characters_url, params: { character: { name: @character.name } }
    end

    assert_redirected_to character_url(Character.last)
  end

  test "should show character" do
    login_as users(:example_player)

    get character_url(@character)
    assert_response :success
  end

  test "should get edit" do
    login_as users(:example_player)

    get edit_character_url(@character)
    assert_response :success
  end

  test "should update character" do
    login_as users(:example_player)

    patch character_url(@character), params: { character: { name: @character.name } }
    assert_redirected_to character_url(@character)
  end

  test "should destroy character" do
    login_as users(:example_player)

    assert_difference("Character.count", -1) do
      delete character_url(@character)
    end

    assert_redirected_to characters_url
  end
end
