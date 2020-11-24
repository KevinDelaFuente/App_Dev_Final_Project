# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  credits_count   :integer
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  careerpath_id   :integer
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
