class Estimate < ActiveRecord::Base
  attr_accessible :estimate_id, :shingle_quantity, :shingle_type

  belongs_to :user
end
