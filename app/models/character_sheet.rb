class CharacterSheet < ApplicationRecord
  belongs_to :keeper, class_name: 'User', foreign_key: 'keeper_id'
  belongs_to :character

  after_initialize :post_init

  def post_init
    self.level ||= 1
  end
end
