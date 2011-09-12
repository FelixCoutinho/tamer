class CreateMovements < ActiveRecord::Migration
  def self.up
    create_table :movements do |t|
      t.string :flow
      t.date :date
      t.decimal :value, :precision => 10, :scale => 2
      t.text :observation
      t.integer :account_id

      t.timestamps
    end
  end

  def self.down
    drop_table :movements
  end
end
