class Sheets::DungeonWorld::Stat
  include ActiveModel::API

  attr_accessor :value

  def as_json
    value
  end
end
