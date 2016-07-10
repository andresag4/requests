# == Schema Information
#
# Table name: entries
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Entry < ActiveRecord::Base
  has_many :requests

  validates_presence_of :name
end
