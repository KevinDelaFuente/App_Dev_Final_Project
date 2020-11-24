class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description
      t.integer :professor_id
      t.integer :skill_id
      t.float :rating
      t.integer :hours_required
      t.integer :likes_count

      t.timestamps
    end
  end
end
