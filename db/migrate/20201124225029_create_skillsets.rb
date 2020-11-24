class CreateSkillsets < ActiveRecord::Migration[6.0]
  def change
    create_table :skillsets do |t|
      t.integer :skill_id
      t.integer :careerpath_id

      t.timestamps
    end
  end
end
