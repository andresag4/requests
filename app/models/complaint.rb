# == Schema Information
#
# Table name: complaints
#
#  id          :integer          not null, primary key
#  request_id  :integer
#  category_id :integer
#  subject     :string
#  notes       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Complaint < ActiveRecord::Base
  belongs_to :request
  belongs_to :category

  validates_presence_of :subject, :category_id
end
