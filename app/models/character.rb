class Character < ApplicationRecord
  belongs_to :keeper, class_name: 'User', foreign_key: 'keeper_id'
end