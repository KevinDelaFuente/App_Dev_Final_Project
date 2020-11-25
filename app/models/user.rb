# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
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

  has_many(:likes, { :class_name => "Like", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:credits, { :class_name => "Credit", :foreign_key => "user_id", :dependent => :destroy })

  belongs_to(:careerpath, { :required => false, :class_name => "Careerpath", :foreign_key => "careerpath_id" })

end
