# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :integer
#  user_id    :integer
#
class Like < ApplicationRecord

  belongs_to(:course, { :required => false, :class_name => "Course", :foreign_key => "course_id", :counter_cache => true })

  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })

end
