class AddIndexNotToDuplicate < ActiveRecord::Migration[5.2]
  def change
    add_index :verses, [:book, :chapter, :number], unique: true
  end
end
