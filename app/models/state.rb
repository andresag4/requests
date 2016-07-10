# == Schema Information
#
# Table name: states
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class State < ActiveRecord::Base
  has_many :cities
  has_many :contacts

  validates_presence_of :name
end
