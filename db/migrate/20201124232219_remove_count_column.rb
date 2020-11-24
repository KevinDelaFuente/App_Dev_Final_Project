class RemoveCountColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :credits_count
  end
end
