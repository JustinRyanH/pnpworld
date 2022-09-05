class CreateCharacterSheets < ActiveRecord::Migration[7.0]
  def change
    create_table :character_sheets do |t|
      t.references :keeper, null: false, foreign_key: { to_table: :users}
      t.references :character, null: false, foreign_key: true
      t.integer :level
      t.json :data
      t.integer :version

      t.timestamps
    end
  end
end
