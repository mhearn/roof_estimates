class User < ActiveRecord::Base
  attr_accessible :company, :email, :name
  has_many :estimates
end
