class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :buyin
      t.integer :prize
      t.integer :variant_id
      t.integer :casino_id

      t.timestamps
    end
  end
end
