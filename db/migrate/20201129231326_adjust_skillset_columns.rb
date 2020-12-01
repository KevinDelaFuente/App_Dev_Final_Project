class AdjustSkillsetColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :skillsets, :course_id, :integer
    remove_column :skillsets, :skill_id
  end
end
