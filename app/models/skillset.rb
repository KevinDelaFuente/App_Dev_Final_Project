# == Schema Information
#
# Table name: skillsets
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  careerpath_id :integer
#  skill_id      :integer
#
class Skillset < ApplicationRecord
end
