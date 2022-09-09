class Character < ApplicationRecord
  belongs_to :keeper, class_name: 'User', foreign_key: 'keeper_id'
  has_many :sheets, class_name: 'CharacterSheet'

  validates :name, presence: true
end
