# == Schema Information
#
# Table name: colonies
#
#  id         :integer          not null, primary key
#  name       :string
#  postcode   :string
#  city_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Colony < ActiveRecord::Base
  has_many :contacts

  belongs_to :city

  validates_presence_of :name, :city_id
  validates_uniqueness_of :name , scope: [:postcode]
end
