# == Schema Information
#
# Table name: studies
#
#  id          :integer          not null, primary key
#  institution :string
#  degree      :string
#  end_study   :date
#  resume_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Study < ActiveRecord::Base
  belongs_to :resume
end
