# == Schema Information
#
# Table name: phones
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  tag        :string
#  number     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Phone < ActiveRecord::Base
  validates_numericality_of :number

  belongs_to :user
end
