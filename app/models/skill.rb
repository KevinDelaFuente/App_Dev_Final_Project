# == Schema Information
#
# Table name: skills
#
#  id                 :integer          not null, primary key
#  description        :string
#  requirements_count :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Skill < ApplicationRecord
end
