class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.references :keeper, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
