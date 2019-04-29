class AddIndexNotToDuplicate < ActiveRecord::Migration[5.2]
  def change
    add_index :verses, [:book, :chapter, :number, :edition], unique: true
  end
end
