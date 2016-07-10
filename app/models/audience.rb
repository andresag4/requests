# == Schema Information
#
# Table name: audiences
#
#  id          :integer          not null, primary key
#  request_id  :integer
#  category_id :integer
#  subject     :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Audience < ActiveRecord::Base
  belongs_to :request
  belongs_to :category

  validates_presence_of :subject
end
