class CharacterSheet < ApplicationRecord
  belongs_to :keeper, class_name: 'User', foreign_key: 'keeper_id'
  belongs_to :character
end
