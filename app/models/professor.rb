# == Schema Information
#
# Table name: professors
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Professor < ApplicationRecord

  has_many(:courses, { :class_name => "Course", :foreign_key => "professor_id" })

end
