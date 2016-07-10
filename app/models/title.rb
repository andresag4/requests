# == Schema Information
#
# Table name: titles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Title < ActiveRecord::Base
  has_many :general_informations

  validates_presence_of :name
end
