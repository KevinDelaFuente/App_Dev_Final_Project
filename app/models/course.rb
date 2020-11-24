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
end
