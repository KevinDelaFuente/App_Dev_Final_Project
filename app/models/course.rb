# == Schema Information
#
# Table name: courses
#
#  id             :integer          not null, primary key
#  description    :string
#  hours_required :integer
#  likes_count    :integer
#  rating         :float
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  professor_id   :integer
#  skill_id       :integer
#
class Course < ApplicationRecord

  has_many(:likes, { :class_name => "Like", :foreign_key => "course_id", :dependent => :destroy })

  has_many(:skillsets, { :class_name => "Skillset", :foreign_key => "course_id" })

  belongs_to(:professor, { :required => false, :class_name => "Professor", :foreign_key => "professor_id" })

  

end
