class DropNameTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :skills
    drop_table :credits
  end
end
