# == Schema Information
#
# Table name: resumes
#
#  id          :integer          not null, primary key
#  request_id  :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Resume < ActiveRecord::Base
  belongs_to :reques
  belongs_to :category

  validates_presence_of :request_id, :category_id
end
