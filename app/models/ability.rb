# == Schema Information
#
# Table name: abilities
#
#  id         :integer          not null, primary key
#  name       :string
#  resume_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ability < ActiveRecord::Base
  belongs_to :resume
end
