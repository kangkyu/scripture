class CreateVerses < ActiveRecord::Migration[5.2]
  def change
    create_table :verses do |t|
      t.string :book
      t.integer :chapter
      t.integer :number
      t.text :text
      t.string :edition

      t.timestamps
    end
  end
end
