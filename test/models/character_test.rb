require "test_helper"

class CharacterTest < ActiveSupport::TestCase
  test 'valid case' do
    keeper = users(:example_player)
    valid_character = Character.new(name: 'Jim', keeper:)
    assert valid_character.valid?
  end

  test 'requires a name for the character' do
    character_with_nil_name = Character.new(name: nil)
    refute character_with_nil_name.valid?
    assert_not_empty character_with_nil_name.errors[:name]

    character_with_empty_string_name = Character.new(name: '')
    refute character_with_empty_string_name.valid?
    assert_not_empty character_with_empty_string_name.errors[:name]

    character_with_whitespace_name = Character.new(name: ' ')
    refute character_with_whitespace_name.valid?
    assert_not_empty character_with_whitespace_name.errors[:name]
  end

  test 'requires a keeper for character' do
    character_without_keeper = Character.new(name: 'Jim')
    refute character_without_keeper.valid?
    assert_not_empty character_without_keeper.errors[:keeper]
  end
end
